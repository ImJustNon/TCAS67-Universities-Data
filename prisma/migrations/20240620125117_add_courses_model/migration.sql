/*
  Warnings:

  - Added the required column `update_at` to the `Universities` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Courses" (
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
    "major_acceptance_number" INTEGER NOT NULL,
    "cost" TEXT NOT NULL,
    "graduate_rate" TEXT NOT NULL,
    "employment_rate" TEXT NOT NULL,
    "median_salary" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Universities" (
    "id" TEXT NOT NULL,
    "university_id" TEXT NOT NULL,
    "university_type" TEXT NOT NULL,
    "university_name" TEXT NOT NULL,
    "university_name_en" TEXT NOT NULL,
    "is_accepted_round1" BOOLEAN NOT NULL,
    "is_accepted_round2" BOOLEAN NOT NULL,
    "is_accepted_round3" BOOLEAN NOT NULL,
    "is_accepted_round4" BOOLEAN NOT NULL,
    "file_path_1" TEXT,
    "file_path_2" TEXT,
    "file_path_3" TEXT,
    "file_path_4" TEXT,
    "file_path_handicap" TEXT,
    "create_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" DATETIME NOT NULL
);
INSERT INTO "new_Universities" ("file_path_1", "file_path_2", "file_path_3", "file_path_4", "file_path_handicap", "id", "is_accepted_round1", "is_accepted_round2", "is_accepted_round3", "is_accepted_round4", "university_id", "university_name", "university_name_en", "university_type") SELECT "file_path_1", "file_path_2", "file_path_3", "file_path_4", "file_path_handicap", "id", "is_accepted_round1", "is_accepted_round2", "is_accepted_round3", "is_accepted_round4", "university_id", "university_name", "university_name_en", "university_type" FROM "Universities";
DROP TABLE "Universities";
ALTER TABLE "new_Universities" RENAME TO "Universities";
CREATE UNIQUE INDEX "Universities_id_key" ON "Universities"("id");
CREATE UNIQUE INDEX "Universities_university_id_key" ON "Universities"("university_id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Courses_id_key" ON "Courses"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Courses_program_id_key" ON "Courses"("program_id");
