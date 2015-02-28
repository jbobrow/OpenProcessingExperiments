
// Esercizio 4.1 Ellipses
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

// Setup
size(600, 400);
float myColor = 200;

// Draw
for (int y=0; y<height; y+=8)
{
  for (int x=0; x<width; x+=10)
  {
    fill( myColor );
    ellipse( x, y, x, y ); 
  }
}


