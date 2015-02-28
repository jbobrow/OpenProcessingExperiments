

//Homework 2- computing for the arts with processing
//Copywright Nathan Trevino September 2011 Pittsburgh, PA 15221


//setup settings
void setup() {
  size(400, 400);
  background(160);
  smooth();
  frameRate(60);
}


float x = 200;
float y = 200;
float wd = 200;
float ht = 200;
//float x, y, wd, ht

//main circle
void draw() {

  smooth();

  noStroke();
  fill(153);
  ellipse(x,y,wd+150,ht+150);

  fill(140);
  ellipse(x, y, wd+130, ht+130);
  
  fill(120);
  ellipse(x,y,wd+100, ht+100);
  
  fill(60);
  ellipse(x,y, wd+70, ht+70);
  
  fill(20);
  ellipse(x,y,wd+50, ht+50);
  
  fill(#867C8E);
  ellipse(x,y,wd+30,ht+30);

  stroke(197, 140, 247);//beautiful lavender
  strokeWeight(4);
  fill(197, 140, 247);
  ellipse(x, y, wd, ht);


  //N
  strokeWeight(12);
  stroke(173, 255, 139);
  arc(x+5, y+5, wd-10, ht-10, PI*.5, (6*PI)/5);
  beginShape();
  curveVertex(x-89, y-68);
  curveVertex(x-70, y-55);
  curveVertex(x-60, y-25);
  curveVertex(x-50, y+10);
  curveVertex(x-25, y+35);
  curveVertex(x-20, y+40);
  curveVertex(x-10, y+45);
  curveVertex(x-5, y+40);
  curveVertex(x-15, y-90);
  curveVertex(x-15, y-100);
  endShape();



  //L
  stroke(142, 252, 255);
  arc(x, y, wd, ht, 0, PI*.4);
  line(x, y-75, x+26, y+96);

  //T

  stroke(255);
  line(x+40, y-83, x+55, y+58);
  noFill();
  arc(x+5, y+5, wd, ht, (3*PI)/2, TWO_PI);
}

