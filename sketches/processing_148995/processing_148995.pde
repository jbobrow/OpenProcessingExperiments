

// Two ball variables 
 Ball ball1; 
 Ball ball2; 
 
 void setup() { 
 size(400,400); 
 frameRate(30); 
 smooth(); 
 // Initialize balls 
 ball1 = new Ball(64); 
 ball2 = new Ball(32); 
 } 
 
 void draw() { 
 background(0); 
 // Move and display balls 
 ball1.move(); 
 ball2.move(); 
 ball1.display(); 
 ball2.display(); 
 boolean intersecting = intersect(ball1.x,ball1.y,ball2.x,ball2.y,ball1.r,ball2.r); 
 if (intersecting) { 
 println( "yes" ); 
  } else { 
 println( "no" ); 
 }
 
 } 
 

 
 // A function that returns true or false based on whether two circles intersect 
 // If distance is less than the sum of radii the circles touch 
 boolean intersect(float x1, float y1, float x2, float y2, float r1, float r2) { 
 float distance = dist(x1,y2,x2,y2); // Calculate distance 
 if (distance < r1 + r2) { // Compare distance to r1 + r2 
 return true; 
 } else { 
 return false; 
 }
 }
 
 
 class Ball {
  //variables
 float r; // radius 
 float x,y; // location 
 float xspeed,yspeed; // speed 
 
 // Constructor  
 Ball(float tempR) { 
   // temps y initialize
 r = tempR; 
 x = random(width); 
 y = random(height); 
 xspeed = random( -5,5);
 yspeed = random( -5,5);
 }
 
 
 //functions
 void move() { 
 x += xspeed; // Increment x 
 y += yspeed; // Increment y 
 // Check horizontal edges 
 
 if (x> width || x < 0) { 
 xspeed *= -1; 
 } 
 //Check vertical edges 
 if (y> height || y<0) { 
 yspeed = yspeed* -1 ;
 } 
 } 
 // Draw the ball 
 void display() { 
 stroke(255); 
 fill(100,50); 
 ellipse(x,y,r*2,r*2); 
 } 
 } 

  
 
  
