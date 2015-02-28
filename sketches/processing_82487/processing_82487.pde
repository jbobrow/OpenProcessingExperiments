
//int sizX = 595;
//int sizY = 345;

PImage table;

void setup ()
{
  /*@pjs preload="table.jpg";*/
  table = loadImage("table.jpg");
  //size(sizX, sizY);
  size(table.width, table.height);
  background(0);
}


void draw ()
{

  image(table, 0, 0);
  smooth();

  if (mouseX < 146)
  {
    if (mouseY < 40)
      bouteille(108,0,36);
    else if (mouseY < 80)
      bouteille(229,85,205);
    else if (mouseY < 120)
      bouteille(252,239,120);
    else if (mouseY < 160)
      fromage();
    else if (mouseY < 200)
      sauciflar();
    else if (mouseY < 240)
      moutarde();
  }

}

void mousePressed()
{
  if (mouseX < 146)
  {
    if (mouseY < 40)
      link("http://www.google.fr/search?q=vin+rouge");
    else if (mouseY < 80)
      link("http://www.google.fr/search?q=vin+rose");
    else if (mouseY < 120)
      link("http://www.google.fr/search?q=vin+blanc");
    else if (mouseY < 160)
      link("http://www.google.fr/search?q=fromage");
    else if (mouseY < 200)
      link("http://www.google.fr/search?q=charcuterie");
    else if (mouseY < 240)
      link("http://www.google.fr/search?q=moutarde");
  }

}
  
//procedure permettant de dessiner une bouteille
//en passant la couleur en param RGB
void bouteille (int R, int G, int B)
{
  float posX = 3*(table.width/4);
  float posY = table.height/2;
  float largeur = 30;
  float hauteur = largeur/3;
  stroke(R,G,B);
  fill(0,0,0,0);
  for (int i = 0; i < 25; i++)
  {
    posY -= 3;
    ellipse(posX, posY,largeur,10);
  }
  for (int i = 0; i < 8; i++)
  {
    posY -=1.5;
    largeur-=i/1.3;
    hauteur = largeur/3;
    ellipse(posX, posY, largeur, hauteur);
  } 
  for (int i = 0; i < 9; i++)
  {
    posY -= 2;
    ellipse(posX, posY, largeur + 0.5, hauteur);
  }
}

//procedure dessinant un fromage
void fromage()
{
  float posX = 3*(table.width/4);
  float posY = table.height/2;
  float largeur = 120;
  float hauteur = largeur/5;
  stroke(215,196,25);
  fill(0,0,0,0);
  
  for (int i = 0; i < 25; i++)
  {
    posY -= 1.5;
    arc(posX, posY, largeur, hauteur, 9, 14);
    line(posX, posY, posX - largeur/2.25, posY + hauteur/5);
    line(posX, posY, posX + 7, posY + hauteur/2);
  }
}

//procedure dessinant un saucisson... avec de l'imagination
void sauciflar ()
{
  float posX = 3*(table.width/4);
  float posY = table.height/2.2;
  float taille = 10;
  stroke(201,63,70);
  fill(0,0,0,0);
  
  for (int i = 0; i < 30; i++)
  {
    posX -= 1.5;
    posY += 0.5;
    ellipse(posX, posY, taille, taille);
  }  
  posX -= 1.5;
  posY += 0.2;
  ellipse(posX, posY, taille, taille);
  posX -= 1.5;
  posY += 0.1;
  ellipse(posX, posY, taille, taille);
  posX -= 1.5;
  ellipse(posX, posY, taille, taille);
  posX -= 1.5;
  posY -= 0.1;
  ellipse(posX, posY, taille, taille);
  posX -= 1.5;
  posY -= 0.2;
  ellipse(posX, posY, taille, taille);
  posX -= 1.5;
  posY -= 0.5;
  ellipse(posX, posY, taille, taille);
  posY -= 1.5;
  ellipse(posX, posY, taille, taille);
  posX += 0.5;
  posY -= 1.5;
  ellipse(posX, posY, taille, taille);
  posX += 0.5;
  posY -= 1.5;
  ellipse(posX, posY, taille, taille);
}

//procedure dessinant un pot de moutarde
void moutarde()
{
  float posX = 3*(table.width/4);
  float posY = table.height/2;
  float largeur = 25;
  float hauteur = largeur/3;
  stroke(207,155,11);
  fill(0,0,0,0);
  
  for (int i = 0; i < 15; i++)
  {
    posY -= 1.5;
    ellipse(posX, posY, largeur, hauteur);
  }
    
  largeur = 27;
  hauteur = largeur/3;
  stroke(0);
  
  for (int i = 0; i < 3; i++)
  {
    posY -= 1.5;
    ellipse(posX, posY, largeur, hauteur);
  }
  while (largeur > 0)
  {
    ellipse(posX, posY, largeur, hauteur);
    largeur -= 2;
    hauteur = largeur/3;
  }

}
