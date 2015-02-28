

void setup () {

  
size(300,300);
background(120,0,260);
fill(0,290,0);
stroke (20);
frameRate(50);

}


void draw () {
  if (mousePressed) 
  fill(0,0,100);
  ellipse (mouseX,mouseY,10,10);
  if (mousePressed)
  fill(0,290,200);
  ellipse(mouseY,mouseX,20,20);
  fill (290,0,185);
  ellipse (mouseX,mouseY,20,20);
  stroke (mouseY,10,mouseX);
  float distance = dist (mouseX,mouseY,mouseX,mouseY);
  float maxStroke = 220;
  strokeWeight (maxStroke - constrain (distance, 0, maxStroke));
  
}

