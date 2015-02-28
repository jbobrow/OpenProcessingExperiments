
void setup() {
  size(900,900);
  smooth();
  colorMode(RGB);
}

void draw() {
  background(50); 
  
  translate(width/2, height/2);
  
  //sonne
  fill(255,255,0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0,0,100,100);
  
  //merkur
  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI);
  translate(80,0);
  
  fill(255,255,100);
  ellipse(0,0,15,15);
  popMatrix();
  
  //venus
  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI / 5.0);
  translate(110,0);
  
  fill(255,190,40);
  ellipse(0,0,25,25);
  popMatrix();

  //erde
  pushMatrix();
  rotate(millis() * 0.001 * TWO_PI / 10.0);
  translate(160,0);
  
  fill(0,140,160);
  ellipse(0,0,30,30);
  
  //mond
  rotate(millis() *0.001 * -TWO_PI );
  translate(20,20);
  fill(255,255,210);
  ellipse(0,0,7,7);
  
  popMatrix();
  
  //mars
  pushMatrix();
  rotate(millis() * 0.0003 * TWO_PI);
  translate(210,0);
  
  fill(255,190,40);
  ellipse(0,0,15,15);
  popMatrix();

  //jupiter
  pushMatrix();
  rotate(millis() * 0.00003 * TWO_PI);
  translate(270,0);
  
  fill(130,180,150);
  ellipse(0,0,60,60);
  popMatrix();
  
  //saturn
  pushMatrix();
  rotate(millis() * 0.0002 * TWO_PI);
  translate(350,0);
  
  fill(220,190,90);
  ellipse(0,0,50,50);

  pushStyle();
  rotate(millis() * 0.0005 * -TWO_PI );
  noFill();
  strokeWeight(5);
  stroke(200,150,60);
  ellipse(0,0,5,70);
  popStyle();
  popMatrix();
  
  //uranus
  pushMatrix();
  rotate(millis() * 0.00005 * TWO_PI);
  translate(410,0);
  
  fill(110,230,255);
  ellipse(0,0,35,35);
  popMatrix();
}

