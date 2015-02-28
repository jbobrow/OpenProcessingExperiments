
 void setup() {
  size(600,600);
  smooth();
  noCursor();  
}

void draw() {

  background(0);
  

 pushMatrix();
 for (float y = 0; y < 30; y++) {
   pushMatrix();

     for (float x = 0; x < 30; x++) {
        fill(255,0,0);
        rect(0,0,x,y);
        translate((sqrt(mouseX*5)),0);
        }
   popMatrix(); 
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

