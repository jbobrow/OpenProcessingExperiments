
int[] headcount = {4599, 8297, 8863, 26680, 28786, 32398, 31556, 30112};
string[] inst = {"Snow","SUU", "Dixie", "Weber", "USU", "U of U", "UVU", "SLCC"};
int [][] major={ {155, 9, 6, 5, 36, 31, 163, 41, 30, 5, 47, 21, 24, 7, 10, 112, 5, 4, 9, 8, 15, 2, 8, 10, 15, 41, 10, 2, 27, 85, 4, 49, 7},
{69, 469, 16, 0, 9, 23, 116, 0, 71, 18, 17, 0, 27, 0, 0, 56, 0, 0, 4, 39, 0, 0, 0, 1, 9, 6, 0, 0, 7, 10, 2, 18, 14},
{74, 0, 301, 0, 138, 12, 133, 49, 0, 29, 21, 87, 0, 15, 0, 25, 0, 0, 0, 0, 4, 0, 0, 7, 0, 0, 56, 0, 8, 27, 0, 12, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{72, 0, 22, 6, 469, 6, 79, 58, 28, 0, 51, 4, 41, 14, 6, 30, 4, 1, 1, 4, 0, 0, 6, 8, 3, 13, 13, 0, 5, 42, 0, 14, 0},
{45, 39, 1, 6, 25, 389, 55, 13, 8, 0, 38, 19, 4, 11, 10, 96, 0, 6, 0, 16, 16, 0, 3, 6, 29, 39, 8, 0, 6, 90, 1, 21, 0},
{95, 10, 1, 2, 15, 14, 525, 30, 33, 1, 19, 10, 9, 6, 3, 67, 10, 2, 11, 3, 10, 2, 7, 7, 0, 19, 8, 2, 12, 45, 0, 13, 9},
{39, 4, 0, 0, 84, 6, 98, 427, 14, 0, 42, 10, 33, 7, 6, 71, 3, 0, 0, 14, 17, 0, 11, 9, 3, 15, 6, 0, 2, 31, 1, 23, 22},
{137, 0, 1, 1, 77, 4, 124, 24, 362, 2, 15, 21, 5, 0, 2, 84, 2, 9, 11, 0, 0, 8, 4, 2, 0, 10, 5, 1, 13, 34, 6, 8, 30},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{87, 3, 0, 1, 21, 5, 70, 17, 9, 0, 467, 4, 19, 5, 14, 90, 3, 16, 0, 25, 16, 0, 6, 5, 3, 23, 5, 1, 12, 47, 0, 24, 0},
{83, 6, 1, 0, 14, 13, 77, 9, 48, 9, 19, 518, 8, 0, 0, 17, 0, 16, 10, 4, 11, 0, 2, 7, 19, 5, 0, 0, 24, 27, 7, 18, 27},
{43, 6, 0, 0, 25, 0, 96, 3, 0, 0, 38, 0, 516, 0, 11, 69, 5, 0, 0, 0, 0, 0, 10, 18, 0, 15, 0, 14, 18, 81, 0, 34, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{104, 0, 0, 72, 77, 15, 25, 5, 0, 0, 13, 0, 0, 50, 219, 283, 0, 0, 0, 21, 0, 0, 0, 27, 0, 0, 2, 0, 29, 54, 0, 4, 0},
{164, 7, 0, 1, 12, 45, 64, 12, 6, 1, 39, 2, 5, 9, 1, 496, 4, 0, 1, 4, 21, 0, 8, 1, 6, 22, 13, 4, 13, 12, 1, 17, 8},
{96, 0, 0, 0, 0, 0, 215, 0, 0, 0, 25, 0, 0, 9, 19, 167, 171, 0, 0, 0, 38, 0, 0, 0, 77, 0, 0, 0, 102, 6, 0, 75, 0},
{27, 18, 0, 0, 0, 15, 205, 8, 14, 0, 113, 28, 11, 0, 9, 20, 0, 376, 0, 2, 0, 0, 0, 0, 15, 33, 0, 0, 0, 107, 0, 0, 0},
{154, 0, 0, 0, 24, 0, 124, 4, 42, 38, 12, 20, 0, 0, 0, 34, 0, 4, 307, 0, 0, 0, 0, 0, 0, 0, 0, 33, 63, 30, 14, 14, 83},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{115, 19, 0, 0, 92, 34, 119, 15, 0, 0, 83, 0, 18, 0, 0, 0, 0, 0, 0, 73, 202, 0, 0, 0, 0, 44, 0, 0, 57, 46, 0, 30, 52},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{205, 4, 0, 0, 16, 14, 113, 3, 7, 0, 42, 0, 0, 18, 0, 222, 11, 0, 14, 0, 0, 0, 248, 0, 0, 0, 14, 0, 33, 17, 0, 19, 0},
{12, 0, 0, 0, 6, 19, 53, 0, 34, 0, 17, 25, 4, 0, 0, 37, 0, 0, 0, 7, 0, 0, 0, 643, 0, 15, 0, 0, 1, 39, 0, 88, 0},
{47, 3, 0, 0, 113, 148, 40, 0, 0, 0, 40, 63, 16, 0, 0, 38, 16, 30, 0, 0, 30, 0, 0, 0, 300, 46, 0, 0, 32, 34, 0, 6, 0},
{85, 0, 0, 0, 12, 21, 140, 14, 8, 1, 28, 0, 16, 49, 2, 44, 0, 4, 0, 1, 5, 0, 3, 17, 0, 465, 36, 0, 4, 39, 0, 4, 0},
{92, 0, 0, 3, 22, 4, 73, 24, 6, 0, 35, 0, 30, 69, 25, 4, 0, 0, 0, 17, 0, 0, 0, 0, 0, 39, 391, 0, 20, 114, 0, 22, 11},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{89, 4, 1, 0, 5, 11, 63, 20, 20, 0, 39, 9, 11, 0, 3, 127, 22, 0, 0, 3, 5, 0, 29, 0, 15, 27, 17, 2, 341, 85, 13, 30, 9},
{70, 7, 4, 7, 16, 4, 87, 22, 2, 3, 43, 14, 26, 12, 16, 62, 0, 0, 2, 17, 4, 0, 0, 10, 5, 37, 11, 0, 25, 454, 0, 40, 1},
{35, 0, 0, 0, 95, 7, 116, 0, 0, 0, 11, 32, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 588, 3, 33},
{96, 3, 8, 2, 49, 24, 110, 38, 28, 0, 75, 17, 44, 5, 2, 88, 4, 3, 64, 15, 5, 5, 26, 15, 2, 37, 13, 0, 15, 94, 4, 92, 15},
{80, 39, 13, 0, 26, 15, 90, 3, 58, 27, 39, 225, 0, 6, 0, 60, 14, 9, 36, 7, 0, 0, 0, 0, 22, 7, 5, 0, 1, 10, 0, 16, 192} };

string [] name={"Undeclared or not in a degree program","Agriculture/natural resources/related", "Architecture and related services", "Area/ethnic/cultural/gender/grp studies", "Visual and performing arts", "Biological and biomedical sciences", "Business/management/marketing/related", "Communication/journalism/related tech", "Computer/information science/support", "Construction trades", "Education", "Engineering", "English language and literature/letters", "Family/consumer sciences/human sciences", "Foreign languages/literature/linguistics", "Health professions and related programs", "Legal professions and studies", "Mathematics and statistics", "Mechanic/repair technologies/technicians", "Multi/interdisciplinary studies", "Parks/recreation/leisure/fitness studies", "Precision production", "Personal and culinary services", "Philosophy/theology/religious studies", "Physical sciences", "Psychology", "Public administration/social service", "Science technologies/technicians", "Homeland security/law enforce/protective", "Social sciences/history", "Transportation and materials moving", "Liberal arts/sci/gen studies/humanities", "Engineering technologies/related fields"};

size(900,1700);
background(0);
stroke(200);
textAlign(CENTER);
rectMode(CENTER);
colorMode(HSB);
stroke(255);
fill(255);
textAlign(CENTER);
text("NCES Data: Beginning Postsecondary Students Longitudinal Data",width/2,15);
text("Major when 1st enrolled (2003)",100,25);
text("Major when last enrolled (2009)",800,25);
fill(175);
for (int i=0; i<name.length; i++) {
   fill(170);
   textAlign(RIGHT);
   text (name[i],250,i*50+50);
   textAlign(LEFT);
   text (name[i],650,i*50+50);
}
for (a=0; a<33; a++) {
   for (b=0; b<33; b++) {
      stroke (a*5+5,200,200,150);
      strokeWeight(major[a][b]/50);
      if (major[a][b]>0) {
      line (260,a*50+47,640,b*50+47);}
    }
}

