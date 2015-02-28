
void setup() {
  size(800,800);
  smooth();
  background(255);
  
 
}
 
 
void draw() {
 


  int x=0;
  int y=0;
  float angle = 3;
 
 for (x = 0;  x <= width; x+=50) {
    for (y= 0; y <= height; y+=30) {
       
      pushMatrix();
      translate(x-20,y+5);
     angle = atan2(x,y);
      rotate(random(50));
     float abstand = dist(mouseX,mouseY,x,y);
      stroke(175,136,5);
 strokeWeight(.2);
 noFill();
      rect(abstand/x,abstand/y,6,10);
      popMatrix();
    }
 }
}


