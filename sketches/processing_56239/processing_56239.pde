
float posX, posY; // centre de la rodona
float velX, velY; // velocitat de la rodona
float radi; // radi de la rodona
 

void setup ()
{
  size(300,300);
  background(0);
  smooth ();

 strokeWeight(10); 
 stroke(255,255,0);
  fill (255, 0, 0);
  posX = width/2;
  posY = height/2;
  velX = random(-2,2);
  velY = random(-2,2);
  ellipseMode(RADIUS);
  radi = 25;
}

void draw()
{ 
  background(0);
  ellipse(posX, posY, radi, radi);
 
  // canvia la posicio
  // i controla que no surti de la finestra
  posX = posX+velX;
  posY = posY+velY;
   
  if (posX <= radi+5) 
  {
    posX = radi+5;
    velX = -velX;
  }
  if (posX >= width-radi-5) {
    posX = width - radi-5;
    velX = -velX;
  }
  if (posY <= radi+5) {
    posY = radi+5;
    velY = -velY;
  }
  if (posY >= height-radi-5) {
    posY = height - radi-5;
    velY = -velY;
  }
 
}

