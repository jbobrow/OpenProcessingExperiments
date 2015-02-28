
float x;
float y;
float stopy;
float difBlankEye;
float cptBouge;
float randomColor1;
float randomColor2;
float randomColor3;
float randomColorIllusion1;
float randomColorIllusion2;
float randomColorIllusion3;
float alphaIllusion;
int boolPhase;
int boolPhaseChange;
float distance;
int timeStamp;
int timeStampBaton;
int interval;
int intervalBaton;
float varRouge;
int varAugmente;
int moveBaton;
int varBougeBtn;
int adouciBaton;

void setup()
{
  size(400, 400);
  frameRate(30);
  smooth();
  noStroke();
  x=width/2;
  y=height/2;
  stopy=1;
  cptBouge=1;
  randomColorIllusion1 = 0;
  randomColorIllusion2 = 80;
  randomColorIllusion3 = 160;
  alphaIllusion=0;
  boolPhase=0;
  timeStamp=0;
  timeStampBaton=0;
  interval=40;
  intervalBaton=200;
  varRouge=2.5;
  varAugmente=5;
}

void draw()
{
  background(144);

  //Décalage du cercle blanc dans l'oeil
  cptBouge++;
  stopy-=sin(radians(cptBouge*5));
  difBlankEye-=sin(radians(cptBouge*5))/1.1;

  //Distance de la souris par rapport au centre de mon oeil
  distance = dist(mouseX, mouseY, x, y+stopy);

  float [] tableau = {
    x-147, y-39, x-37, y-39, x-22, y-39, x+38, y-40, x+53, y-45, x+51, y-84, x+45, y-108, x+39, y-64, x+16, y-63, x+1, y-108.0, x-14.0, y-64.0, x-35.0, y-64.0, x-44.0, y-109.0, x-50.0, y-47.0, x-35.0, y-39.0, x-7.0, y-38.0
  };

  //Création de l'ombre
  fill(125, 175); 
  ellipse(x, y+90, 100+stopy, 20); 
  
  //Matrice pour faire bouger le baton
  pushMatrix();
  translate(10, 0);

  if (varBougeBtn==1)
  {
    if ( distance <= 60 )
    {
      translate(0, sin(cptBouge)*pow(adouciBaton,2)/10);
      //Sert à faire mon assouplissement de baton qui se déplace.
      if ( millis() - timeStampBaton >= intervalBaton ) 
      {
        timeStampBaton = timeStampBaton + intervalBaton;
        adouciBaton++;
        if(adouciBaton>=11)
        adouciBaton=10;
      }
    }
  }
  
  //Lorsque je reclick pour arrêter l'animation d'illusion, le baton cesse de bouger
  else
  {
    translate(0, sin(cptBouge)*pow(adouciBaton,2)/10);
    //Sert à faire mon assouplissement de baton qui se déplace .
    if ( millis() - timeStampBaton >= intervalBaton ) 
    {
      timeStampBaton = timeStampBaton + intervalBaton;
      adouciBaton--;
      if(adouciBaton<=-1)
        adouciBaton=0;
    }
  }

  //Création du baton.
  for (int i=0; i<=100; i++) 
  {
    fill(245, 165+i*0.5, 5);
    quad(x-80+i*0.20, y-70+i*0.65+stopy, x-90+i*0.20, y-70+i*0.65+stopy, x-50-i*0.20, y+60-i*0.65+stopy, x-40-i*0.20, y+60-i*0.65+stopy);
  }

  //Glob de couleur vert et rose
  for (int i=0; i<=48; i++) 
  {
    fill(0+i*5, 245-i*4, 15+i*4);
    ellipse(x-90, y-80+stopy, 48-i, 48-i);
  } 
  
  //Pop matrix pour arreter ma matrice de mouvement de baton
  popMatrix();

  //oeil
  for (int i=0; i<=120; i++) 
  {
    fill(215+i);
    ellipse(x, y+stopy, 120-i, 120-i);
  }

  //Regarde si la souris est dans le cercle et fait rougir l'oeil.
  if ( distance <= 60 )
  {
    if ( millis() - timeStamp >= interval ) 
    {
      timeStamp = timeStamp + interval;
      varRouge-=0.1;
      if (varRouge<=-7)
      {
        varRouge=-7;
      }
    }
  } 

  //Regarde si la souris n'est pas dans le cercle et fait dérougir l'oeil.
  if ( millis() - timeStamp >= interval ) 
  {
    timeStamp = timeStamp + interval;
    varRouge+=0.1;
    if (varRouge>=2.5)
    {
      varRouge=2.5;
    }
  }

  //couleur oeil
  for (int i=0; i<=100; i++)
  {
    fill(195+i*1.5, 115+i*varRouge, 0+i);
    ellipse(x, y+stopy, 100-i, 100-i);
  }

  //noir oeil
  for (int i=0; i<=60; i++)
  {
    fill(0+i*3);
    ellipse(x, y+stopy, 60-i, 60-i);
  }

  //point blanc (oeil)
  fill(235);
  ellipse(x+9, y+10+difBlankEye, 16, 16);  
  //point blanc alpha (oeil)
  fill(255, 255, 255, 175);
  ellipse(x+20, y-15+difBlankEye, 40, 40);

  //Couronne qui change de couleur
  beginShape();
  if (mouseX >= x-60 && mouseX <= x+60 && mouseY >= y-115+stopy && mouseY <= y-40+stopy)
  {  
    randomColor1 += varAugmente;
    if (randomColor1<=-245)
      varAugmente=5;
    if (randomColor1>=0)
      varAugmente=-5;
  }

  //For pour la création de la couronne à partir d'un tableau de données.
  fill(240+randomColor1, 190+randomColor2, 15+randomColor3);
  for (int i=0; i<=31; i+=2) 
  {
    curveVertex(tableau[i], tableau[i+1]+stopy);
  }
  endShape();

  //Boule Milieu Couronne
  for (int i=0; i<=49; i++) 
  {
    fill(245, 169+i, 15, 255);
    ellipse(x+0, y-90+stopy, 49-i, 49-i);
  }

  //1 boule or gauche #1
  for (int i=0; i<=18; i++)
  {
    fill(245, 169+i, 15);
    ellipse(x-50, y-95+stopy, 18-i, 18-i);
  }

  //1 boule or gauche #2
  for (int i=0; i<=18; i++) 
  {
    fill(245, 169+i, 15);
    ellipse(x-40, y-95+stopy, 18-i, 18-i);
  }

  //1 boule or gauche #3
  for (int i=0; i<=18; i++) 
  {
    fill(245, 169+i, 15);
    ellipse(x-45, y-105+stopy, 18-i, 18-i);
  }

  //1 boule or droite #1
  for (int i=0; i<=18; i++) 
  {
    fill(245, 169+i, 15);
    ellipse(x+50, y-95+stopy, 18-i, 18-i);
  }

  //1 boule or droite #2
  for (int i=0; i<=18; i++) 
  {
    fill(245, 169+i, 15);
    ellipse(x+40, y-95+stopy, 18-i, 18-i);
  }

  //1 boule or droite #3
  for (int i=0; i<=18; i++) 
  {
    fill(245, 169+i, 15);
    ellipse(x+45, y-105+stopy, 18-i, 18-i);
  }

  //Deux IF pour faire apparaitre et disparaitre l'effet d'illusion de mon monstre
  if (boolPhaseChange==1)
  {
    alphaUp();
  }
  if (boolPhaseChange==0)
  {
    alphaDown();
  }

  //Permet de faire bouger l'illusion en changeant de couleur
  if ( distance <= 60 ) 
  {
    randomColorIllusion1 += random(0, 10);
    randomColorIllusion2 += random(0, 10);
    randomColorIllusion3 += random(0, 10);

    if (randomColorIllusion1>=250)
    {
      randomColorIllusion1=random(10, 30);
    }
    if (randomColorIllusion2>=250)
    {
      randomColorIllusion2=random(10, 30);
    }
    if (randomColorIllusion3>=250)
    {
      randomColorIllusion3=random(10, 30);
    }
  } 
  //Fait apparaitre le dégradé de l'illusion.  Le fait de le multiplier par des nombres a virgule permet de donner un aspect ligné dans l'illusion et la rend plus "réaliste".
  for (int i=0; i<=255; i++)
  {
    fill(randomColorIllusion1, randomColorIllusion2, randomColorIllusion3, i*alphaIllusion);
    ellipse(x, y+stopy, 400-i*400/255, 400-i*400/255);
  }
}


