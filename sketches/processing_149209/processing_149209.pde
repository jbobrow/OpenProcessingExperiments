

size( 800,700 );
loadPixels();

for (int i=0; i<pixels.length; i++)
{
  pixels[i] = color( random(255) );
}

updatePixels();

noStroke();
strokeWeight(7);
triangle(150,450, 400,30, 650,450);

strokeWeight(10);
stroke(0, 0, 255);

line(0,109, 800,109); 

line(0,509, 800,509);


line(0,309, 800,309);

 
noStroke();
fill(255);
triangle(150,150, 400,600, 650,150);


 



