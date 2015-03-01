
// initial position for the circle
float circle_x = 300;
float circle_y = 20;
// how much to move the rectangle on each frame
float move_x = 50;
float move_y = -10;
float x = 0;


void setup() {
 size(400,400);
 fill(#89EA24);
noStroke();
 strokeWeight(2);
smooth();
}
void draw() {
  float circle_size = random(20, 60);
  fill(random(10,20));
 if (random(50) > 20) {
      stroke(#F55E28);
    } 
    else {
      stroke(#E6F528);
    }
  rect(0 + x, 200, circle_size, circle_size);
    
  fill(#16F772);
  noStroke();
  rect(x, 0, x, 100);
  x = x + 1;

  if (x > width) {
    x = 0;
  }
  // sometimes we decide to change the line color
  if (random(250) > 70) {
    noStroke();
    // now we decide if to use black or white
    if (random(50) > 20) {
  
      stroke(#F57D40);
    } 
    else {
      stroke(#6340F5);
    }
    
  }
fill(#F316F7);
 noStroke();
  rect(x, 300, x, 100);
  x = x + 3;

  if (x > height) {
    x = 400;
 }
 
  // sometimes we decide to change the line color
  if (random(100) > 70) {
  
    // now we decide if to use black or white
    if (random(100) > 50) {
      stroke(0);
    } 
    else {
      stroke(255);
    }
    
  }

        
  
  stroke(#15FF9F);
  fill(random(255),random(255),random(255));
noStroke();
  rect(circle_x, circle_y, 30, 30);
 fill(2);
line(circle_x, circle_y, 0, 0);
 circle_x = circle_x + move_x;
 circle_y = circle_y + move_y;
  if(circle_x > width) {
   circle_x = width;
   move_x = -move_x;
   println("too far right");
 }
 if(circle_y > height) {
   circle_y = height;
   move_y = -move_y;
   println("too far bottom");
 }
 if(circle_x < 0) {
   circle_x = 0;
   move_x = -move_x;
   println("too far left");
 }
 
 if(circle_y < 0) {
   circle_y = 0;
   move_y = -move_y;
   println("too far top");
 }
}
void keyPressed() {
  if(key==' '){ 
    background(random(255), random(255), random(255));}
    if(key=='b'){
      fill(random(#8228FA,#FF9512)); rect(circle_x, circle_y, 20, 20);
    }
  }
  
