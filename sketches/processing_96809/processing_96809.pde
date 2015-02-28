
//Monyse Takaki
void setup(){
size(200,200);
background(0);
 
}
 
void draw(){
 
for(int x=10;x<200;x=x+60)
{
  for(int y=10;y<200;y=y+60)
{
smooth ();
stroke (2);
  ellipse(x,y,20,20);
 
}
}
 
for(int i=20; i<181; i=i+60)
{
  for(float j=7.5; j<200; j=j+60)
  {
   stroke (1);
   smooth ();
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
 
stroke(#E82FA4);
strokeWeight (2);
ellipse(70,130,20,20);
ellipse(130,130,20,20);
 
}
