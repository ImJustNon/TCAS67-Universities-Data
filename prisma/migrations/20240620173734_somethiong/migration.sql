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
    "description" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "interview_location" TEXT,
    "interview_date" TEXT,
    "interview_time" TEXT,
    "link" TEXT,
    "grad_current" BOOLEAN NOT NULL,
    "t_score" BOOLEAN NOT NULL,
    "min_total_score" INTEGER,
    "scores" TEXT,
    "score_conditions" TEXT,
    "min_gpax" INTEGER,
    "major_id" TEXT,
    "join_id" TEXT,
    "min_credit_gpa22_23" INTEGER,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" DATETIME NOT NULL
);
INSERT INTO "new_Rounds" ("condition", "created_at", "description", "grad_current", "id", "interview_date", "interview_location", "interview_time", "join_id", "link", "major_id", "min_credit_gpa22_23", "min_gpax", "min_total_score", "only_formal", "only_ged", "only_international", "only_non_formal", "only_vocational", "program_id", "project_id", "project_name_th", "receive_student_number", "score_conditions", "scores", "t_score", "type", "university_id", "update_at") SELECT "condition", "created_at", "description", "grad_current", "id", "interview_date", "interview_location", "interview_time", "join_id", "link", "major_id", "min_credit_gpa22_23", "min_gpax", "min_total_score", "only_formal", "only_ged", "only_international", "only_non_formal", "only_vocational", "program_id", "project_id", "project_name_th", "receive_student_number", "score_conditions", "scores", "t_score", "type", "university_id", "update_at" FROM "Rounds";
DROP TABLE "Rounds";
ALTER TABLE "new_Rounds" RENAME TO "Rounds";
CREATE UNIQUE INDEX "Rounds_id_key" ON "Rounds"("id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
