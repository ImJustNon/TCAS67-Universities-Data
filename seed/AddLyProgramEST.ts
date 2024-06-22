import * as fs from "fs";
import * as path from "path";
import { PrismaClient } from "@prisma/client";
const prisma: PrismaClient = new PrismaClient();


async function AddLyProgramEST(): Promise<void> {
    const programestResultData: string = fs.readFileSync(path.join(__dirname, "../data/ly-programs-est-Result.json"), {
        encoding: "utf8",
    });
    const parseJsonResult: any[] = JSON.parse(programestResultData);
    for(const json of parseJsonResult){
        await prisma.lyProgramsEST.create({
            data: {
                program_id: json.program_id,
                project_id: json.project_id,
                major_id: json.major_id,
                program_name_th: json.program_name_th,
                program_type_name_th: json.program_type_name_th,
                major_name_th: json.major_name_th,
                project_name_th: json.project_name_th,
                min_score: json.min_score,
                max_score: json.max_score,
                min_score_ds: json.min_score_ds,
                max_score_ds: json.max_score_ds,
                est_min_score_mean: json.est_min_score_mean,
                est_min_score_mean_sd: json.est_min_score_mean_sd,
                est_min_score_regression: json.est_min_score_regression,
                receive_student_number: json.receive_student_number,
                scores: JSON.stringify(json.scores)
            }
        });
    }
}


export {
    AddLyProgramEST
}