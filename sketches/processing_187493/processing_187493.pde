
PImage mike;
void setup() {
  size(640,665);
  background(255,150,200);
  mike = loadImage("mike.png");
}
void draw() {
  image(mike,0,0);
  
  float ojo=atan2 (mouseY-240, mouseX-375);

  fill(255); 
  noStroke();
  ellipse(295, 146, 170,255); //ojo
  pushMatrix ();
  translate (295,150);
  rotate (ojo);

  fill(1, 97, 87);
  stroke(0);
  strokeWeight(2);
  ellipse(40, 0, 75, 75); //iris
  
  fill(2,250,107);
  stroke(1,130,37);
  ellipse(38,0, 60,60);

  fill(0, 0, 0);
  ellipse(35, 0, 30, 30); //pupila

  fill(255, 255, 255);
  ellipse(35, 15, 10, 10); //brillo
  popMatrix (100);
}




