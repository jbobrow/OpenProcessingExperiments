
int speed=10;
int x=0;
void setup(){
  size(400,400);
  smooth();
  fill(255);
  strokeWeight(5);
}
//setup
 
void draw(){
  float g=random(200);
  float d=random(200);
  background(g/2,d/2,d/2);
  fill(255,10);
  noStroke();
for(int i=0; i<300; i=i+5)
{
  ellipse(150,100,i,i);
}
  stroke(176,226,255);
  frameRate(10);
  for(int i=10;i<=100;i+=30){
    for(int j=10;j<=100;j+=30){
      float m=random(400);
      float n=random(400);
      point(m,n);
      point(n,m);
    }
  }
  frameRate(20);
  noStroke();
  fill(238,232,170,230);
 ellipse(x,280,50,50);
 ellipse(x+20,280,50,50);
ellipse(x+10,300,50,50);
ellipse(x-10,300,50,50);
ellipse(x+30,300,50,50);
  x=x+speed;
if ((x<0)||(x>=400)){
  speed=speed*-1;
}
}
