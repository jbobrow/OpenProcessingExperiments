
void setup()
{
  size( 600,600 );
  background( 255 );
  smooth();
}
void draw() {
  
  if (mousePressed) {
   translate(mouseX,mouseY);
  rotate(frameCount/10.0);
    line(0,0, 80,0);
    stroke(255,80);
    fill(random(0,255),0,random(0,255),30);
    rect(0,0,mouseX,mouseX/30);
    translate(mouseX,mouseY);
    rotate(frameCount/10.0);
    stroke(random(0,255),0,random(0,255),30);
    fill(255,50);
    triangle(0,0, 100,0, 0,80);
}
}

void keyReleased()
{
  if (key=='c'||key=='c') {
background(255);
} }
