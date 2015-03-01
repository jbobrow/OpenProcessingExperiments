
/* Shape rotation */
float angle = 0;
/* Shape pulse */
float x = 0;

void setup(){
  size(640, 640);
  /* The outlines of the shapes are red */
  stroke(0, 255, 0); 
}

void draw(){
  /* 
  Fill the whole screen with a black rectagle that has the opacity of 10.
  Makeing a fading effect 
 */
  fill(2, 4);
  rect(-1, -1, width+1, height+1);
  
  /* Increase angle by 0.1, the bigger the faster */
  angle += 0.2;
  /* Increase pulse by 1 */
  x += 1;
  /* cos(x) will produce a number from -1 to 1. Multiplying it by 24 will show more effect */
  float y = cos(x)*24;
  
  pushMatrix();
  /* Center the animation in the middle of the screen */
  translate(width/2, height/2);
  rotate(angle);
  /* Change these to line() or ellipse() for different cool effect */
  rect(-25+y/2, -25+y/2, -100-y, -100-y);
  rect(25-y/2, 25-y/2, 100+y, 100+y);
  popMatrix();
}


