
int compteur;

void setup()
{
size(250, 250);
frameRate(60);
fill(#F0C9C9,10);
stroke(255);
smooth();
 
compteur = 0;
}
 
void draw() 
{
compteur = compteur + 1;
 
rect(0, 0, width, height);
 
translate(width / 2, height / 2);
rotate(radians(compteur));
line(-height, -height, height, height);
}


