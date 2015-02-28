
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
  rotate(radians(frameCount * 10  % 360));
//fill(100, 0, 255, 30);
   //arc(50, 55, 60, 30, 0, HALF_PI);
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
   rotate(radians(frameCount * 2  % 360));
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
   rotate(radians(frameCount * 10  % 360));
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
    rotate(radians(frameCount * 10  % 360));
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
    rotate(radians(frameCount * 10  % 360));
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
    rotate(radians(frameCount * 10  % 360));
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
    rotate(radians(frameCount * 10  % 360));
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
    rotate(radians(frameCount * 10  % 360));
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



