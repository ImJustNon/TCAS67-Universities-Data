-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_LyProgramsEST" (
    "unique_id" TEXT NOT NULL PRIMARY KEY,
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
    "est_min_score_mean" REAL,
    "est_min_score_mean_sd" REAL,
    "est_min_score_regression" REAL NOT NULL,
    "receive_student_number" INTEGER NOT NULL,
    "scores" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_LyProgramsEST" ("created_at", "est_min_score_mean", "est_min_score_mean_sd", "est_min_score_regression", "major_id", "major_name_th", "max_score", "max_score_ds", "min_score", "min_score_ds", "program_id", "program_name_th", "program_type_name_th", "project_id", "project_name_th", "receive_student_number", "scores", "unique_id", "updated_at") SELECT "created_at", "est_min_score_mean", "est_min_score_mean_sd", "est_min_score_regression", "major_id", "major_name_th", "max_score", "max_score_ds", "min_score", "min_score_ds", "program_id", "program_name_th", "program_type_name_th", "project_id", "project_name_th", "receive_student_number", "scores", "unique_id", "updated_at" FROM "LyProgramsEST";
DROP TABLE "LyProgramsEST";
ALTER TABLE "new_LyProgramsEST" RENAME TO "LyProgramsEST";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
