
void setup(){
size(400,400);
smooth();
}
 
void draw()
{
  background(200);
  int x = 0;
  int y = 100;
  float angle = 0;
   
  for (x = 0; x <= width; x+=15) {
    for (y = 0; y <= height; y+=15) {
      pushMatrix();

      translate(x,y);
      angle = atan2(mouseY-y, mouseX-x); 
      rotate(angle);
      float abstand = dist (mouseX, mouseY,0,0);
       stroke(abstand);  
      line(0, 0, abstand/5, 0);
      ellipse (0,0,0,0);
      popMatrix();

  
    }
  }
}

