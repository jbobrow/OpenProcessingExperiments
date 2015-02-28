
void setup() {
  size(200,200);
  colorMode(RGB);
  background(140,247,237);
  //frameRate(1);
  
}

void draw(){
  frameRate(20);
  background(140,247,237);
  smooth();
  noStroke();
  fill(85,14,137);
  //triangle(mouseX-80,mouseY+35,mouseX-80,mouseY-35,mouseX-30,mouseY);
  //this is the back fin
  triangle(25,130,25,70,70,100);
  //this is the top fin
  fill(85,14,137);
  triangle(80,70,120,70,80,30);
  //this is the bottom fin
  fill(85,14,137);
  triangle(80,130,100,130,80,150);
  //this is the body
  fill(141,23,227);
  ellipse(100,100,120,80);
  //these are the scales
  stroke(226,133,245);
  strokeWeight(4);
  line(50,90,60,100);
  line(50,110,60,100);
  line(60,80,75,100);
  line(60,120,75,100);
  line(70,70,90,100);
  line(70,130,90,100);
  line(83,68,105,100);
  line(83,132,105,100);
  line(97,68,120,100);
  line(97,132,120,100);
  line(108,70,115,80);
  line(108,130,115,120);
  //this is the eye
  stroke(255);
  fill(255,255,255);
  ellipse(140,80,20,20);
  fill(0);
  noStroke();
  ellipse(143,80,18,18);
  //this is the mouth
  stroke(247,10,121);
  line(130,110,148,123);
  //this is the greenery
  //these are rocks
  noStroke();
  fill(71,98,5);
  //quad(0,200,50,160,80,180,60,200);
  //fill(54,59,42);
  //quad(50,170,70,190,90,195,100,200);
  //these are the ripples
  fill(255);
  ellipse(0,0,20,20);
  ellipse(19,0,20,20);
  ellipse(39,0,20,20);
  ellipse(59,0,20,20);
  ellipse(79,0,20,20);
  ellipse(99,0,20,20);
  ellipse(119,0,20,20);
  ellipse(139,0,20,20);
  ellipse(159,0,20,20);
  ellipse(179,0,20,20);
  ellipse(199,0,20,20);
  
  fill(255,179,13);
  ellipse(mouseX,mouseY,20,10);
  triangle(mouseX+5,mouseY,mouseX+15,mouseY-7,mouseX+15,mouseY+7);
  
}

void mousePressed(){
  frameRate(1);
  fill(140,247,237);
  triangle(130,110,200,70,180,150);
  //ellipse(100,180,20,20);
}
//smooth();
//noStroke();
//ellipse(100,100,25,25);
//fill (0);


