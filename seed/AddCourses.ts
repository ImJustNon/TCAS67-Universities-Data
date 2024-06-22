import * as fs from "fs";
import * as path from "path";
import { PrismaClient } from "@prisma/client";
const prisma: PrismaClient = new PrismaClient();

async function AddCourses(): Promise<void> {
    const readAllCourses: string = fs.readFileSync(path.join(__dirname, "../data/courses.json"), {
        encoding: "utf8",
    });
    const parsedToJson = JSON.parse(readAllCourses);
    for(const json of parsedToJson){
        await prisma.courses.create({
            data: {
                id: json._id,
                university_type_id: json.university_type_id,
                university_type_name_th: json.university_type_name_th,
                university_id: json.university_id,
                university_name_th: json.university_name_th,
                university_name_en: json.university_name_en,
                campus_id: json.campus_id,
                campus_name_th: json.campus_name_th,
                campus_name_en: json.campus_name_en,
                faculty_id: json.faculty_id,
                faculty_name_th: json.faculty_name_th,
                faculty_name_en: json.faculty_name_en,
                group_field_id: json.group_field_id,
                group_field_th: json.group_field_th,
                field_id: json.field_id,
                field_name_th: json.field_name_th,
                field_name_en: json.field_name_en,
                program_running_number: json.program_running_number,
                program_name_th: json.program_name_th,
                program_name_en: json.program_name_en,
                program_type_id: json.program_type_id,
                program_type_name_th: json.program_type_name_th,
                program_id: json.program_id,
                number_acceptance_mko2: json.number_acceptance_mko2,
                program_partners_id: json.program_partners_id,
                program_partners_inter_name: json.program_partners_inter_name,
                country_partners_name: json.country_partners_name,
                major_id: json.major_id,
                major_name_th: json.major_name_th,
                major_name_en: json.major_name_en,
                major_acceptance_number: json.major_acceptance_number,
                cost: json.cost,
                graduate_rate: json.graduate_rate,
                employment_rate: json.employment_rate,
                median_salary: json.median_salary,
                all_types: JSON.stringify(json.all_types)
            }
        });
    }
}


export {
    AddCourses
}