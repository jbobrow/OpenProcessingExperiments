
/* Code exercise done by Julia Grzeskowiak
York/Sheridan Joint Program in Design */

size (250, 250);
background (255);
smooth();

int x = 10;

for (x=10 ; x<120 ; x+=20){
  
line (125, x,x+130, 125);
line (125, x+130, x, 125);
line (125, 120-x, x, 125);
line (125, 250-x, x+130, 125);

  }

