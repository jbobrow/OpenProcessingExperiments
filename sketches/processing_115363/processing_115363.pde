
void setup() {
  size(200,200);
  smooth();
  background(255);
  frameRate(.5);
}

void draw() {
  background(255);
  strokeWeight(5);
  drawHead();
  drawMouth();
  drawEyes();
  drawNose();
  //noLoop();
}

void drawHead() {
  fill(211,212,random(22,122));
  ellipse(width/2,height/2,random(width-99,width),random(height-20,height));
}

void drawMouth() {
  //curve(5, 26, 111, 24, 73, 61, 15, 65); 
  line(width*0.4,random(height*0.65,height*0.85),width*0.6,random(height*0.65,height*0.85));
}

void drawNose() {
  line(random(width*0.4,height*0.5),122,width*0.6,height*0.6);
  line(random(width/2,height/1.7),75,width*0.6,height*0.6);
  //bezier(88, 44, 10, 10, 90, 55, 15, 80);
}

void drawEyes() {
  fill(255);
  line(width*0.3,height*0.35,width*0.6,height*0.35);
  ellipse(width*0.33,random(height*0.39,height*0.35),random(20,30),random(20,30));
  ellipse(width*0.66,random(height*0.39,height*0.35),random(20,30),random(20,30));
  
}


