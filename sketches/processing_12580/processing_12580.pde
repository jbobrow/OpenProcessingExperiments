
// constants
int Y_AXIS = 1;
int X_AXIS = 2;

void setup(){
  size(850, 500);
  smooth();
  background(1,40,11);
  noLoop();
  
  color b1 = color(250,180,80);
  color b2 = color(230,80,80);
  setGradient(0, 0, width, 330, b1, b2, Y_AXIS);
  
  //terrain
  translate(0,-100);
  fill(1,40,11);
  strokeWeight(3);
  stroke(1,30,3);
  beginShape();
  curveVertex(0,435);
  curveVertex(-10,435);
  curveVertex(30,418);
  curveVertex(50,415);
  curveVertex(65,420);
  curveVertex(80,417);
  curveVertex(90,420);
  curveVertex(120,425);
  curveVertex(135,430);
  curveVertex(150,430);
  curveVertex(160,425);
  curveVertex(180,420);
  curveVertex(220,424);
  curveVertex(250,430);
  curveVertex(260,425);
  curveVertex(280,415);
  curveVertex(360,400);
  curveVertex(400,410);
  curveVertex(410,415);
  curveVertex(420,420);
  curveVertex(430,420);
  curveVertex(440,410);
  curveVertex(460,401);
  curveVertex(470,402);
  curveVertex(480,401);
  curveVertex(500,405);
  curveVertex(530,420);
  curveVertex(550,430);
  curveVertex(580,415);
  curveVertex(610,418);
  curveVertex(630,423);
  curveVertex(670,405);
  curveVertex(700,415);
  curveVertex(710,425);
  curveVertex(740,420);
  curveVertex(760,410);
  curveVertex(780,405);
  curveVertex(790,408);
  curveVertex(820,415);
  curveVertex(840,410);
  curveVertex(850,415);
  vertex(850,415);
  vertex(850,500);
  endShape();
  
}

  //linear gradients
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  
  if(axis == Y_AXIS){
    for (int i=x; i<=(x+w); i++){
    for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }
   else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
  
   //sun gradient
  int radius = 90;
  
  for (int i=radius+50; i<250; i+=radius*2){
    for (int j=radius+20; j<200;j+=radius*2){
      createGradient(i, j, radius, color(255,254,200),
      color(255,239,54));      
    }
  }
}

void createGradient (float x, float y, float radius, color c1, color c2){
  float px = 0, py = 0, angle = 0;

  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);      
    }
  }
  
  //sun
  noFill();
  strokeWeight(3);
  stroke(255,183,0);
  ellipse(x, y, radius*2, radius*2);
  
}

void draw(){
  scale(1);
  translate(190,-90);
  panther(621,167,217);
  scale(.9);
  translate(60,190);
  panther(621,167,280);
  scale(.6);
  translate(-440,100);
  panther(621,167,195);
  scale(.9);
  translate(-140,270);
  panther(621,167,315);
  
}





