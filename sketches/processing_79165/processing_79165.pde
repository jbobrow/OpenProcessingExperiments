
//code from http://www.openprocessing.org/sketch/53662 

float x = 150; float y = 300; // location of ball
 
float speed = 0; //speed of ball
float gravity = 0.1; //gravity of ball
 
float cr = 255; //color of ball
float cg = 255;
float cb = 255;
 
/*---------------------------------*/
void setup() {
  size (400,400);
  background (250);
  smooth ();
  rectMode (CENTER);
  ellipseMode (CENTER);
}
 
/*-------------------------------*/void draw() {
  background (255);
  rectMode(CENTER);
  ellipseMode(CENTER);

 //text
  PFont font;
  font = loadFont ("MountainRetreat-70.vlw");

  textFont(font);
  fill (cr,cg,cb);

  text("HELLO", x, y); 
   
  y = y + speed;
  speed = speed + gravity;
   
  //If ball reaches bottom
  //Reverse Speed
  if (y > height) {
  speed = speed * -0.99;
  cr = random(255);
  cg = random(255);
  cb = random(255);
  }
}

void mouseClicked() {
  gravity += .2;
}


