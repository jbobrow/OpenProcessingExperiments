
float speed = 1;
int diameter = 20;
float x ;
float y ;
float r;
float xspeed, yspeed;
float easing=0.009;
PImage bg;
PImage lotus1;
PImage lotus2;
float angle=0.0;
float e;
 
 
 
void setup() {
  size(600, 600);
  smooth();
  bg=loadImage("snow2.png");
  lotus1=loadImage("lotus1.png");
  lotus2=loadImage("lotus2.png");
  x = width/2;
  y= height/2;
 
  r=random(10, 50);
  xspeed = random(-3, -5);
  yspeed = random(-5, 5);
}
 
void draw() {
  // background(255);
  noStroke();
 
  //x += random(-speed, speed);
  //y += random(-speed, speed); 
 
  image(bg, 0, 0);
 
  
 
 
 
 
  //image(lotus2,30+x,60+y,150,150);
 
 
  ellipse(mouseX, mouseY, 5, 5);
  fill(255, 10);
 
  //trick to have no background but still have a traisl
 
  rect(0, 0, width, height);
 
 
 
  if (mousePressed == true) {
    fill(0);
  }
  else {
    fill(255);
  }
 
  ellipse(mouseX, mouseY, 20, 20);
 
 
 float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
 
  //Updating and Testing
  x= x + xspeed;
  y= y + yspeed;
 
 
  if (x <= r || x >= width - r) {
    xspeed = xspeed * -1;
  }
 
  if ( y <= r || y>= height -r ) {
    yspeed = yspeed *-1;
  }
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
 
  //can do random speed each time too
 
 
 
 
 
 
 
 
 
 
 
  //Render
  fill(50);
  ellipse(x, y, r*3, r*3);
 
 
  // lotus flower
 
  rotate(angle);
  image(lotus1, 110, 300, 150, 150);
  angle+=0.00005;
 
  rotate(angle);
  image(lotus1, 10, 50, 200, 200);
  image(lotus1, 300, -100, 100, 100);
  image(lotus1, 600, 300, 100, 100);
  image(lotus1, 600, -50, 200, 200);
  image(lotus1, 300, -500, 100, 100);
  image(lotus1, 600, -300, 100, 100);
  angle+=0.00005;
 
  rotate(angle);
  image(lotus2, 200, 200, 150, 150);
  angle+=0.00005;
 
  rotate(angle);
  image(lotus2, 400, 400, 100, 100);
  image(lotus2, 200, 100, 130, 130);
  image(lotus2, 200, -100, 130, 130);
  image(lotus2, 600, 100, 100, 100);
  image(lotus2, 600, 400, 150, 150);
  image(lotus2, 500, 300, 150, 150);
  image(lotus2, 600, 50, 200, 200);
   
    image(lotus2, -400, 400, 100, 100);
  image(lotus2, -200, 100, 130, 130);
  image(lotus2, 200, -100, 130, 130);
  image(lotus2, 600, -100, 100, 100);
  image(lotus2, 600, -400, 150, 150);
  image(lotus2, -500, -300, 150, 150);
  image(lotus2, -600, -50, 200, 200);
  angle+=0.000000001;
 
 
  if (mousePressed == true) {
    ellipse(mouseX*3, mouseY*3, 20, 20);
  }
  else {
    fill(255);
     
 
     
   
  }   
   

  }



