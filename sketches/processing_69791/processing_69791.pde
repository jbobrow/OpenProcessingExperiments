
/*--------------------------------------------------------------------------------
 Monstre
 Par Gabrielle Demers
 ----------------------------------------------------------------------------------*/

// Variables pour la position
float x;
float y;

PImage occupationDouble;

// Variables pour les yeux 
float xOeilHaut = 277;
float yOeilHaut = 95;
float xOeilBas = 277;
float yOeilBas = 136;
float wOeil = 30; // largeur de l'oeil
float hOeil = 30; // hauteur de l'oeil
float wIris = 15; // largeur de l'iris
float hIris = 15; // hauteur de l'iris 

// Les mots
String [] mots;

int index;

//minuterie du veston

int timeStamp;
int interval;

color c;

/*------------------------------------------------------------------------------------*/

// Configurer la scène
void setup() {
size(400, 400);
smooth();
noCursor();
// Placer au centre de la scene
x = width/2;
y = height/2;
// transférer l'image
occupationDouble = loadImage("fond.png");
// String de mots
 mots = new String[3];

        mots[0] = "L'OEUF";
        mots[1] = "OU";
        mots[2] = "L'ENVELOPPE?";
        
        

}

void draw(){
    background(0);
      tint(mouseX, mouseY, mouseY-mouseX, 255);
      image(occupationDouble, 0, 0);
      ellipseMode(CENTER); // place le centre des cercles comme point de référence
      corpsVeston(); //fonction de base pour le corps
      BoiteTv (); //fonction de base pour la boite
      YeuxBoutons (); // fonction de base pour les yeux boutons
      ecranTv (); // fonction de base pour l'ecran 
      curseurTelecommande(); // fonction pour le curseur de la souris
       textAlign(CENTER);
        textSize(50);

        fill(180);
        text(mots[index],width/2,50);
      
      
      
}

/*---------------------------------------------------------------------------------------*/

void corpsVeston() {
// couleur qui change
  // Changer la couleur a chaque intervalle
        if ( millis() - timeStamp >= interval ) {
                timeStamp = timeStamp + interval;
                interval = int(random(2000,4000));
                c = color(random(256),random(30),random(256));
        }


//veston
//base
fill(c);
rectMode(CENTER);
//la taille du veston est propotionnelle a la scene
float largeurVeston = x-50;
float hauteurVeston = y;
rect(x, y+125, largeurVeston, hauteurVeston); 


//collet 
strokeWeight(2);
stroke(255);
//en haut à gauche
triangle( x-10, y+25, x-55, y+75, x-20, y+75);
//en haut à droite
triangle( x+10, y+25, x+50, y+75, x+20, y+75);
//en bas à gauche
triangle( x-20, y+75, x, y+125, x-45, y+90);
//en bas à droite
triangle (x+20, y+75, x+45, y+90, x, y+125);



//couture
line( x, y+125, x, y*2);

//boutons
float diametreBouton = x-195;
//bouton en haut à gauche
ellipse (x-20, y+150, diametreBouton, diametreBouton);
//bouton en haut à droite
ellipse( x+20, y+150, diametreBouton, diametreBouton);
//bouton en bas à gauche
ellipse(x-20, y+170, diametreBouton, diametreBouton);
//bouton en bas à droite
ellipse(x+20, y+170, diametreBouton, diametreBouton);


//poche
float largeurPoche = x/8;
float hauteurPoche = 3;
rect( x+55, y+120, largeurPoche, hauteurPoche);



//mouchoir
fill(200);
//mouchoir arrière
triangle(x+52, y+103, x+63, y+115, x+46, y+115);
//mouchoir avant
triangle(x+60, y+105, x+63, y+115, x+50, y+115); 

//cou
float largeurCou = x-170;
float hauteurCou = 7;
rect(x, y+22, largeurCou, hauteurCou);

}

/*---------------------------------------------------------------------------------------*/
void BoiteTv () {

//télévision
fill(80);
//base
float largeurBase = 115;
float hauteurBase = 8;
rect(x, y+13, largeurBase, hauteurBase);
//boite
float largeurBoite = x;
float hauteurBoite = y-50;
rect(x, y-67, largeurBoite, hauteurBoite);
line(255, 190, 255, 80);

}

