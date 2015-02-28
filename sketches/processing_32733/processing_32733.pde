
float x=4;
float y=1;
float xpos=200;
float ypos=200;
float r=random(0,200);
float g=random(0,200);
float b=random(0,200);
void setup() {
  size(400,400);
  background(0,0,0);
}
void draw() {
  background(0,0,0);
smooth();
  ellipse(xpos,ypos,10,10);
  fill(r,g,b);
  if (mousePressed) {
    r=random(0,200);
    g=random(0,200);
    b=random(0,200);
  }
  if(keyPressed) {
    if(keyCode==UP && ypos>=10) {
      ypos=ypos-2;
    }
    if(keyCode==DOWN && ypos<=height-10) {
      ypos=ypos+2;
    }
    if(keyCode==RIGHT && xpos<=width-10) {
      xpos=xpos+5;
    }
      if(keyCode==LEFT && xpos>=10) {
        xpos=xpos-5;
      }
  }
    
  ypos=ypos+y;
  xpos=xpos+x;
  if (ypos<=10 || ypos>=height-10) {
    y=y*-1;
  }
  if (xpos<=10 || xpos>=width-10) {
    x=x*-1;
  
  }

    

}

