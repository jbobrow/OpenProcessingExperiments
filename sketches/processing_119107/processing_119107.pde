
/*
Lines around a point
*/


// Starting point coordinates
int x1 = 250;
int y1 = 250;

void setup() {
  size(500, 500);
  background(255);
 
}

void draw() {
  
   pushMatrix();
  translate(100, 100);
   stroke(137);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
  popMatrix();
  
   pushMatrix();
  translate(200, 200);
   stroke(0,255,255,200);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
  popMatrix();
  
     pushMatrix();
  translate(100, 150);
   stroke(255,255,0);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
  popMatrix();
  
  
      pushMatrix();
  translate(50, 50);
   stroke(33,119,227);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
  popMatrix();
  
   
      pushMatrix();
  translate(5, 10);
   stroke(9,13,23);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
  popMatrix();
  
  
      pushMatrix();
  translate(5, 10);
   stroke(99,121,221);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,220),random(0,200));
  popMatrix();
  
       pushMatrix();
  translate(1, 1);
   stroke(19,161,189);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,220),random(0,200));
  popMatrix();
  
  
       pushMatrix();
  translate(50, 300);
   stroke(255);
  strokeWeight(5);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,220),random(0,200));
  popMatrix();
  
  
  

}



