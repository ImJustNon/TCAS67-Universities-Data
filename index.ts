import * as fs from "fs";
import * as path from "path";
import { PrismaClient } from "@prisma/client";
import axios, { AxiosResponse } from "axios";
import { AddUniversities } from "./seed/AddUniversities";
import { AddCourses } from "./seed/AddCourses";
import { AddRounds } from "./seed/AddRounds";
const prisma: PrismaClient = new PrismaClient();

// const jsonData: string = fs.readFileSync(path.join(__dirname, "./data/courses.json"), {
//     encoding: "utf8"
// });

// const parsedJson: any = JSON.parse(jsonData);
// let r_data: any[] = [];
(async() =>{
    // const getAllProgramId: string = fs.readFileSync(path.join(__dirname, "./temp/json/setProgramId.json"), {
    //     encoding: "utf8",
    // });
    // const parseGetAllProgramId: string[] = JSON.parse(getAllProgramId);
    // for(const programId of parseGetAllProgramId){
    //     try {
    //         const response: AxiosResponse<any, any> = await axios.get(`https://tcas67.s3.ap-southeast-1.amazonaws.com/mytcas/ly-programs-est/${programId}.json`, {
    //             headers: {
    //                 "Content-Type": "application/json"
    //             }
    //         });
    //         const responseData = response.data;
    //         await fs.writeFileSync(path.join(__dirname, "./temp/ly-programs-est", `${programId}.json`), JSON.stringify(responseData), {
    //             encoding: "utf8",
    //         });
    //         // console.log(`✅ | Fetch and Save Success With ProgramID : ${programId}`);
    //     }
    //     catch(e){
    //         console.log(`❌ | Fetch Data Fail With ProgramID : ${programId}`);
    //     }
    // }
    // console.log(parseGetAllProgramId.length)

    // const getAllFileName: string[] = fs.readdirSync(path.join(__dirname, "./temp/rounds")).filter(file => file.endsWith(".json"));
    // for(const fileName of getAllFileName){
    //     const getDataFromFile: string = fs.readFileSync(path.join(__dirname, "./temp/rounds", fileName), {
    //         encoding: "utf8",
    //     });
    //     const parseJsonDataFromFile = JSON.parse(getDataFromFile);
    //     r_data.push(...parseJsonDataFromFile);
    // }
    // fs.writeFileSync("./temp/json/roundsResult.json", JSON.stringify(r_data), {
    //     encoding: "utf8",
    // });

    // const getAllRounds: string = fs.readFileSync(path.join(__dirname, "./temp/json/roundsResult.json"), {
    //     encoding: "utf8",
    // });
    // const parsedAllRounds = JSON.parse(getAllRounds);
    // for(const rounds of parsedAllRounds){
    //     await prisma.rounds.create({
    //         data: {
    //             id: rounds._id,					
    //             university_id: rounds.university_id,
    //             program_id: rounds.program_id,		
    //             project_id: rounds.project_id,			
    //             project_name_th: rounds.project_name_th,			
    //             type: rounds.type,		
    //             receive_student_number: rounds.receive_student_number,	
    //             only_formal: rounds.only_formal,
    //             only_international: rounds.only_international,		
    //             only_vocational: rounds.only_vocational,	
    //             only_non_formal: rounds.only_non_formal,		
    //             only_ged: rounds.only_ged,		
    //             description: rounds.description,				
    //             condition: rounds.condition,			
    //             interview_location: rounds.interview_location,		
    //             interview_date: rounds.interview_date,	
    //             interview_time: rounds.interview_time,		
    //             link: rounds.link,		
    //             grad_current: rounds.grad_current,			
    //             t_score: rounds.t_score,		
    //             min_total_score: rounds.min_total_score,			
    //             scores: rounds.scores ? JSON.stringify(rounds.scores) : null,		
    //             score_conditions: rounds.score_conditions ? JSON.stringify(rounds.score_conditions) : null,		
    //             min_gpax: rounds.min_gpax,	
    //             major_id: rounds.major_id,			
    //             join_id: rounds.join_id,			
    //             min_credit_gpa22_23: rounds.min_credit_gpa22_23,		
    //         }
    //     })

    //     // await prisma.rounds.deleteMany({
    //     //     where: {
    //     //         // id: rounds._id
    //     //     }
    //     // });
    // }

    // merge ly-program-est
    // const allFileName: string[] = fs.readdirSync(path.join(__dirname, "./temp/ly-programs-est"), {
    //     encoding: "utf8",
    // }).filter((filename: string) => filename.endsWith(".json"));
    
    // for(const filename of allFileName){
    //     const filedata: string = fs.readFileSync(path.join(__dirname, "./temp/ly-programs-est", filename), {
    //         encoding: "utf8",
    //     });
    //     const parsedJson: any = JSON.parse(filedata);
    //     r_data.push(...parsedJson);
        
    // }
    // fs.writeFileSync(path.join(__dirname, "./temp/json", "ly-programs-est-Result.json"), JSON.stringify(r_data), {
    //     encoding: "utf8",
    // });
    // console.log("SUCCESS");

    // await prisma.rounds.deleteMany({
    //     where: {

    //     }
    // });
    // await prisma.universities.deleteMany({
    //     where: {

    //     }
    // })

    

    // await prisma.courses.deleteMany({
    //     where: {}
    // })

    

    const response: AxiosResponse = await axios.get("https://tcas67.s3.ap-southeast-1.amazonaws.com/mytcas/universities.json", {
        headers: {
            "Content-Type": "application/json"
        }
    });

    const responseData = response.data;

    // console.log(responseData);

    const mapResponseData = responseData.filter((res: any) => {
        if(!res.file_path_1 && !res.file_path_2 && !res.file_path_3 && !res.file_path_4 && !res.file_path_handicap) return false;
        else return true;
    });
    // console.log(mapResponseData);

    for(const eachResponseData of mapResponseData){
        fs.mkdirSync(path.join(__dirname, "./temp/pdf", eachResponseData.university_name));
        const fileTypes = [
            "file_path_1", "file_path_2", "file_path_3", "file_path_4", "file_path_handicap"
        ];

        for(const typeName of fileTypes){
            if(typeof eachResponseData[typeName] === "undefined") continue;

            fs.mkdirSync(path.join(__dirname, "./temp/pdf", eachResponseData.university_name, typeName));
            const getFileName = getFileNameFromUrl(eachResponseData[typeName]);
            await download(eachResponseData[typeName], path.join(__dirname, "./temp/pdf", eachResponseData.university_name, typeName, getFileName), eachResponseData.university_name, typeName).then(() => console.log(`${eachResponseData.university_name} ${typeName} Success`)).catch(() => console.log(`${eachResponseData.university_name} ${typeName} Error`));
        }
    }

    // await download("https://s3.ap-southeast-1.amazonaws.com/tcas67/917/pdf/1697878543409/NTC TCAS67.pdf", path.join(__dirname, "./temp/pdf/test.pdf")).then(() => console.log("Success"));

    async function download(url: string, path: string, universityName: string, typename: string): Promise<void> {
        try {
            const response = await axios({
                url,
                method: 'GET',
                responseType: 'stream'
            });
    
            const writer = fs.createWriteStream(path);
    
            response.data.pipe(writer);
    
            return new Promise((resolve, reject) => {
                writer.on('finish', resolve);
                writer.on('error', reject);
            });
        }
        catch(error){
            console.error(`${universityName} ${typename} FAIL ${error}`);
        }
    }
    function getFileNameFromUrl(url: string) {
        try {
            // Create a URL object
            let urlObject = new URL(url);
                    
            // Get the pathname from the URL
            let pathname = urlObject.pathname;

            // Extract the file name from the pathname
            let fileName = pathname.substring(pathname.lastIndexOf('/') + 1);

            // Decode the file name in case it contains URL-encoded characters
            return decodeURIComponent(fileName);
        }
        catch(e){
            console.log(`${url} is invalid url`);
            return "defaultName.pdf";
        }
    }
     

})();
