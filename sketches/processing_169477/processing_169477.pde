
void setup()
{
  size(600, 600, P3D);
  smooth();
}

void draw()
{
  background(255);
  lights();
  String s = "move mouse over object";
  fill(50);
  text(s, 10, height-70, 50, 80);  // Text wraps within text box
  
  translate(width/2, height/3+50, 0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  rotateZ(mouseX*0.01);
  noFill();
  strokeWeight(8);
  
  beginShape();
  stroke(255, 0, 100); // pink
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0,    0,  100);
  
  stroke(100, 0, 255); // purple
  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex(   0,    0,  100);

  stroke(255, 100, 0); // orange
  vertex( 100,  100, -100);
  vertex( -100,  100, -100);
  vertex(   0,    0,  100);
  
  stroke(0, 255, 100); // green
  vertex(-100,  100, -100);
  vertex( -100, -100, -100);
  vertex(   0,    0,  100);  
  endShape();
}




