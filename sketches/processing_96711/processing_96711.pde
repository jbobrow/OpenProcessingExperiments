
void setup(){
size(200,200);
background(255);

}

void draw(){

for(int x=10;x<200;x=x+60)
{
  for(int y=10;y<200;y=y+60)
{
stroke(0);
  ellipse(x,y,10,10);

}
}

for(int i=20; i<181; i=i+60)
{
  for(float j=7.5; j<200; j=j+60)
  {
   stroke(0);
    rect(i,j,40,5);
}
}

for(float d=7.5; d<200; d=d+60)
{
  for(float v=20; v<181; v=v+60)
  {
    rect(d,v,5,40);
}
}

stroke(255,0,0);
ellipse(70,130,10,10);
ellipse(130,130,10,10);

}
