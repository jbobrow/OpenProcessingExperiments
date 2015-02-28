
/*

 Travail # 1 - edm4600 - Algorithmie de base et interactivite
 Andree-Anne Babin
 11 fevrier 2011
 
 */

//Declaration des variables
//Dimension et positionnement de la pupille
float xPupille = 200;
float yPupille = 170;
float largeurPupille = 15;
float hauteurPupille = 15;

//Positionnement et dimension de l'iris
float largeurIris = 30;
float hauteurIris = 30;
float xIris = 200;
float yIris = 170;

//Dimension de l'oeil.
float hauteurOeil = 70;
float largeurOeil = 80;

//Declaration des variables pour permettre a l'oeil de cligner
int prochainClignement = 0;
int intervalleCligne = 3000;
int tempsCligne = 200;
boolean cligne = false;

//Permet de mettre un image de fond
PImage bg;

//Permet de mettre des couleurs aleatoires sur les 4 portes
int couleurPorte11 = int(random(256));
int couleurPorte12 = int(random(256));
int couleurPorte13 = int(random(256));

int couleurPorte21 = int(random(256));
int couleurPorte22 = int(random(256));
int couleurPorte23 = int(random(256));

int couleurPorte31 = int(random(256));
int couleurPorte32 = int(random(256));
int couleurPorte33 = int(random(256));

int couleurPorte41 = int(random(256));
int couleurPorte42 = int(random(256));
int couleurPorte43 = int(random(256));

///Position des 4 portes sur l'axe des x.
float x1 = 0;
float x2 = 200;
float x3 = 400;
float x4 = -220;

//Dimension de la porte
float largeurPorte = 160;
float hauteurPorte = 260;

//Vitesse de deplacement de la porte sur la corde
float vitessePortes = 0;
float maxVitessePortes = 8;
boolean etatBouton = true;
boolean sourisEnfoncee = false;

float rotation;
float acceleration;
float vitesseRotation;
float cible;

void setup()
{

  bg = loadImage("bg_monster.jpg");//Permet de charger l'image de fond
  size(400, 400);//dimension de la scene
  smooth();//adoucir les contours
  strokeWeight(2);//contour du monstre
  //millis = temps (millisecondes)
  prochainClignement = int(random(intervalleCligne)) + intervalleCligne + millis();//ceci permet a l'oeil de clignoter au 3 secondes

    frameRate(30);
}

void draw()
{

  //Condition permettant de verifier si la souris est clique depuis longtemps
  if(!mousePressed)
  {
    sourisEnfoncee = false;
  }

  background(bg);

  dessinnerPanneau();

  //Condition permettant de vérifier si l'usager clique dans le bouton
  if(mousePressed && mouseX > 318 && mouseX < 333 && mouseY > 342 && mouseY < 358)
  {
    boutonPortes();
  }


  deplacerPortes();

  dessinnerPorte(x1, 20, couleurPorte11, couleurPorte12, couleurPorte13); 
  dessinnerPorte(x2, 20, couleurPorte21, couleurPorte22, couleurPorte23); 
  dessinnerPorte(x3, 20, couleurPorte31, couleurPorte32, couleurPorte33);
  dessinnerPorte(x4, 20, couleurPorte41, couleurPorte42, couleurPorte43);

  float decalage = millis()/200.0;//Permet de faire 'sauter' le personnage
  dessinerMonstre(0, 80 + 10*sin(decalage));//Le sinus permet de faire ondulee le personnage de haut en bas
}

void vitesse() 
{
  //Condition permettant de ralentir ou accelerer la vitesse des portes de facon graduelle
  if(etatBouton && vitessePortes < maxVitessePortes)
  {
    vitessePortes += 0.75 * (1 - (vitessePortes/maxVitessePortes)); //accélération maximum * (100% - pourcentage de la vitesse atteinte) (on part de 100% jusqua 0%)
  } 
  else if (!etatBouton)
  {
    //Empeche la porte de toujours etre en mouvement
    if(vitessePortes < 0.05)
    {
      vitessePortes = 0;
    }
    else
    {
      vitessePortes *= 0.75; //Ralentit graduellement la porte
    }
  }

  x1 += vitessePortes;
  x2 += vitessePortes;
  x3 += vitessePortes;
  x4 += vitessePortes;
}


