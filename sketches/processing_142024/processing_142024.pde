
/*
Konkuk University
SOS iDesign

Name: CHOI Joo Hee
ID: 201420114
*/

void setup(){
  size (600, 600);
  background(255);
  smooth(100);
  colorMode(RGB);


}

void draw(){

  background(255);
  
  //face
  noFill();
  strokeWeight(4);
  stroke(104,100,200);
  bezier(271,135,331,69,362,36,387,35);
  bezier(387,35,401,35,416,36,433,42);
  bezier(271,135,255,154,230,182,212,209);
  bezier(212,209,204,232,205,256,215,309);
  bezier(215,309,224,341,240,382,261,421);
  bezier(261,421,275,436,286,443,307,450);
  bezier(307,450,329,452,353,443,390,413);
  bezier(390,413,423,380,451,345,471,323);
  bezier(471,323,484,297,490,258,491,229);
  bezier(491,229,493,177,495,143,492,110);
  bezier(492,110,477,76,459,57,433,42);

  strokeWeight(10);
  stroke(40,40,40);
  line(423,61,461,93);
  line(461,93,470,120);
  line(400,56,364,52);
  line(364,52,338,75)  ;
    
  //body
  strokeWeight(3);
  stroke(104,100,200);
  bezier(232,359,220,405,228,460,248,494);
  bezier(248,494,293,520,334,528,367,524);
  bezier(367,524,402,501,421,468,425,436);
  bezier(425,436,430,401,430,385,432,368);
  bezier(224,338,200,365,183,393,173,429);
  bezier(173,429,174,461,185,495,202,526);
  bezier(202,526,226,552,257,577,289,597);
  bezier(406,600,439,600,464,562,479,542);
  bezier(479,542,497,502,503,444,498,404);
  bezier(498,404,492,382,480,358,461,335);
  fill(random(255),random(100),random(200));
  ellipse(284,556,70,54);
  ellipse(299,500,65,48);
  ellipse(310,600,55,22);
      
  //hair
  stroke(40,40,40);
  strokeWeight(5);
  line(434,40,448,0);
  line(440,42,464,0);
  line(454,52,489,0);


  //mouse
  strokeWeight(4);
  stroke(104,100,200);
  noFill();
  bezier(214,228,218,252,245,262,280,269);
  bezier(280,269,328,304,362,311,393,314);
  bezier(214,228,247,296,265,347,393,314);
  bezier(249,263,242,303,319,334,342,303);

  //eyes
  noFill();
  ellipse(348,132,65,65);
  ellipse(409,154,70,70);

  //nose
  fill(random(240),120,random(255));
  bezier(279,204,302,144,334,135,374,166);
  bezier(374,166,382,199,356,253,279,204);
  noStroke();
  bezier(283,202,337,203,425,144,323,172);


  //hand
  stroke(40,40,40);
  strokeWeight(14);
  line(221,392,166,242);
  line(125,215,71,211);
  line(123,197,74,163);
  line(125,198,105,138);
  line(167,235,176,205);
  line(428,417,477,294);
  line(475,285,465,262);
  line(515,238,541,186);
  line(517,245,569,204);
  line(525,254,574,255);
  strokeWeight(25);
  line(477,294,520,244);
  line(166,242,125,202);

  //eye move
  float mX = constrain(mouseX,336,361);
  float mY = constrain(mouseY,119,132);
  float mY2 = constrain(mouseY,140,168);
  float mX2 = constrain(mouseX,410,424);
  fill(40,40,40);
  ellipse(mX,mY,13,13);
  ellipse(mX2,mY2,13,13);
  fill(255,255,255);
  noStroke();
  ellipse(mX-10,mY-10,6,6);
  ellipse(mX2-10,mY2-10,6,6);

  if (mousePressed){
   noStroke();
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-50,mouseY+30,20,20);
   ellipse(height-mouseX-50,mouseY+30,20,20);
   ellipse(mouseX-50,width-mouseY+30,60,60);
   ellipse(height-mouseX-50,width-mouseY+30,60,60);
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-100,mouseY+30,20,20);
   ellipse(height-mouseX-100,mouseY+70,20,20);
   ellipse(mouseX-100,width-mouseY+70,60,60);
   ellipse(height-mouseX-100,width-mouseY+70,60,60);
}

}

void keyPressed(){
  
  background(random(255),random(255),random(255));
 
}
