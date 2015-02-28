
void setup() {
  size(500,500);
  smooth();
  noCursor(); 
}
 
void draw() {
 
   
  background(255);
  translate(width/2,height/2);
   scale(5);

 pushMatrix();
 for (float y = 0; y < 4; y++) {
   pushMatrix();
 
     for (float x = 00; x < 3; x++) {
        fill(0,0,0);
        rect(0,0,x,y);
   translate(0,5);
        }
   popMatrix();
  rotate(millis() * 0.001 * TWO_PI / 2.0);
   translate(0,5);
 }
popMatrix();
  
  
  
  

 pushMatrix();
 for (float y = 0; y < 4; y++) {
   pushMatrix();
 
     for (float x = 00; x < 3; x++) {
        fill(0,0,0);
        rect(0,0,x,y);
   translate(0,5);
        }
   popMatrix();
  rotate(millis() * 0.001 * TWO_PI / -2.0);
   translate(0,5);
 }
popMatrix();
  
}