//Ceci permet de positionner les portes sur la corde en x et en y et change la couleur lorsque la porte est reinitialise
void deplacerPortes()
{
  vitesse();

  //Si la valeur de x est a l'exterieur de la fenetre, reinitialise la forme a gauche 
  if (x1 > width + largeurPorte)
  {
    x1 = -100 - largeurPorte;
    couleurPorte11 = int(random(256));
    couleurPorte12 = int(random(256));
    couleurPorte13 = int(random(256));
  }


  if (x2 > width + largeurPorte) 
  {
    x2 = -100 - largeurPorte;
    couleurPorte21 = int(random(256));
    couleurPorte22 = int(random(256));
    couleurPorte23 = int(random(256));
  }

  if (x3 > width + largeurPorte) 
  {
    x3 = -100 - largeurPorte;
    couleurPorte31 = int(random(256));
    couleurPorte32 = int(random(256));
    couleurPorte33 = int(random(256));
  }

  if (x4 > width + largeurPorte)
  {
    x4 = -100 - largeurPorte;
    couleurPorte41 = int(random(256));
    couleurPorte42 = int(random(256));
    couleurPorte43 = int(random(256));
  }
}

//Fonction permettant de dessinner le panneau et le bouton
void dessinnerPanneau()
{
  fill(155);
  rect(300, 320, 80, 60);//Panneau

  fill(0);
  rect(340, 333, 30, 35);//Petit panneau noir

  //Condition permettant de remplir le bouton en vert (true) ou rouge (false)
  if(etatBouton)
  {
    fill(0,255,0);
  }
  else
  {
    fill(255,0,0);
  }

  ellipse(325, 350, 15, 15);//bouton
}

void boutonPortes()
{
  //Condition permettant de changer la couleur et la fonction du bouton
  if(!sourisEnfoncee) 
  {
    etatBouton = !etatBouton;
    sourisEnfoncee = true;
  }
}


void dessinnerPorte(float x, float y, int couleur1, int couleur2, int couleur3)
{
  //Sauvegarde les parametres de transformation - notes de cours
  pushMatrix();

  //easing de la rotation;
  float k = 0.02;
  float elasticite = 0.92;
  float cible = 10;
  
  //Si le bouton est rouge, on ramene la porte (elastique) cible = 0 - notes de cours
  if(!etatBouton)
  {
    acceleration = k * (0-rotation); //nombre de degres (de plus ou moins) a faire dans le frame
    vitesseRotation = elasticite * (vitesseRotation + acceleration);
    rotation += vitesseRotation;
  }
  //Si le bouton est vert, la porte tourne (accélération graduelle)
  else 
  {
    rotation = cible * vitessePortes / maxVitessePortes; //rotation ciblée * pourcentage de la vitesse
  }

  translate(x, y); // déplace le curseur de dessin
  rotate(rotation * PI / 180); // tourne le canevas de dessin (deg -> rad = angle(deg) * PI / 180)

  fill(couleur1, couleur2, couleur3);
  rect(-largeurPorte/2, 0, largeurPorte, hauteurPorte);//porte
  fill(255, 203, 10);
  ellipse(-50, 130, 20, 20);//poignee de porte

  fill(155);
  rect(-50, 0,100, 40);//pince pour retenir la porte
  
  
  popMatrix(); //remet les valeurs de transformation a la valeur sauvegardee par pushMatrix();
  
  
  line(0, 10, 400, 10);//corde

  rect(x-30, y-10,60, 30);//bout de la pince accrochee a la corde
}

