
/**These are comments in Processing. This codes draws a circle of 
random color, speed and direction. It gets stuck on the sides 
*/
float y = 30.0;
float x = 30.0;
float radius = 20.0;
float speedX = 1.0;
float speedY = 10.0;
float directionX = 1;
float directionY = 1;
color ccolor = color(204, 102, 0);

/**global variables from the other sketch. these need to be brough into thier own objects.
*/
float bx;
float by;
int bs = 20;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0;
 


void setup(){
frameRate(30);
size(450,450);
smooth ();
noStroke();
ellipseMode (RADIUS);
colorMode (RGB);

bx = width/2.0;
by = height/2.0;
rectMode(CENTER);
}

void draw(){

background (0);
fill(ccolor);
ellipse (x, y, radius, radius);

y += speedY*directionY;
if (y + radius > height || y - radius < 0 ) {directionY = -directionY;
}

x += speedX*directionX;
if (x + radius > width || x - radius < 0 ) {directionX = -directionX;
}
// Test if the cursor is over the box 
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(1533);
    bover = false;
  }
  
  // Draw the box
  rect(bx, by, bs, bs);
}

void mousePressed(){ 
directionX = random(-1,1);
directionY = random(-1,1);
speedX = random(50);
speedY = random(50);
radius = random(20,150);
ccolor = color(random(255), random(255), random(255)); 

if(bover) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-bdifx; 
    by = mouseY-bdify; 
  }
}

void mouseReleased() {
  locked = false;
}               
