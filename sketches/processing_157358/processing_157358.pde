

PFont f;
float x,y,z,t,side=80,cas=1;
boolean pauseon=true;

void setup()
{
  size(432,588,P3D);

  x=random(-40,40);
y=random(-40,40);
ellipseMode(CENTER);
f=createFont("Roboto Black",72);

  
}
void draw()
{
 
if(pauseon)
{
 background(220); 
fill(0);
 textFont(f);
 textAlign(CENTER);
  text("A",width/2-15,height-50);
 text("T",width/2+10,height-50);

t=millis();
float rot1,rot2;
rot1=map(mouseX,0,width,0,2*PI);
rot2=map(mouseY,0,height,0,2*PI);
pushMatrix();
translate(width/2,height/2,100);
fill(#F56060);
noStroke();
ellipse(0,0,60,60);
fill(10);
ellipse(0,0,20,20);
fill(255);
ellipse(10,10,5,5);
ellipse(-10,-10,8,8);
x=30*sin(t/4500);
y=30*cos(t/4500);

noFill();
stroke(140);

for(int i=1;i<cas+1;i++)
{
  rotateY(rot1+i*PI/8);
  rotateZ(rot2+i*PI/8);

  pushMatrix();
  translate(x,y,40);
  box(side,side,side);
  popMatrix();
}
popMatrix();
}
}
void keyPressed()
{
  if(key=='1')
  cas=1;
  else
  if(key=='2')
  cas=2;
  else
  if(key=='3')
  cas=3;
  if(key=='s')
  saveFrame();
  if(key=='p')
  {
    if(!pauseon)
    pauseon=true;
    else
    if(pauseon)
    pauseon=false;
  }
}


