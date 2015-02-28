
int x=0;
int speed=5;

void setup(){
  size(400,400);
  smooth();
  noFill();
  background(0);
}

void draw(){
  frameRate(30);
  noFill();
  float a=random(400);
  float b=random(400); 
  stroke(b/1.5,200,a/1.5);
  strokeWeight(0.5);
  line(a,b,200,200);
  for (int i=0; i<25;i=i+5)
  {
    ellipse(a,b,i,i);  
}
fill(0);
stroke(0);
rect(x,0,20,400);
x=x+speed;
if((x<0)||(x>=400)){
  speed=speed*-1;
}

}
