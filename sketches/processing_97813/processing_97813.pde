
//giovanna simokado
int x=100;
int y= 10;
int telhax=10;
int telhay=7;
int ptx=10;
int pty=10;

 void setup(){
strokeWeight (3);
size (200,200);
background (15,71,160);
stroke (180,81,42);

}

void draw(){
for (int i=0; i<5;i++) //lado direito
{
  line (x+10,y+3,x+10+telhax,y+3+telhay);
  x+=ptx;
  y+=pty;
   
  }
   
   x=100;
   y= 20;
   telhax=10;
  telhay=-7;
  ptx=-10;
  pty=10;
  strokeWeight (3);
  for (int i=0; i<5;i++) //lado esquerdo
{
  line (x,y,x+telhax,y+telhay);
  x+=ptx;
  y+=pty;
  }
   
   
  {
    fill (28,82,30);
    strokeWeight (0);
    rect (0,135,200,75);
  }
 stroke (0);
  strokeWeight (1);
  fill (255);
rect (70,55,80,80);
  fill (95,33,26);
  rect (80,90,20,40);
  rect (110,80,30,20);
  line (125,80,125,100);
   
  noStroke();
  fill (180,81,42);
 triangle (65,55,110,13,155,55);
 
 noStroke(); // lua
 fill (100+mouseX/2);
 ellipse (170,30,20,20);
 fill(15,71,160);
  ellipse (150+mouseX/10,30,20,20);
 


}
