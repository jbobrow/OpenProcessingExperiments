
/*
 Konkuk University
 SOS iDesign

Name:Seo Yu Mi<<------ Write your full name here!
 ID: Seo Yu Mi <<--------- Write your ID here!

*/


PImage img;


void setup(){
  size(600,600);
  // noloop();
  smooth();
  
background(52,202,203);
}


int value = 0;
void draw(){


  
  
  
  stroke(0);
  strokeWeight(10);
  fill(215,237,250);
  ellipse(298,158,388,269);
  line(228,357,223,379);
  line(375,364,382,380);
  bezier(223,379,128,427,164,486,251,437);
  bezier(383,381,461,428,427,485,349,440);
  noStroke();
  quad(231,358,217,445,291,421,297,353);
  quad(378,364,374,447,306,421,298,361);
  
  stroke(0);
  strokeWeight(5);
  fill(246,247,225);
  ellipse(256,269,94,179);
  ellipse(352,276,94,179);
  noStroke();
  fill(value);
  quad(244,235,243,328,266,328,270,237);
  quad(337,238,335,328,356,326,358,239);
  
  noFill();
  stroke(0);
  bezier(178,437,250,407,351,412,414,438);
  fill(215,237,250);
  noStroke();
  quad(284,541,284,600,313,600,313,542);
  fill(215,237,250);
  stroke(0);
  bezier(300,310,264,391,200,502,297,541);
  bezier(300,310,349,431,380,512,297,541);
  bezier(246,174,284,165,320,165,357,172);
  bezier(217,145,275,130,334,131,392,143);
  bezier(241,107,283,99,325,98,364,105);
  line(284,541,284,600);
  line(313,542,313,600);
  
  noStroke();
  fill(67,134,121);
  ellipse(185,86,13,13);
  ellipse(217,59,13,13);
  ellipse(226,77,13,13);
  ellipse(269,48,13,13);
  ellipse(320,66,13,13);
  ellipse(368,51,13,13);
  ellipse(387,81,13,13);
  ellipse(407,71,13,13);
  
  
if(mousePressed){

float a=random(255);
float b=random(100);
float c=random(255);

fill(constrain(mouseX,mouseY,a),b,c);
    stroke(mouseX,100,mouseY,100);
    strokeWeight(8);
    ellipse(pmouseX,pmouseY,70,70);

  
  
  
  
}
}
void mouseDragged() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}

void keyPressed(){

setup();

}

