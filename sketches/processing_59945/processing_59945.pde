


void setup () {
  size(400, 400);
  background(0);
  smooth();

}
  
void draw() {
  fill (0, 50);
  noStroke();
  noCursor();
  rect(0,0, width, height);
if (mousePressed) {
  frameRate(10);

fill (random(255), random(255), random(255), random(255));
ellipse(mouseX, mouseY, 50,50);
ellipse(mouseX, mouseY, 35, 35);
ellipse(mouseX, mouseY, 20, 20);
}
else{
  frameRate(120);
  background (random(255), random(255), random(255));
  noStroke();
  noCursor();
  fill (random(255), random(255), random(255));
  ellipse(200,200,510,510);
  fill (random(255), random(255), random(255));
  ellipse(200,200, 430,430);
  fill (random(255), random(255), random(255));
  ellipse(200,200, 350,350);
   fill (random(255), random(255), random(255));
  ellipse(200,200, 250,250);
 fill (random(255), random(255), random(255));
  ellipse(200,200, 150,150);
}
}





