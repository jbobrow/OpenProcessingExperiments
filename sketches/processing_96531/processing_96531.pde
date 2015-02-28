
//exercicio sala 

size(200,200);
background(255);

int x=20; // cordenada inicial
int y=20;


strokeWeight (3);
stroke(0);
for(int i=0 ; i<5 ; i++)
  
{
  line (70,y,25,x+y); 
  x+=10;
  y+=25;
}
