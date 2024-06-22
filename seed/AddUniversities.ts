import * as fs from "fs";
import * as path from "path";
import { PrismaClient } from "@prisma/client";
const prisma: PrismaClient = new PrismaClient();

async function AddUniversities(): Promise<void> {
    const readAllUniversity: string = fs.readFileSync(path.join(__dirname, "../data/universities.json"), {
        encoding: "utf8",
    });
    const parsedToJson = JSON.parse(readAllUniversity);
    for(const json of parsedToJson){
        await prisma.universities.create({
            data: {
                id: json._id,
                university_id: json.university_id,
                university_type: json.university_type,
                university_name: json.university_name,
                university_name_en: json.university_name_en,
                is_accepted_round1: json.is_accepted_round1,
                is_accepted_round2: json.is_accepted_round2,
                is_accepted_round3: json.is_accepted_round3,
                is_accepted_round4: json.is_accepted_round4,
                file_path_1: json.file_path_1,
                file_path_2: json.file_path_2,
                file_path_3: json.file_path_3,
                file_path_4: json.file_path_4,
                file_path_handicap: json.file_path_handicap
            }
        })
    }
}


export {
    AddUniversities
}