void panther(int x, int y, int s){
  colorMode(HSB,360,100,100);
  
  //panther color accent
  fill(s,88,18);
  noStroke();
  beginShape();
  vertex(442,303);
  vertex(473,313);
  vertex(439,355);
  vertex(458,389);
  vertex(476,394);
  bezierVertex(476,394,478,399,474,400);
  bezierVertex(470,403,453,401,453,401);
  bezierVertex(453,401,445,397,443,389);
  bezierVertex(425,365,424,356,424,356);
  bezierVertex(418,352,450,318,442,303);
  endShape();
  
  beginShape();
  vertex(328,294);
  vertex(353,287);
  vertex(368,325);
  vertex(344,354);
  vertex(367,391);
  vertex(398,395);
  bezierVertex(398,395,402,403,384,404);
  bezierVertex(356,405,353,389,348,383);
  bezierVertex(320,353,337,356,338,337);
  bezierVertex(338,337,342,314,328,294);
  endShape();
  
  fill(s+1,91,25);
  strokeWeight(1.5);
  stroke(s+1,90,23);
  beginShape();
  vertex(569,152);
  vertex(545,286);
  bezierVertex(461,349,419,291,354,292);
  bezierVertex(278,305,249,353,234,358);
  vertex(261,245);
  bezierVertex(290,209,336,211,336,211);
  bezierVertex(336,211,413,188,436,192);
  bezierVertex(451,191,482,173,506,177);
  bezierVertex(522,164,558,157,558,157);
  vertex(570,152);
  endShape();
  
  //panther dark form
  fill(s+9,42,8);
  noStroke();
  beginShape();
  vertex(604,148);
  vertex(629,169);
  bezierVertex(631,173,625,173,643,191);
  bezierVertex(645,201,632,218,629,216);
  bezierVertex(627,214,606,210,590,210);
  bezierVertex(574,211,558,240,558,240);
  bezierVertex(558,240,554,284,546,286);
  bezierVertex(542,288,563,356,586,382);
  bezierVertex(594,385,585,390,593,394);
  bezierVertex(600,398,625,401,622,407);
  bezierVertex(621,421,594,417,587,415);
  bezierVertex(586,412,581,408,581,408);
  bezierVertex(581,408,567,396,567,396);
  bezierVertex(567,396,564,376,558,375);
  bezierVertex(551,373,520,338,520,338);
  vertex(510,320);
  vertex(497,303);
  bezierVertex(497,303,496,283,495,284);
  bezierVertex(456,294,384,282,367,269);
  bezierVertex(356,282,312,293,312,293);
  vertex(327,276);
  bezierVertex(327,276,328,264,335,260);
  bezierVertex(337,256,355,247,355,247);
  bezierVertex(355,247,329,255,330,256);
  bezierVertex(332,259,319,275,307,284);
  bezierVertex(280,291,243,355,236,358);
  bezierVertex(228,363,227,360,216,366);
  bezierVertex(209,373,199,405,205,405);
  bezierVertex(212,410,225,411,220,419);
  bezierVertex(219,422,193,423,185,416);
  bezierVertex(183,406,198,349,204,348);
  bezierVertex(227,342,243,275,243,275);
  bezierVertex(243,275,154,336,120,273);
  bezierVertex(118,264,116,272,115,256);
  bezierVertex(113,243,121,243,124,237);
  bezierVertex(128,243,134,243,132,256);
  bezierVertex(134,271,128,265,130,269);
  bezierVertex(130,269,152,337,264,241);
  bezierVertex(326,198,362,226,362,226);
  bezierVertex(362,226,404,199,444,205);
  bezierVertex(443,204,438,215,439,215);
  bezierVertex(481,167,518,193,518,193);
  bezierVertex(518,193,522,191,515,185);
  bezierVertex(518,176,532,166,556,163);
  bezierVertex(572,148,575,149,575,149);
  bezierVertex(575,145,580,140,581,141);
  bezierVertex(581,140,582,150,589,147);
  bezierVertex(593,145,597,143,601,135);
  bezierVertex(606,137,604,148,604,148);
  endShape();
  
  beginShape();
  vertex(348,294);
  bezierVertex(358,288,383,293,384,296);
  bezierVertex(380,308,376,335,372,334);
  bezierVertex(372,338,361,339,356,349);
  bezierVertex(354,356,363,380,375,388);
  bezierVertex(378,389,395,385,400,396);
  bezierVertex(399,398,376,400,369,398);
  bezierVertex(365,400,353,378,346,366);
  bezierVertex(339,356,334,345,356,326);
  bezierVertex(361,323,351,300,348,294);
  endShape();
  
  beginShape();
  vertex(462,315);
  bezierVertex(474,317,489,313,489,313);
  bezierVertex(485,337,448,353,448,359);
  bezierVertex(448,359,440,377,473,389);
  bezierVertex(484,398,461,401,450,389);
  bezierVertex(453,386,430,363,432,356);
  bezierVertex(427,352,466,325,462,315);
  endShape();
  
  //panther highlights
  strokeWeight(2.5);
  stroke(s+8,78,57,170);
  noFill();
  bezier(575,161,568,152,580,141,580,141);
  bezier(580,141,580,141,584,153,589,153);
  bezier(590,147,590,147,599,143,600,135);
  bezier(600,135,600,135,605,142,603,143);
  
  strokeWeight(1.5);
  stroke(s+9,81,54,80);
  line(324,277,295,311);
  stroke(s+9,81,54,120);
  bezier(295,311,269,324,246,354,239,356);
  
  noStroke();
  fill(104,4,97);
  beginShape();
  vertex(614,169);
  bezierVertex(614,167,627,171,623,176);
  bezierVertex(618,180,612,170,614,169);
  endShape();
  
  fill(s-120,98,79);
  ellipse(619,172,6,7);
  
  fill(0);
  triangle(x,y,623,171,618,175);
  
  noFill();
  strokeWeight(1);
  stroke(44,18,86,170);
  bezier(625,195,620,190,610,191,610,191);
  bezier(624,195,620,190,608,193,607,193);
  bezier(623,196,619,191,605,195,603,196);
  bezier(624,196,618,193,607,197,605,199);
  
  noStroke();
  fill(44,18,86,150);
  triangle(644,193,636,192,641,202);
  
}

