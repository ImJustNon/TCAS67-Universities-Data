import * as fs from "fs";
import * as path from "path";
import { PrismaClient } from "@prisma/client";
const prisma: PrismaClient = new PrismaClient();

async function AddRounds(): Promise<void> {
    const readAllRounds: string = fs.readFileSync(path.join(__dirname, "../data/roundsResult.json"), {
        encoding: "utf8",
    });
    const parsedToJson = JSON.parse(readAllRounds);
    for(const json of parsedToJson){
        await prisma.rounds.create({
            data: {
                id: json._id,
                university_id: json.university_id,
                program_id: json.program_id,
                project_id: json.project_id,
                project_name_th: json.project_name_th,
                type: json.type,
                receive_student_number: json.receive_student_number,
                only_formal: json.only_formal,
                only_international: json.only_international,
                only_vocational: json.only_vocational,
                only_non_formal: json.only_non_formal,
                only_ged: json.only_ged,
                description: json.description,
                condition: json.condition,
                interview_location: json.interview_location,
                interview_date: json.interview_date,
                interview_time: json.interview_time,
                link: json.link,
                grad_current: json.grad_current,
                t_score: json.t_score,
                min_total_score: json.min_total_score,
                scores: JSON.stringify(json.scores),
                score_conditions: JSON.stringify(json.score_conditions),
                min_gpax: json.min_gpax,
                major_id: json.major_id,
                join_id: json.join_id,
                min_credit_gpa22_23: json.min_credit_gpa22_23
            }
        });
    }
}


export {
    AddRounds
}