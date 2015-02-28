
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
  float angle = 0;
 
 for (x = 0;  x <= width; x+=80) {
    for (y= 0; y <= height; y+=30) {
       
      pushMatrix();
      translate(x,y);
      rotate(random(200));
     float abstand = 0;
      stroke(31,143,173);
 strokeWeight(2);
      
    
      ellipse(0,abstand/18,2,2);
      ellipse(4,abstand/35,9,9);
       ellipse(17,abstand/16,.8,.8);
      ellipse(48,abstand/4,7,7);
       ellipse(30,abstand/14,13,13);
      ellipse(89,abstand/17,6,6);
       ellipse(28,abstand/89,3,3);
      ellipse(17,abstand/2,7,7);
       ellipse(60,abstand/47,12,12);
      ellipse(55,abstand/5,4,4);
      strokeWeight(.9);
      line(10,abstand/15,20,20);
      line(40,abstand/8,16,30);
      
   
     
      popMatrix();
       
  
   

    }
 }
}


