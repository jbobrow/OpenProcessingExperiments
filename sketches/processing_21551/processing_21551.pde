

float x = 100;            // starting positions
float y = 100;
float xspeed = 1;
float yspeed = 3.3;


PImage ground;
PImage sky;


void setup() {
  size(300,300);
  background(255);

  ground = loadImage( "Pavement_1.jpg" );
  sky = loadImage( "sky.jpg" );
}


void draw() {
    smooth();
 
   image(sky,0,0);
  image(ground,0,150);


  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 20)) {
    xspeed = xspeed * -1;              
  }
  if ((y > height) || (y < 20)) {
    yspeed = yspeed * -1;
  }

  println(xspeed + " " + yspeed);
  
  noStroke();
  fill(255);
  ellipse(x,y,50,50);
}

void mousePressed() {
   xspeed += 2; 
  }

//void bouncingBallGround() {
//  fill(0);
//  noStroke();
//  ellipse(x,x,z,z);
//
//}
//
//void bouncingBallSky() {
//  fill(0);
//  noStroke();
//  ellipse(x,x,z,z);
//}


