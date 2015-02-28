
void setup(){
  size(400,400);
    smooth();
  background(204,220,255);
  noStroke();
  //mountain
  triangle(0,100,0,400,400,400);  
}


int x=0;
int y=0;
int speed=3;
void draw()
{
  background(204,220,255);
  frameRate(30);
  noStroke();
  
  triangle(0,100,0,400,400,400);  
  strokeWeight(15);
  stroke(0);
  line(x,y+100,x+66,y+150);

  strokeWeight(8);
  line(x+20,y+80,x+76,y+120);
  line(x+48,y+100,x+0,y+100);
  line(x+48,y+100,x+66,y+150);
  
  strokeWeight(4);
  ellipseMode(CENTER);
  ellipse(x+68,y+80,40,40);

x=x+speed;
y=y+speed;
if (x>=400){
x=0;
}
if(y>400){
  y=0;
}
 }

