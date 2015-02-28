
float centerx=350;
float centery=250;
float x=700;
float y=500;
float spacex=20;
float spacey=20;
int cl=0;

void setup(){
  size(700,500);
  background(120,166,189);
  smooth();
}

void draw(){
  ellipseMode(CENTER);
  while(x>=20 && y>=20){
   
    ellipse(centerx,centery,x,y);
    x=x-spacex;
    y=y-spacey;
    
    stroke(0);
    fill(cl);
    cl=cl+20;
  }
}
