
void setup ()
{
  size (500,500);
  background (0);
  smooth ();

}

// tu vas lire le programme suivant en boucle
void draw ()
{
  
  noStroke ();
  
 fill (0,random (255),0);
 rect (175,235,150,15);
 rect (240,170,15,150);
 
 fill (0,random (255),0);
 rect (200,240,100,5);
 rect (245,195,5,100);
 
fill (random (222),19,0);
 
rect (random (50), random (500), 5, 100);

 
}


