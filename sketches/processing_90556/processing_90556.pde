
float x;
float y;
float px;
float py;
float easing=0.1;

int x= 120;
int y= 60;
int radius = 12;

void setup(){
  size(500,500);
  smooth();
  ellipseMode(RADIUS);
}

void draw(){
  background(204, 150,0);

  
  float d=dist(mouseX,mouseY,x,y);
  if(d<radius){
    radius++;
    fill(0);
  } else{
    fill(255);
  }
  ellipse(x,y,radius,radius);
}



