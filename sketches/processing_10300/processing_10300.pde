
/* ****************************************************

Atelier Processing / Cras / 12-13 Avril 2008

LAURA VALERO
POSTGRADO MOTION GRAPHICS IDEP 2010

**************************************************** */
int variableNumerica;
int[] objetoArray;
String[] imagenes;


// Declaration des tableaux
float diametro ; 
int[] x;
int[] y;
color[] couleur;
color micolor = 255;
boolean limpiamosPantalla = false; //variable logica, puede valer verdadero (true) o falso (false)
PImage fondo ;

// Taille des tableaux
int capacite = 800;

void setup()
{
  size(500,500,P3D);
  rectMode(CENTER);
  noCursor();
  // Allocation de la memoire pour le tableau
  x = new int[capacite];
  y = new int[capacite];
  couleur = new color[capacite];

  // Assignation
  for (int i=0 ; i<capacite; i++)
  {
    x[i] = int(random(width));
    y[i] = int(random(height));
    couleur[i] = color(random(0,255), random(0,255), random(0,255));
  }
}

void draw()

{
  background(#000033);
  if (limpiamosPantalla) background(fondo); 
  noStroke();
  for (int i=0 ; i<capacite; i++)
  {
    fill(couleur[i],30);
    ellipse(x[i],y[i], 30, 30);
    diametro = random(0,600);
   
  } 
  
}
void mouseDragged() {
  println("has arrastrado el raton");
  rectMode(CENTER) ; //centralizamos el punto de anclaje del rectangulo al centro
  color(random(250));
  fill(#000033);
  ellipse(mouseX,mouseY,100, 100);
  fill(0,50);
  ellipse(250, 250,100,100);
  fill(10,40);
  rect(500,0,500,500);
  rect(0,500,500,500);

}



