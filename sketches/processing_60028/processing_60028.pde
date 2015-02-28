
void setup() {
  size(800,800);
  smooth();
  background(100);
  
 
}
 
 
void draw() {
 background(255);
 fill(noise(282,76,86));

  int x=0;
  int y=0;
  float angle = 3;
 
 for (x = 0;  x <= width; x+=40) {
    for (y= 0; y <= height; y+=40) {
       
      pushMatrix();
      translate(x,y);
     angle = atan2(x,y);
      rotate(random(300));
      float abstand = random(mouseX,mouseY);
      stroke(random(282));
 strokeWeight(.2);
      triangle(30,50,mouseX,mouseY,random(5),5);
      ellipse(abstand/x,abstand/y,5,5);
       ellipse(abstand/angle,abstand,20,20);
     
      popMatrix();
       
  
   

    }
 }
}


