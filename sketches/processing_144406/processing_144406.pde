
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JEONG eunyeah
// ID: 201420106

void setup() {
  size (600,600);
  background(#9329FF);
  smooth();
  frameRate(1);
  textSize(90);
}

void draw() {
  background(255);

  noStroke();
  fill(212,0,hour()*10);
  ellipse(240,242,hour()*2,hour()*2);
  
  fill(230,0,minute()*10);
  ellipse(415,300,minute()*2,minute()*2);
  
  pushMatrix();
  fill(255,0,0);
  translate(width/2, height/2);
  rotate(radians(50*second()));
  ellipse(50, 50, 20, 20);
  popMatrix();
  
   fill(#A2FF29);
  text(hour() + ":" + minute() + ":" + second(),100,100);
  
  }
