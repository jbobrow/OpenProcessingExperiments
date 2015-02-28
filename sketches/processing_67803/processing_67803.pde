
void setup()
{
size(400,200);

}
int Rx= (int)random(400),Ry=(int)random(200);

void draw()
{
  
smooth();
background(123,178,98);
stroke(255);
fill(255);
quad(50,50,50,180,270,180,270,50);  
noFill();
stroke(0,0,255);
strokeWeight(3);
ellipse(100,100,50,50);
stroke(0,0,0);
strokeWeight(3);
ellipse(160,100,50,50);
stroke(255,0,0);
strokeWeight(3);
//ellipse(220,100,50,50); Practica 1
//ellipse(mouseX,mouseY,50,50); Practica 2
//Practica 3
if(Rx!=220)
{
   Rx=(int) random(190,250);
}
  if(Ry!=100)
{
 Ry=(int) random(70,130);
}
 ellipse(Rx,Ry,50,50);

stroke(255,255,0);
strokeWeight(3);
ellipse(130,130,50,50);
stroke(0,255,0);
strokeWeight(3);
ellipse(190,130,50,50);
}