void mousePressed()
{
  //If qui regarde si j'ai cliqué dans ma couronne pour la faire changer de couleur aléatoirement.
  if (mouseX >= x-60 && mouseX <= x+60 && mouseY >= y-115+stopy && mouseY <= y-40+stopy)
  {  
    randomColor1 = random(-255, 255);
    randomColor2 = random(-255, 255);
    randomColor3 = random(-255, 255);
  }

  //Regarde si ma souris est sur l'oeil quand je clic et fait apparaitre ou disparaitre l'illusion
  if ( distance <= 60 ) 
  {
    if (boolPhaseChange==0)
    {
      alphaUp();
      boolPhase++;
      varBougeBtn=1;
    }
    if (boolPhaseChange==1)
    {
      alphaDown();
      boolPhase++;
      varBougeBtn=0;
    }
    boolPhaseChange=boolPhase%2;
  }
}

//Fonction qui sert à faire apparaître l'illusion.
void alphaUp()
{
  alphaIllusion+=0.001;
  if (alphaIllusion >= 0.05)
  {
    alphaIllusion = 0.05;
  }
}

//Fonction qui sert à faire disparaître l'illusion.
void alphaDown()
{
  alphaIllusion-=0.001;
  if (alphaIllusion <=0)
  {
    alphaIllusion = 0;
  }
}
