
float angle= 0.1;
int speed =10;  // on increasing speed it will accelerate fast
float x,y;
float r=50;
void setup(){
size(400,400);
 
}
void draw(){
  background(220);
  fill(0);
  translate(width/2,height/2);
  for(int i=1;i<=speed;i++) // i <100 karne se path increase hota hai
  {
  angle +=.005;// it wil fast on increasing increment 
 
  rotate(.9);
 
  x=r*cos(angle);
  y=r*cos(angle);
  ellipse(x,y,r,r);
  }
   
}

