
/**
 * Pino Marittimo
 * by Paolo Tonon.  
 * 
 * Based on Recursive Tree by Daniel Shiffman 
 */

float theta;   
void setup() { 
  size(600,600);
  smooth();
}


float spessore = 0;


void draw() {
float lunghezza = random(190)+80;
spessore = lunghezza/10 ;
  background(225, 234, 245);
  frameRate(1);
 
 stroke (29, 28, 20);

  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 60 pixels
  strokeWeight(spessore);
  noFill();
  curve(0,0,0,0,0,-lunghezza,-random(lunghezza),-lunghezza-(lunghezza/0.3));
  // Move to the end of that line
  translate(0,-lunghezza);
  // Start the recursive branching!
  branch(lunghezza);
   delay(9000);
}

void branch(float h) {
  
  h *= random(0.33)+0.36f;
  float rami = random(5)+1;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 3) {
    for (int i = 0; i< rami; i++){
      // Let's pick an angle 0 to 90 degrees
      float a = random(70);
      float decisione = random (2);
      // Convert it to radians
      theta = radians(a);    
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      
      if (decisione > 1){
        rotate(theta);   // Rotate by theta
      } else  {
        rotate(-theta);   // Rotate by theta   
      }  
      strokeWeight(h/8);
      stroke (29, 28, 20);
      noFill();
      curve(0,0,0,0,0,-h,-random(h*2),-h-(h/0.3));
      translate(0,-h); // Move to the end of the branch
      branch(h);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
     
    } 
  } else {
   float l = random (10)+7;
   float b = random(100);
   float aghi = random (40)+10;
   float gamma  = radians(b);
   float decisione = random (2);
   if (decisione > 1){
        rotate(gamma);   // Rotate by theta
      } else  {
        rotate(-gamma);   // Rotate by theta   
      }
       strokeWeight(1);
       int bInt = int(b);
       int aghiInt = int(aghi);
      for (int j = 0; j < aghi; j++) {
      
        stroke(aghiInt,b+100,aghiInt);
        //print (" b"+int(b));
        //print (" aghi"+int(aghi)); 
        line(0,0,0,-l);  // Draw the branch
       if (b < 10) {
          fill (49, 28, 20);
          stroke (59, 36,28);
         ellipse(2, 3, 4, 3);
       }
    }  
  }
}

void mousePressed() {
  loop();
}

