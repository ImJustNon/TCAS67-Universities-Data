-- CreateTable
CREATE TABLE "Universities" (
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
    "file_path_handicap" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "Universities_id_key" ON "Universities"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Universities_university_id_key" ON "Universities"("university_id");
