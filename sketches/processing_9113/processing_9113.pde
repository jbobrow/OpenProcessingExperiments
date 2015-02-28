
//declaration variable

//compteur
int compteur = 0;
//vitesse
float vitesseSouris = 0;

void setup()
{
size(400,400);
smooth();
background(255,255,255);
}

void draw()
{

  //pmouseX valeur precedente

vitesseSouris = dist(mouseX, mouseY, pmouseX, pmouseY)/4;

    //taille du trait
  strokeWeight(compteur);
  
  //outil de dessin 
  line(pmouseX, pmouseY, mouseX, mouseY);
  ellipse(mouseX, mouseY,vitesseSouris, vitesseSouris);

}

void mousePressed()
{
  //la taille du trait augmente a chaque clic
 compteur = compteur+1; 
  // saveFrame("monImage-####.tif");
}


