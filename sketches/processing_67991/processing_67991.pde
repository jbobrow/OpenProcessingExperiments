
float x,y;
int a,b;
boolean opc;
void setup()
{
  size(400,400);
  noFill();
  strokeWeight(4);
  background(255);
  x=0;
  y=0;
  opc=false;
  smooth();
}

void draw()
{
  background(255);
  x=random(0,400);
  y=random(0,400);
  stroke(0,80,255);//azul
  ellipse(100,100,40,40);
  stroke(255,255,0);//amarillo
  ellipse(125,120,40,40);
  stroke(0,0,0);//negro
  ellipse(150,100,40,40);
  stroke(0,255,70);//verde
  ellipse(175,120,40,40);
  stroke(255,0,0);//rojo
  if((x>=195&&x<=205)&&(y>=95&&y<=105))
    opc=true;
  
  if(opc==false)
    ellipse(x,y,40,40);
  else
    ellipse(200,100,40,40);
}

