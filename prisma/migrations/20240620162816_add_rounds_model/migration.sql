-- CreateTable
CREATE TABLE "Rounds" (
    "id" TEXT NOT NULL,
    "university_id" TEXT NOT NULL,
    "program_id" TEXT NOT NULL,
    "project_id" TEXT,
    "project_name_th" TEXT,
    "type" TEXT NOT NULL,
    "receive_student_number" INTEGER NOT NULL,
    "only_formal" INTEGER NOT NULL,
    "only_international" INTEGER NOT NULL,
    "only_vocational" INTEGER NOT NULL,
    "only_non_formal" INTEGER NOT NULL,
    "only_ged" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "interview_location" TEXT NOT NULL,
    "interview_date" TEXT NOT NULL,
    "interview_time" TEXT NOT NULL,
    "link" TEXT NOT NULL,
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

-- CreateIndex
CREATE UNIQUE INDEX "Rounds_id_key" ON "Rounds"("id");
