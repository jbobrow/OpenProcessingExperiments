
// cat face

int x = 100;
int y = 100;
int w = 200;
int h = 40;
int eyeSize = 16;
int speed = 1;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  //change the x location of character by speed
  x = x + speed;

  //if edge is reached, reverse speed
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }

  // Try moving background() to setup() and see the difference!
  background(mouseX,89,mouseY);

  // set ellipse and rect to center mode
  ellipseMode( CENTER);
  rectMode ( CENTER);

  //arms are incorporated in to character design with a for loop
  for (int i = y + 7; i < y + h; i += 12) { 
    stroke(0);
    line(x-w/3,i,x + w/3,i);
  }

  // draw Body
  stroke(0);
  fill(mouseX,0,mouseY); 
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  rect(x,y,w/6,h*2);  

  //draw eyes
  fill(mouseX, 20, mouseY);
  ellipse(x-w/3+1,y-h/2,eyeSize,eyeSize*2);
  ellipse(x+w/3-1,y-h/2,eyeSize,eyeSize*2);

  //draw pupils
  fill(0);
  ellipse(x-w/3+1,y-h/2,eyeSize,eyeSize*1);
  ellipse(x+w/3-1,y-h/2,eyeSize,eyeSize*1);

  //draw legs
  stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(x-w/12,y + h,x-w/4,y + h + 10);
  line(x+w/12,y + h,x + w/4,y + h + 10);
}


                
                