void dessinerMonstre(float x, float y)
{
  fill(125, 240, 77);
  //rect(x,y, width, height)
  rect(x+50, y+200, 80, 20);//bras gauche

  //rect(x,y, width, height)
  rect(x+265, y+200, 80, 20);//bras droite

  //rect(x,y, width, height)
  rect(x+220, y+250, 20, 80);//jambe droite

  //rect(x,y, width, height)
  rect(x+160, y+250, 20, 80);//jambe gauche

  fill(255);

  line(x+150, y+147, x+142, y+132);//oreille gauche
  arc(x+149, y+150, 30, 40, 2.36, 4.18);

  line(x+250, y+147, x+258, y+132);//oreille droite
  arc(x+251, y+150, 30, 40, 5.30, 2*PI+0.79);

  fill(125, 240, 77);
  //ellipse(x, y, width, height);
  ellipse(x+200, y+200, 160, 140);//tete 

  //arc(x, y, width, height, start, stop);
  arc(x+200, y+170, 100, 95, 3.7, 5.7);//sourcils 

  arc(x+200, y+240, 40, 20, 0.63, 2.51);//menton


  //condition permettant que l'oeil ferme lorsqu'il est cliqué
  if(mousePressed && mouseX > 160 +x && mouseX < 240 +x && mouseY < 205 +y && mouseY > 135 +y)
  {
    oeilFerme(x,y);//refaire a la fonction oeilFerme
    boucheFerme(x,y);//refaire a la fonction boucheFerme
  } 
  else 
  {
    boucheOuverte(x,y);//refaire a la fonction boucheOuverte
    oeilOuvert(x,y);//refaire a la fonction oeilOuvert
  }


  //cette condition permet de calculer l'intervalle de temps pour le clignement.
  if(millis() > prochainClignement && millis() < prochainClignement+tempsCligne)
  {
    oeilFerme(x,y);
    cligne = true;//permet de voir que l'oeil c'est deja ferme
  } 
  else if (cligne)
  {
    prochainClignement = int(random(intervalleCligne)) + intervalleCligne + millis();//ceci permet a l'oeil de clignoter au 3 secondes
    cligne = false;
  }
}


//fonction permettant de faire que l'oeil se ferme
void oeilFerme(float x, float y)
{
  fill(125, 240, 77);//couleur paupiere
  ellipse(x+200, y+170, 80, 70);//oeil ferme
  arc(x+200, y+140, 100, 90, 0.63, 2.51);//ligne division paupiere
}


//fonction permettant de faire que l'oeil est ouvert et son déplacement par rapport a la souris
void oeilOuvert(float x, float y)
{
  fill(255);
  ellipse(x+200, y+170, 80, 70);//oeil

  //Permet d'avoir l'angle entre l'oeil et la souris
  float radians = atan2(mouseY-(yPupille+y),mouseX-(xPupille+x));

  //Permet de calculer la distance entre l'oeil et la souris
  float distance = sqrt(pow(mouseY-(yPupille+y),2)+pow(mouseX-(xPupille+x),2));

  fill(39, 195, 255);//couleur iris

  //IRIS - code permettant de faire suivre l'oeil avec le mouvement de la souris
  ellipse(cos(radians)*min(distance,largeurOeil/2-largeurIris/2)+xIris+x,sin(radians)*min(distance,hauteurOeil/2-hauteurIris/2)+yIris+y,largeurIris,hauteurIris);


  fill(0);//couleur noire pupille

  //PUPILLE - code permettant de faire que la pupille suive la souris
  ellipse(cos(radians)*min(distance,largeurOeil/2-largeurPupille/2)+xPupille+x,sin(radians)*min(distance,hauteurOeil/2-hauteurPupille/2)+yPupille+y,largeurPupille,hauteurPupille);
}


//fonction permettant de faire que le personnage fasse une bouche triste lorsque l'on clique dans son oeil
void boucheFerme(float x, float y)
{
  fill(125, 240, 77);
  arc(x+200, y+260, 130, 90, 3.77, 5.50);//bouche
  arc(x+200, y+240, 40, 20, 0.63, 2.51);//menton
}


//fonction permettant de mettre la bouche contente lorsque l'on ne clique pas dans son oeil.
void boucheOuverte(float x, float y)
{
  arc(x+170, y+228, 60, 20, 3.61, 4.24);//coin bouche gauche 
  arc(x+230, y+228, 60, 20, 5.18,5.81);//coin bouche droite
  arc(x+200, y+195, 130, 90, 0.63, 2.51);//bouche
}


