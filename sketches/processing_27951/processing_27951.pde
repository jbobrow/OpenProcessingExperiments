
void setup(){
size(400,400);
smooth();
}
 
void draw()
{
  background(0);
  int x = 0;
  int y = 0;
  float angle = 0;
   
  for (x = 0; x <= width; x+=15) {
    for (y = 0; y <= height; y+=15) {
      pushMatrix();
      //line(x, y, x+10, y+10);
      translate(x,y);
      angle = atan2(mouseY-y, mouseX-x); 
      rotate(angle);
      float abstand = dist (mouseX, mouseY,x,y);
       stroke(abstand);  
      line(0, 0, abstand/10, 0);
      ellipse (0,0,4,4);
      popMatrix();
      //angle += mouseX/1000.0;
  
    }
  }
}

