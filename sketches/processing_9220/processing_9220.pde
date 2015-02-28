
int x = 100;
int y = 100;
int w = 100;
int h = 100;
int eyeSize = 16;
int speed = 100;


void setup () {
  size (255,255);
  smooth();
}
void draw () {
  //change the x location of zoog by speed
  x = x + speed;
  
  //If we reached an edge; reverse speed (multiply by -1)
  //(NOTE: if speed is a + number, square moves right, - to the left!
  if ((x >width)||(x<0)) {
    speed = speed * -1;
  }
  
  background(255); //draw white background
  
  //set ellipse and rect's to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //draw Zoog's arms with a for loop
  for (int i=y+5; i<y+h; i+=10) {
    stroke(0);
    line(x-w/3,i,x+w/3,i);
  }
 
 /* 
  float distance = abs(mouseX - i);
  
  fill(distance);
  rect(i,0,10,height);
  */
  
  //draw zoog's body
  stroke(0);
  fill(175);
  rect(x,y,w/6,h*2);
  
  //zoogs head
  fill(255);
  ellipse(x,y-h/2,w,h);
  
  //draw zoogs eyes
  fill(0);
  ellipse(x-w/3,y-h/2,eyeSize,eyeSize*2);
  ellipse(x+w/3,y-h/2,eyeSize,eyeSize*2);
  
  //draw zoogs legs
  stroke(0);
  line(x-w/12,y+h,x-w/4,y+h+10);
  line(x+w/12,y+h,x-w/4,y+h+10);
}

