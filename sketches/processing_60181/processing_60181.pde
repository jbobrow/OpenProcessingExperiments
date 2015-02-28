
void setup() {
  size(800,800);
  smooth();
  background(255);
  
 
}
 
 
void draw() {
 background(255);
 noFill();

  int x=0;
  int y=0;
  float angle = 3;
 
 for (x = 0;  x <= width; x+=20) {
    for (y= 0; y <= height; y+=20) {
       
      pushMatrix();
      translate(x,y);
     angle = atan2(x,y);
      rotate(random(10));
     float abstand = 0;
      stroke(200,115,247);
 strokeWeight(2);
      
      
      triangle(10,sin(abstand/x),cos(abstand/y),angle,3,6);
      triangle(47,cos(abstand),abstand/y,tan(angle),10,10);
     
      popMatrix();
       
  
   

    }
 }
}


