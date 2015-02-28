
int xPos=0;
int yPos=0;


void setup(){
  size(600,600);
}
void draw(){
  noStroke();
  
background(0);
{  ellipse(xPos,300,30,35);
  fill(204,102,0);
}
xPos++;

//left
rect(12,250,12,100);
fill(0,255,255);

rect(580,250,12,100);
fill(255,250,250);

if(xPos<580)
{
  xPos=xPos+1;
}else{
  xPos=24;
}
}


