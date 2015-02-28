
//exercicio sala 

size(200, 200);
background(255);


int x=20; // cordenada inicial
int y=20;

strokeWeight (3);

for (int i=0 ; i<5 ; i++)

{ 
  stroke(0);
  if (i>3)
    stroke(#ED0C0C);

  line (70, y, 25, x+y); 
  x+=10;
  y+=25;
}
