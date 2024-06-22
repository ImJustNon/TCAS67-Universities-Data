-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Courses" (
    "id" TEXT NOT NULL,
    "university_type_id" TEXT NOT NULL,
    "university_type_name_th" TEXT NOT NULL,
    "university_id" TEXT NOT NULL,
    "university_name_th" TEXT NOT NULL,
    "university_name_en" TEXT NOT NULL,
    "campus_id" TEXT NOT NULL,
    "campus_name_th" TEXT NOT NULL,
    "campus_name_en" TEXT NOT NULL,
    "faculty_id" TEXT NOT NULL,
    "faculty_name_th" TEXT NOT NULL,
    "faculty_name_en" TEXT NOT NULL,
    "group_field_id" TEXT NOT NULL,
    "group_field_th" TEXT NOT NULL,
    "field_id" TEXT NOT NULL,
    "field_name_th" TEXT NOT NULL,
    "field_name_en" TEXT NOT NULL,
    "program_running_number" TEXT NOT NULL,
    "program_name_th" TEXT NOT NULL,
    "program_name_en" TEXT NOT NULL,
    "program_type_id" TEXT NOT NULL,
    "program_type_name_th" TEXT NOT NULL,
    "program_id" TEXT NOT NULL,
    "number_acceptance_mko2" INTEGER NOT NULL,
    "program_partners_id" TEXT NOT NULL,
    "program_partners_inter_name" TEXT NOT NULL,
    "country_partners_name" TEXT NOT NULL,
    "major_id" TEXT,
    "major_name_th" TEXT,
    "major_name_en" TEXT,
    "major_acceptance_number" INTEGER,
    "cost" TEXT NOT NULL,
    "graduate_rate" TEXT,
    "employment_rate" TEXT,
    "median_salary" TEXT,
    "all_types" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_Courses" ("all_types", "campus_id", "campus_name_en", "campus_name_th", "cost", "country_partners_name", "created_at", "employment_rate", "faculty_id", "faculty_name_en", "faculty_name_th", "field_id", "field_name_en", "field_name_th", "graduate_rate", "group_field_id", "group_field_th", "id", "major_acceptance_number", "major_id", "major_name_en", "major_name_th", "median_salary", "number_acceptance_mko2", "program_id", "program_name_en", "program_name_th", "program_partners_id", "program_partners_inter_name", "program_running_number", "program_type_id", "program_type_name_th", "university_id", "university_name_en", "university_name_th", "university_type_id", "university_type_name_th", "updated_at") SELECT "all_types", "campus_id", "campus_name_en", "campus_name_th", "cost", "country_partners_name", "created_at", "employment_rate", "faculty_id", "faculty_name_en", "faculty_name_th", "field_id", "field_name_en", "field_name_th", "graduate_rate", "group_field_id", "group_field_th", "id", "major_acceptance_number", "major_id", "major_name_en", "major_name_th", "median_salary", "number_acceptance_mko2", "program_id", "program_name_en", "program_name_th", "program_partners_id", "program_partners_inter_name", "program_running_number", "program_type_id", "program_type_name_th", "university_id", "university_name_en", "university_name_th", "university_type_id", "university_type_name_th", "updated_at" FROM "Courses";
DROP TABLE "Courses";
ALTER TABLE "new_Courses" RENAME TO "Courses";
CREATE UNIQUE INDEX "Courses_id_key" ON "Courses"("id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