/*------------------------------------------------------------------------------------*/

 void YeuxBoutons () {
  float diametreBoutontv = 31;
 


//boutons télé et maintenant les yeux

// oeil du haut 
fill(255); 
ellipse(xOeilHaut, yOeilHaut, wOeil, hOeil);
float radians = atan2 (mouseY- yOeilHaut, mouseX-xOeilHaut); 
float distance = sqrt (pow(mouseY- yOeilHaut, 2)+ pow (mouseX- xOeilHaut, 2));

fill(0); 
ellipse (cos(radians)*min(distance, wOeil/2- wIris/2)+ xOeilHaut, sin(radians)* min(distance,hOeil/2- hIris/2)+yOeilHaut, wIris, hIris);

// oeil du bas

fill (255);
ellipse (xOeilBas, yOeilBas, wOeil, hOeil);
float radiansB = atan2(mouseY- yOeilBas, mouseX- xOeilBas); 
float distanceBas = sqrt(pow(mouseY-yOeilBas,2)+ pow (mouseX-xOeilBas, 2));

fill(0);
ellipse(cos(radiansB)*min(distanceBas, wOeil/2- wIris/2) + xOeilBas, sin(radiansB)* min(distanceBas, hOeil/2 - hIris/2)+ yOeilBas, wIris, hIris); 

float largeurBouton = x/8;
float hauteurBouton = 3;
rect(278, 165, largeurBouton, hauteurBouton); 
rect(278, 170, largeurBouton, hauteurBouton);
rect(278, 175, largeurBouton, hauteurBouton);
rect(278, 180, largeurBouton, hauteurBouton);
 }
 
/*------------------------------------------------------------------------------------*/
void ecranTv () {



if(mousePressed == true){
// écran télé
strokeWeight(30);
strokeJoin(ROUND);
rect(180, 133, 105, 88);

//colorbar télé


//barres couleurs premiere rangée à partir du haut
noStroke();
float largeurBarre = x-170;
float hauteurBarre = y-140;
fill(240, 233, 17);
rect(128, 114, largeurBarre, hauteurBarre);
fill(17, 240, 223);
rect(158, 114, largeurBarre, hauteurBarre);
fill(27, 240, 17);
rect(188, 114, largeurBarre, hauteurBarre);
fill(240, 17, 210);
rect(218, 114, largeurBarre, hauteurBarre); 
fill(240, 17, 17);
rect(240, 114, largeurBarre - 15, hauteurBarre);

//barres couleurs deuxieme rangée à partir du haut
fill(0);
rect(128, 150, largeurBarre, hauteurBarre-48);
fill(240, 17, 210);
rect( 158, 150, largeurBarre, hauteurBarre-48);
fill(0);
rect(188, 150, largeurBarre, hauteurBarre-48);
fill(17, 240, 234);
rect(218, 150, largeurBarre, hauteurBarre-48); 
fill(0);
rect(240, 150, largeurBarre - 15, hauteurBarre-48);

//barres couleurs troisieme rangée à partir du haut
fill(27, 24, 131);
rect(130, 169, largeurBarre+5, hauteurBarre-33);
fill(240);
rect(165, 169, largeurBarre+5, hauteurBarre-33);
fill(98, 56, 155);
rect(200, 169, largeurBarre+5, hauteurBarre-33);
fill(50);
rect(232, 169, largeurBarre+2, hauteurBarre-33);
}

else{
  fill(200);
}
//antennes
strokeWeight(3);
stroke(0);
line(x+35, y-144, x+80, y-187);
ellipse(280, 13, 6, 6);
line(x+35, y-144, x+20, y-180);
ellipse(x+20, y-180, 6, 6); 

}

/*==================================================================================================================*/
//Créer une télécommande curseur 
float vitesse;
float xCiblee;
float yCiblee;
float telecommandeX;
float telecommandeY;
void curseurTelecommande()
{
  vitesse =5;
xCiblee = mouseX;
yCiblee = mouseY; 
  if(mouseX <= width/2) // ajustement à la moitié de l'écran 
   {
 float radians = atan2( yCiblee-telecommandeY, xCiblee-telecommandeX );
  float distance = dist( xCiblee, yCiblee, telecommandeX, telecommandeY );
  telecommandeX = cos(radians) * min(distance,vitesse) + telecommandeX;
  telecommandeY = sin(radians) * min(distance,vitesse) + telecommandeY;

// gauche
  fill (0);
  quad(150, 130, 200, 150, 100, 300, 50, 250);
  fill (230);
  
  //1ere rangee du haut
  ellipse(170, 170, 10, 10);
  ellipse(160, 165, 10, 10);
  ellipse(150, 160, 10, 10);
  
  // 2e rangee du haut
  ellipse( 157, 190, 10, 10);
  ellipse(147, 185, 10, 10);
  ellipse(137, 180, 10, 10);
  
  // 3e rangee du haut
  ellipse(143, 210, 10, 10);
  ellipse(133, 203, 10, 10);
  ellipse(123, 198, 10, 10);
 
   }
 else{
 
    fill(0);
 // droit
  quad(200, 150, 250, 130, 350, 250, 300, 300);
 fill (230);
// 1ere rangee du haut
 ellipse(232, 170, 10, 10);
 ellipse(242, 165, 10, 10);
 ellipse(252, 160, 10, 10);

// 2e rangee du haut
  ellipse(245, 190, 10, 10);
 ellipse( 256, 183, 10, 10);
 ellipse(267, 178, 10, 10);
 
// 3e rangee du haut
  ellipse(260, 210, 10, 10);
  ellipse(272, 203, 10, 10);
  ellipse(284, 198, 10, 10);
   
   
  
   }
}

void mousePressed() {
        index = index + 1;
        if ( index > 2 ) index = 0;

}











