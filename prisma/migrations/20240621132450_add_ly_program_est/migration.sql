/*
  Warnings:

  - You are about to drop the column `update_at` on the `Rounds` table. All the data in the column will be lost.
  - You are about to drop the column `create_at` on the `Universities` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Universities` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `Rounds` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Universities` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "LyProgramsEST" (
    "program_id" TEXT NOT NULL,
    "project_id" TEXT NOT NULL,
    "major_id" TEXT NOT NULL,
    "program_name_th" TEXT NOT NULL,
    "program_type_name_th" TEXT NOT NULL,
    "major_name_th" TEXT NOT NULL,
    "project_name_th" TEXT NOT NULL,
    "min_score" REAL NOT NULL,
    "max_score" REAL NOT NULL,
    "min_score_ds" REAL NOT NULL,
    "max_score_ds" REAL NOT NULL,
    "est_min_score_mean" REAL NOT NULL,
    "est_min_score_mean_sd" REAL NOT NULL,
    "est_min_score_regression" REAL NOT NULL,
    "receive_student_number" INTEGER NOT NULL,
    "scores" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Rounds" (
    "id" TEXT NOT NULL,
    "university_id" TEXT NOT NULL,
    "program_id" TEXT NOT NULL,
    "project_id" TEXT,
    "project_name_th" TEXT,
    "type" TEXT NOT NULL,
    "receive_student_number" INTEGER,
    "only_formal" INTEGER NOT NULL,
    "only_international" INTEGER NOT NULL,
    "only_vocational" INTEGER NOT NULL,
    "only_non_formal" INTEGER NOT NULL,
    "only_ged" INTEGER NOT NULL,
    "description" TEXT,
    "condition" TEXT,
    "interview_location" TEXT,
    "interview_date" TEXT,
    "interview_time" TEXT,
    "link" TEXT,
    "grad_current" BOOLEAN NOT NULL,
    "t_score" BOOLEAN NOT NULL,
    "min_total_score" INTEGER,
    "scores" TEXT,
    "score_conditions" TEXT,
    "min_gpax" REAL,
    "major_id" TEXT,
    "join_id" TEXT,
    "min_credit_gpa22_23" INTEGER,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_Rounds" ("condition", "created_at", "description", "grad_current", "id", "interview_date", "interview_location", "interview_time", "join_id", "link", "major_id", "min_credit_gpa22_23", "min_gpax", "min_total_score", "only_formal", "only_ged", "only_international", "only_non_formal", "only_vocational", "program_id", "project_id", "project_name_th", "receive_student_number", "score_conditions", "scores", "t_score", "type", "university_id") SELECT "condition", "created_at", "description", "grad_current", "id", "interview_date", "interview_location", "interview_time", "join_id", "link", "major_id", "min_credit_gpa22_23", "min_gpax", "min_total_score", "only_formal", "only_ged", "only_international", "only_non_formal", "only_vocational", "program_id", "project_id", "project_name_th", "receive_student_number", "score_conditions", "scores", "t_score", "type", "university_id" FROM "Rounds";
DROP TABLE "Rounds";
ALTER TABLE "new_Rounds" RENAME TO "Rounds";
CREATE UNIQUE INDEX "Rounds_id_key" ON "Rounds"("id");
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
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_Universities" ("file_path_1", "file_path_2", "file_path_3", "file_path_4", "file_path_handicap", "id", "is_accepted_round1", "is_accepted_round2", "is_accepted_round3", "is_accepted_round4", "university_id", "university_name", "university_name_en", "university_type") SELECT "file_path_1", "file_path_2", "file_path_3", "file_path_4", "file_path_handicap", "id", "is_accepted_round1", "is_accepted_round2", "is_accepted_round3", "is_accepted_round4", "university_id", "university_name", "university_name_en", "university_type" FROM "Universities";
DROP TABLE "Universities";
ALTER TABLE "new_Universities" RENAME TO "Universities";
CREATE UNIQUE INDEX "Universities_id_key" ON "Universities"("id");
CREATE UNIQUE INDEX "Universities_university_id_key" ON "Universities"("university_id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "LyProgramsEST_program_id_key" ON "LyProgramsEST"("program_id");
