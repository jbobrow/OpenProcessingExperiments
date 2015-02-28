
void setup() {
  size(5, 1000);
  smooth();
  background(0);
  frameRate(1);
}

void draw() {

  //noFill();
  strokeWeight(20);

  mouseX= int((random(width)));
  mouseY= int((random(height)));

  dist (mouseX, mouseY, pmouseX, pmouseY);
  float vari= dist(mouseX, mouseY, pmouseX, pmouseY)*2;

  ellipse(mouseX, mouseY, vari, vari);


  if (mousePressed == true) {
    stroke(0, 0, 0, 50);
    background(mouseY);
  } 
  else 
  {
    stroke(vari*10, vari, mouseX, mouseY);
  } 

  fill(vari);
}



