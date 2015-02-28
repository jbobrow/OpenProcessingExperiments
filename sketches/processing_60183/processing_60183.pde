
void setup() {
  size(800,800);
  smooth();
  background(255);
  
 
}
 
 
void draw() {
 


  int x=0;
  int y=0;
  float angle = 3;
 
 for (x = 0;  x <= width; x+=500) {
    for (y= 0; y <= height; y+=30) {
       
      pushMatrix();
      translate(x,y);
     angle = atan2(x,y);
      rotate(random(200));
     float abstand = dist(mouseX,mouseY,x,y);
      stroke(cos(x+y)*350,100,100);    
 strokeWeight(.2);
 noFill();  
      rect(x/abstand-200,abstand/angle,6,10); 
      popMatrix();
    }
 }
}


