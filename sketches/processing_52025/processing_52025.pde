
int xpos=5, xdirection = 2,ypos=250; //left or right

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(255);
  xpos = xpos + xdirection;
  if (xpos>500 ||xpos<0){
    xdirection*=-1;
  }
  strokeWeight(8);
  noFill();
  ellipse(xpos,ypos, 150,150);
  fill(0);
  ellipse(xpos+30,ypos-30,66,66);
  line(xpos-60,ypos+45,xpos-100,ypos+100);
  line(xpos,ypos+75,xpos,ypos+130);
  line(xpos+60,ypos+45,xpos+100,ypos+100);
}               
