
int nbLiens = 15;
int nbBalles = 7;

Lien[] tabLien = new Lien[nbLiens];
Ligne[] tabLignes = new Ligne[nbLiens-1];
Balle[] tabBalles = new Balle[nbBalles];

Scrollbar scrollbar;

float gravite = 2.0;

//Droite parrallèle a la base
float xOrig1=0;
float yOrig=0;
float xOrig2=0;

void setup()
{
  size(800, 600);
  smooth();

  //Initialisation du premier lien qui est fixe
  tabLien[0] = new Lien(50, 50);
  
  //Initialisation des autres liens
  for(int i=1; i<nbLiens;i++)
    tabLien[i] = new Lien(tabLien[0].x, tabLien[0].y);
    
  //Initialisation des lignes en fonction des liens crees precedement
  for(int i=0; i<nbLiens-1;i++)
    tabLignes[i] = new Ligne(tabLien[i].x, tabLien[i].y, tabLien[i+1].x, tabLien[i+1].y);
  
  //Initialisation des balles (posX, posY, rayon)
  for(int i=0; i<nbBalles;i++)
    tabBalles[i] = new Balle(random(50,width-100), random(10,70), random(19,50));
    
  //Initialisation du menu pour l'interaction  
  scrollbar = new Scrollbar();
  scrollbar.init();
}


void draw()
{
  background(125);
  noFill();
  
  //Affichage des scrollbars
  scrollbar.drawScrollbar();
  
  //Mise a jour de la scene
  updateScene();
  
  //Pour chaque ligne, on trace sa courbe de Bezier correspondante
  for(int i=0; i<nbLiens-1;i+=2)
  {
    stroke(0);
    strokeWeight(5);
    bezier(tabLignes[i].x1, tabLignes[i].y1, tabLignes[i].x2, tabLignes[i].y2, tabLignes[i+1].x1, tabLignes[i+1].y1, tabLignes[i+1].x2, tabLignes[i+1].y2);
  }
  
  //Droite parrallèle a la base (elle n'est pas indispensable mais sera utilisée pour calculer les angles pour les rebonds de la balle)
  xOrig1 = tabLignes[0].x1;
  yOrig=0;
  xOrig2=tabLignes[nbLiens-2].x1;
  
  //prendre le point le plus bas
  for(int i=0;i<nbLiens-1;i++)
  {
   if(yOrig==0)
     yOrig = tabLignes[i].y2;
   if(yOrig < tabLignes[i].y2)
     yOrig = tabLignes[i].y2;
  }
  //strokeWeight(1);
  //line(xOrig1,yOrig,xOrig2,yOrig);
  
  //Mise a jour des liens pour l'effet de corde
  for(int i=1; i<nbLiens-1;i++)
    tabLien[i].update(tabLien[i-1].x, tabLien[i-1].y, tabLien[i+1].x, tabLien[i+1].y);

  //Mise a jour du dernier lien, controlé avec la souris
  tabLien[nbLiens-1].lastUpdate(mouseX, mouseY);
  
  for(int i=0; i<nbBalles;i++)
  {
    detectCollision(tabBalles[i]);
    tabBalles[i].move();
    tabBalles[i].display();
  }
   
   //Mise a jour des lignes
   for(int i=0; i<nbLiens-1;i++)
    tabLignes[i] = new Ligne(tabLien[i].x, tabLien[i].y, tabLien[i+1].x, tabLien[i+1].y);
}

/* Fonction de mise a jour de la scene*/
void updateScene()
{
  int nbBallesTemp = scrollbar.getValue1();
  int nbLiensTemp =  scrollbar.getValue2();
  
  // Gestion du nombre de balles
  if(nbBalles != nbBallesTemp)
  {
    // On agrandi le nombre de balles
    if(nbBalles < nbBallesTemp)
    {
        Balle[] tabBallesTemp = new Balle[nbBalles];
        tabBallesTemp = tabBalles;
        tabBalles = new Balle[nbBallesTemp];
        
        for(int i=0; i<nbBalles;i++)
          tabBalles[i] = tabBallesTemp[i]; 
        //Initialisation des nouvelles balles (posX, posY, rayon)
        for(int i=nbBalles; i<nbBallesTemp;i++)
          tabBalles[i] = new Balle(random(50,width-100), random(10,70), random(19,50));
        nbBalles = nbBallesTemp;
    }
    // On diminue le nombre de balles
    else
    {
        nbBalles = nbBallesTemp;
    }
  }
  
  //Gestion de la courbe
  int nombreImpair = (int)(nbLiensTemp/2);
  nombreImpair = (nombreImpair * 2)+1;
  
  if(nbLiens != nombreImpair)
  {
    //On diminue le nombre de liens
    if(nbLiens > nombreImpair)
    {
      nbLiens = nombreImpair;
    }
    else
    {
      Lien[] tabLienTemp = new Lien[nbLiens];
      Ligne[] tabLignesTemp = new Ligne[nbLiens-1];
      
      tabLienTemp = tabLien;
      tabLignesTemp = tabLignes;
      
      tabLien = new Lien[nombreImpair];
      tabLignes = new Ligne[nombreImpair-1];
      
      for(int i=0; i<nbLiens;i++)
        tabLien[i] = tabLienTemp[i];
      //Initialisation des nouveaux liens
      for(int i=nbLiens; i<nombreImpair;i++)
        tabLien[i] =  new Lien(tabLien[i-1].x, tabLien[i-1].y);
      
      for(int i=0; i<nbLiens-1;i++)
        tabLignes[i] =tabLignesTemp[i];
      //Initialisation des nouvelles lignes en fonction des liens crees precedement
      for(int i=nbLiens-1; i<nombreImpair-1;i++)
        tabLignes[i] = new Ligne(tabLien[i].x, tabLien[i].y, tabLien[i+1].x, tabLien[i+1].y);
        
      nbLiens = nombreImpair;
    }
  }
}


