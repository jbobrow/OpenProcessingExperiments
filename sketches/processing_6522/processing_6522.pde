
class WigglyFlower 
{
  float ox = 0;
  float oy = 0;
  float x = 0;
  float y = 0;
  float radius = 10;
  int offset = 10;
  color c; 

  WigglyFlower() { 
  }

  WigglyFlower(float mousex, float mousey, float radius) { 
    this.ox = mousex;
    this.oy = mousey;
    this.radius = radius;
    this.offset = (int) random(15,45);
  }  

  public void draw() {
    translate(ox, oy);

    for (int angle = 0; angle < 360; angle += offset) {
      x = radius * cos(radians(angle));
      y = radius * sin(radians(angle));

      // Randmize the coordinates around 'offset'
      x += random(offset/3);
      y += random(offset/3);

      // Draw a white line from mouse cursor position to the point (x,y ) 
      // on circle
      stroke(255);    
      line(0, 0, x, y);

      // Calculate a random color  
      c = color(random(255), random(255), random(255));

      // Draw a circle at end of the line drawn before using white
      // outline and filled with r,g,b colors
      stroke(50);
      fill(c);    
      ellipse(x, y, offset/2, offset/2);
    }

    translate(-ox, -oy);
  }

}//class WigglyFlower 




