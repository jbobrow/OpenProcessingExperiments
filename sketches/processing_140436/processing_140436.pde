
/*
 Konkuk University
 SOS iDesign

Name: Seo Yu Mi 
 ID: Seo Yu Mi


*/

PImage img;
void setup(){
size (600, 600);
background(174,175,172);
// noLoop();
smooth();
colorMode (RGB, 600);
img = loadImage ("seoyumimi.jpg"); //put the image in the same folder as the processing file
}
 
 
void draw(){
//println(mouseX + " : " + mouseY);
//image (img, 0, 0);

fill(mouseX,mouseY,mouseY);
quad(465,441,467,446,600,352,600,343);


strokeWeight(7);
line(160,516,323,597);
line(409,525,599,491);
line(394,579,599,521);

strokeWeight(2);
line(130,408,592,282);
line(434,43,431,280);
line(384,50,549,127);
line(398,126,480,126);
line(406,146,489,143);
line(434,195,230,398);
line(434,193,599,335);
line(365,375,282,577);
line(365,375,437,439);
line(473,383,325,598);
line(473,383,538,450);
line(538,450,409,598);
line(591,354,514,425);
line(598,385,409,599);
line(591,352,599,359);
ellipse(250,271,120,120);
ellipse(153,136,300,300);
ellipse(153,136,130,130);
ellipse(121,598,110,110);
line(599,579,430,574);
line(347,420,418,465);
line(332,458,400,493);
line(320,488,374,527);
line(307,516,353,560);
line(458,408,495,442);
line(449,423,482,456);
line(437,441,468,468);
line(419,466,451,486);
line(400,494,428,509);
line(374,528,394,544);
line(355,559,366,570);
line(514,427,338,597);
line(526,437,375,598);
line(515,427,525,438);
line(497,443,508,455);
line(483,456,496,466);
line(469,469,482,482);
line(453,486,468,497);
line(429,509,444,515);
line(394,542,412,556);
line(366,572,383,589);
line(408,529,441,526);
line(598,364,526,437);
line(525,438,539,451);
line(509,456,523,468);
line(497,468,512,480);
line(483,482,498,495);
line(470,497,487,508);
line(456,514,487,508);
line(457,521,469,530);
line(414,557,424,567);
line(382,589,394,598);
line(573,372,581,380);
line(550,394,558,403);
line(581,380,592,391);
line(558,403,570,414);
fill(0);
triangle(425,295,517,173,517,179);
triangle(517,173,517,179,610,222);



// here you add your code with all shapes and colors.
}
