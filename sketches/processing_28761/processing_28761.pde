
void setup() {
  size(400,400);
  smooth();

}


void draw() { 
  background (255);
  int x=0;
  int y=0;
  float angle = 0;
  fill(55,40,200,50);
  for (x = 0;  x <= width; x+=20) {
    for (y= 0; y <= height; y+=20) {
      
      pushMatrix();
      translate(x,y);
      angle = atan2(mouseY-y, mouseX-x);
      rotate(angle);
      float abstand = dist(mouseX, mouseY, x, y);
      stroke(abstand);

      ellipse(0,abstand/2,6,6);
      
      ellipse(5,abstand/4,6,6);
     
      ellipse(10,abstand/8,6,6);
    
      ellipse(15,abstand/16,6,6);
      
      ellipse(0,abstand/2,2,2);
      ellipse(5,abstand/4,2,2);
      ellipse(10,abstand/8,2,2);
      ellipse(15,abstand/16,4,4);
      ellipse(20,abstand/32,2,2);
      ellipse(25,abstand/64,2,2);
      ellipse(30,abstand/120,2,2);
      ellipse(35,abstand/256,2,2);
      popMatrix();
      
  }
 
 }
  
}

