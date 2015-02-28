
PFont font;//get font

void setup() {
  size(400, 400);
  font = loadFont("Calibri.vlw");
  colorMode(HSB, 255, 100, 100, 100);
  rectMode(CENTER);
}

void draw() {
  background(255);

  stroke(200);
  strokeWeight(1);
  noFill();
  ellipse(width/2, height/2, 300, 300);//time track

  Circle();//shape animation

  //time
  fill(200);
  textAlign(CENTER, CENTER);
  textFont(font, 40);
  text(hour() + ":" + minute() + ":" + second(), width/2, height/2);
}

void Circle() {
  int h=hour();
  int m=minute();
  int s=second();
  int c;
  
  int radius1=int(map(h, 0, 12, 0, 360));//map hour into 360 degrees
  int radius2=int(map(m, 0, 60, 0, 360));//map minute into 360 degrees
  int radius3=int(map(s, 0, 60, 0, 360));//map second into 360 degrees
  ;
  float colorH=map(h, 0, 12, 0, 360);//map hour color into 360 degrees
  float colorM=map(m, 0, 60, 0, 360);//map minute color into 360 degrees
  float colorS=map(s, 0, 60, 0, 360);//map second color into 360 degrees

  noStroke();

  //hour mark
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(270+radius1));
  fill(colorH, 255, 255, 50);  
  ellipse(150, 0, 40, 40); 
  fill(255); 
  ellipse(150, 0, 5, 5); 
  popMatrix();

  //minute mark
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(270+radius2));
  fill(colorM, 255, 255, 50);  
  rect(150, 0, 40, 40); 
  fill(255);  
  ellipse(150, 0, 5, 5); 
  popMatrix();

  //second mark
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(270+radius3));
  fill(colorS, 75, 99, 50);  
  ellipse(150, 0, 100, 100); 
  fill(255, 0, 100, 30);  
  ellipse(150, 0, 80, 80);
  fill(255, 0, 100, 30);  
  ellipse(150, 0, 60, 60);
  fill(255, 0, 100, 30);  
  ellipse(150, 0, 40, 40);
  fill(255, 0, 100, 30);  
  ellipse(150, 0, 20, 20);
  fill(255);  
  ellipse(150, 0, 5, 5);
  popMatrix();
}



