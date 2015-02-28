
int mysize = 100;
int speed = 1;
int direction = 1;
float ypos = 200;
float xpos = 350;

void setup() {
  size(700, 400);
  background(255);
  noFill();
}



void draw() {
  background(255);
  ypos = ypos + (mouseY - ypos)/10;
  xpos = xpos + (mouseX - xpos)/10;
  stroke(0);
  ellipse(xpos, ypos, mysize, mysize);
  ellipse(ypos, xpos, mysize, mysize);
  ellipse(width-ypos, height-xpos, mysize, mysize);
  ellipse(ypos, height-xpos, mysize, mysize);
  ellipse(width-ypos, xpos, mysize, mysize);
  //  ellipse(ypos,xpos,mysize,mysize);
  ellipse(width-xpos, height-ypos, mysize, mysize);
  ellipse(xpos, height-ypos, mysize, mysize);
  ellipse(width-xpos, ypos, mysize, mysize);
  //  ellipse(xpos,height-ypos,mysize,mysize);
}


//ypos = ypos + (mouseY - ypos)/10;


