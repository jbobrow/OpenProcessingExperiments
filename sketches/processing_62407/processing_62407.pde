
void setup(){
size(600,300);
background(0);
smooth();
}
 
void draw()
{
  fill(255);
  int x = 0;
  int y = 0;
  float angle = 0;
   
  for (x = 0; x <= width; x+=20) {
    for (y = 0; y <= height; y+=20) {
      pushMatrix();
      //line(x, y, x+10, y+10);
      translate(x,y);
      angle = atan2(mouseY-x, mouseX-y); 
      rotate(angle);
      float distance = dist (mouseX, mouseY,x,y);
      stroke(distance);  
      line(0, 0, distance/angle, 5);
      ellipse (0,0,angle,angle);
      popMatrix();
  
    }
  }
}