void detectCollision(Balle ball)
{
   // --------------------------------
   // Equation de droite : y = Ax + B
   // Coord Point 1 : (tabLignes[0].x1, tabLignes[0].y1)
   // Coord Point 2 : (tabLignes[0].x2, tabLignes[0].y2)
   // A = (tabLignes[0].y1 - tabLignes[0].y2) / (tabLignes[0].x1 - tabLignes[0].x2)
   // B = tabLignes[0].y1-(A*tabLignes[0].x1)
   //
   // if(point.y = A * point.x + B)
   //   Point sur droite
   // --------------------------------
  
   stroke(0);
   strokeWeight(1);
   fill(225,0,0);
   /* DETECTION COLLISION BALLE COURBE*/
   //Pour chaque lien, voir si il ya collision balle/ligne
   for(int i=0; i<nbLiens-1;i++)
   {
     float A = (tabLignes[i].y2 - tabLignes[i].y1) / (tabLignes[i].x2 - tabLignes[i].x1);
     float B = tabLignes[i].y1-(A*tabLignes[i].x1);
     
     //Si la balle est au dessus de la courbe
     if(ball.y < (A * ball.x + B) && ball.y+(ball.diametre/2) > (A * ball.x + B))
     {
        if(ball.x >= tabLignes[i].x1 && ball.x <= tabLignes[i].x2)
        {
          //Gestion du rebond de la balle
           ball.collide(tabLignes[i].x1, tabLignes[i].y1, tabLignes[i].x2, tabLignes[i].y2);
        }
     }
     //Si la balle est en dessous de la courbe
     else if(ball.y > (A * ball.x + B) && ball.y-ball.diametre < (A * ball.x + B))
     {
         if(ball.x >= tabLignes[i].x1 && ball.x <= tabLignes[i].x2)
         {
           //Gestion du rebond de la balle
            ball.collide(tabLignes[i].x2, tabLignes[i].y2, tabLignes[i].x1, tabLignes[i].y1);     
         }
     }
   }
   /* FIN DETECTION COLLISION */
}


class Ligne
{
   float x1, y1, x2, y2;
   
   Ligne(float posX1, float posY1, float posX2, float posY2)
   {
     x1= posX1;
     y1= posY1;
     x2= posX2;
     y2= posY2;
   }
}


class Balle
{
  float x, y;
  float diametre;
  float vx = 0;
  float vy = 0;
  float spring = 0.045;
  float friction = -0.9;
  float previousAngle = 0.1;
 
  Balle(float posX, float posY, float diam)
  {
    x = posX;
    y = posY;
    diametre = diam;
  } 
  
  void collide(float x1, float y1, float x2, float y2)
  {
    // Calcul de la distance balle/milieu de courbe
    float deltaX = x - ((x1+x2)/2);
    float deltaY = y - ((y1+y2)/2);
    
    // Calcul du cos et du sin de l'angle forme par la courbe    
    float cosinus = cos(atan2((y2-y1), (x2-x1))); // angle formé par la courbe : atan2((y2-y1), (x2-x1))
    float sinus = sin(atan2((y2-y1), (x2-x1)));
      
    // Détermination des nouvelles directions
    float groundXTemp = cosinus * deltaX + sinus * deltaY;
    float groundYTemp = -diametre;
    
    // Calcul de la vitesse de la balle en fonction de l'angle de rebond
    float vxTemp = vx;
    float vyTemp = vy;
    vx = cosinus * vxTemp + sinus * vyTemp;
    vy = cosinus * vyTemp - sinus * vxTemp;
  
    // rebondir sur la courbe
    vy *= -0.7;
    
    // Calcul des nouvelles positions
    
    deltaX = cosinus * groundXTemp - sinus * groundYTemp;
    deltaY = cosinus * groundYTemp + sinus * groundXTemp;
    x = ((x1+x2)/2) + deltaX;
    y = ((y1+y2)/2) + deltaY; 
  }
  
  void move()
  {
      vy += gravite/10;
      x += vx;
      y += vy;
      
      // La balle ne peut pas sortir de l'ecran
      if (x + diametre/2 > width) {
        x = width - diametre/2;
        vx *= friction; 
      }
      else if (x - diametre/2 < 0) {
        x = diametre/2;
        vx *= friction;
      }
      if (y + diametre/2 > (height-50)) {
        y = (height-50) - diametre/2;
        vy *= friction; 
      } 
      else if (y - diametre/2 < 0) {
        y = diametre/2;
        vy *= friction;
      }
  }
  
  void display() {
    ellipse(x, y, diametre, diametre);
  }
}


class Lien
{
  float stiffness = 0.25;
  float x, y;
  float damping = 0.7;
  float vx = 0;
  float vy = 0;
  float diametre;
  
  Lien(float posX, float posY)
  {
    x = posX;
    y = posY;
  }

  void update(float targetX, float targetY, float targetX2, float targetY2)
  {
      float forceX = ((targetX - x) + (targetX2 - x) )* stiffness;
      float ax = forceX;
      vx = damping * (vx + ax);
      x += vx;
      
      float forceY = ((targetY - y) + (targetY2 - y)) * stiffness;
      forceY += gravite;
      float ay = forceY;
      vy = damping * (vy + ay);
      y += vy;
  }
  
  void lastUpdate(float targetX, float targetY)
  {
    x = targetX;
    y = targetY;
  }

}

