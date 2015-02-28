
void setup()
{
  size(500,500);
  smooth();
  strokeWeight(2);
}

void move(){
  
}
void draw()
{
  noCursor();
  float d = dist(pmouseX*3,pmouseY, mouseX,mouseY);
  float f = dist(pmouseX,pmouseY, mouseX,mouseY);
  fill(10*f,0.8*d,1-0.8*d);
ellipse(0,0,2*d,d);
ellipse(500, 500,2*d,d);
ellipse(0, 500,2*d,d);
ellipse(500, 0,2*d,d);
ellipse(width/2,height/2,d,d);

/*background(255);
//pmouseX pmouseY
line(pmouseX, pmouseY, 0,0); */
}


