
int numboxes;
int nuboxes;


void setup()
{
size(900,900);
numboxes= 100;
nuboxes=30;
noLoop();
rectMode(CENTER);
smooth();

}

void draw()
{
background(0);
noFill();
stroke(255,100,100);
strokeWeight(2);

for(int i=0; i<numboxes; i++  )
{
  stroke(i*2.55,255-(i*2.55),255,100);
  pushMatrix();
  
  translate(0 +(i*8),height/2-(i*2));
  rotate(i);
  ellipse(0,0,i*22,i*10);
 
  popMatrix();
}


for(int i=0; i<nuboxes; i++  )
{
  stroke(i*2.55,255-(i*2.55),255,100);
  pushMatrix();
  
  translate(0 +(i*8),height/2-(i*2));
  rotate(i);
  fill(5,100);
  ellipse(400,350,i*20,i*10);
 
  popMatrix();
}

}
