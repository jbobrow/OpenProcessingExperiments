


 void setup() {
  size(600,600);
  smooth();
  noCursor();  
}

void draw() {

  background(0);
  translate(width/2,height/2);

 pushMatrix();
 for (float y = 0; y < 30; y++) {
   pushMatrix();

     for (float x = 0; x < 30; x++) {
        fill(255,0,0);
        rect(0,0,x,y);
        translate((sqrt(mouseX*5)),0);
        }
   popMatrix(); 
  rotate(millis() * 0.001 * TWO_PI / 2.0);
   translate(0,(sqrt(mouseY*5)));
 }
popMatrix();
 
 
      rotate(millis() * 0.001 * TWO_PI / 2.0);  
 
 pushMatrix();
  for (float y2 = 30; y2 > 0; y2--) {
   pushMatrix();
      
     for (float x2 = 30 ; x2 > 0; x2--) {
        fill(255,0,0);
        ellipse(width/2,height/2,x2,y2);
        translate((sqrt(mouseX*5)),0);
      rotate(millis() * 0.001 * TWO_PI / 2.0);  
      }
   popMatrix(); 
         rotate(millis() * 0.001 * TWO_PI / 2.0);  
   translate(0,(sqrt(mouseY*5)));
 }
popMatrix();

}




/* 

pushMatrix();

               
          for (float i = 50; i > 0; i= i - 3 ) {
               ellipseMode(CENTER);
               colorMode(HSB);
               fill(0,0,255-i);
   
               // stroke(0,0,0,i/8);
               noStroke();
               ellipse(0,0,i,i);
              
               }
        popMatrix();
        
        
        
        */

