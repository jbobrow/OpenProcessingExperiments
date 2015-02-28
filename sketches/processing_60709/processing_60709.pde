

/* --------------------------------------------------------------------------
Cours EDM4600 .Travail II.
-Théme: Monstre interactif. 
------Réalisé par Abbaci Hocine.
------Sous la direction de monsieur Thomas O Fredericks.
------Chargé de cours-Algorithme de base et intéractivité.
------Programme médias interactifs----UQAM--24 Février 2012.
-------------------------------------------------------------------------- */


String[] message = {"Lunettes","Chapeau","Pizza",""};
float d = 140;
float C1 = 105;// Contrôle de la couleur(Rouge). 
float C2 = 15;// Contrôle de la couleur(Vert).
float C3 = 15;// Contrôle de la couleur(Bleu).

float T1= 28;// Contrôle de l'aspect des cheveux.
float T2= 35;


float by= 130; 



boolean Locker=true;// Contrôle de l'ouverture du micro-ondes


//Mes images à charger.

PImage MyBackground;
PImage Glasses;
PImage CowboyBoots;
PImage Hat;
PImage Pizza;

void setup()
{
 
  size (400, 400); // Dimension de l'application.
  smooth(); // Anti-alias.
  ellipseMode(CENTER);
  noStroke();
  
//Chargement de mes images

  MyBackground = loadImage("Background-1.jpg");
  Glasses = loadImage("Glasses.png");
  CowboyBoots = loadImage("CowboyBoots.png");
  Hat = loadImage("Hat.png");
  Pizza = loadImage("Pizza.png");
  
}



// Créer une fonction pour les zones de réaction de la souris

 void HitZones(int x, int y)
  {
    
    
       float distance = dist( mouseX , mouseY , width/2 ,height/2 );   
 
       fill(255,0,0); 
  
    if(mousePressed && Locker==true )
       if(x>=100 && x<250 && y>=147 && y<209)
     {

       image(Hat, 63, 125);
       text(message[1],200,70);
       }
     else if (x>=100 && x<250 && y>=220 && y<299)
      {
       
       image(Glasses, 60, 220);
       text(message[0],200,70);

     }  
     
       else if (x>=125 && x<180 && y>=306 && y<330)
      {
       
       image(Pizza, 80, 300);
       text(message[2],200,70);
     }  
    
       println("Position-Mouse: x "+mouseX+" y "+mouseY);
   
       fill(100);
        
     }   
    
    
    // Créer une fonction pour dessiner le monstre

void Monster(float Shake1,float Shake2,float Shake3,float Shake4)

{
  
  float y=width *0.21; 
  float x =height *0.04;
  noStroke();
  
//Pied gauche.
  
  pushMatrix(); // Sauvegarder la matrice de transformation
  translate(x, y); // Déplacer la forme a dessiner
  rotate(radians(-105)); // Effectuer la rotation
  fill(C1-Shake4,C2,C3);
  ellipse(-185, 10, 45, 75);
  rotate(radians(-4)); // Effectuer la rotation
  fill(C1+Shake4,C2,C3);
  ellipse(-185, 20, 26, 75);
  translate(-114, -265);
  rotate(radians(-66.5));
  fill(C1-Shake4,C2,C3);
  ellipse(-240, -5, 45, 75); 
  fill(C1+Shake4,C2,C3);
  ellipse(-250, -14, 27, 67);  
  ellipse(-230, -14, 27, 67);
  fill(C1-Shake4,C2,C3);
  ellipse(-240, -26, 19, 49);
  fill (255);
  ellipse(-240, -30, 17, 47);
  popMatrix(); 


//Pied droit.

  pushMatrix(); // Sauvegarder la matrice de transformation
  translate(x, y); // Déplacer la forme a dessiner
  rotate(radians(-110)); // Effectuer la rotation
  translate(-270, -100);
  rotate(radians(-85.0));
  fill(C1-Shake4,C2,C3);

  ellipse(-240, -5, 45, 75); 
  fill(C1+Shake4,C2,C3);
  ellipse(-250, -14, 27, 67);
  ellipse(-230, -14, 27, 67);
  fill(C1-Shake4,C2,C3);
  ellipse(-240, -26, 19, 49);
  fill(255);
  ellipse(-240, -30, 12, 50);
  popMatrix(); 

//Cheveux.
   
   fill ( 0);
   ellipse( x+140 , y+84, T1+Shake1 , T2 );
   ellipse( x+125 , y+86, T1+Shake1 , T2 );
   ellipse( x+110 , y+88, T1+Shake1 , T2 );
   ellipse( x+100 , y+94, T1+Shake1 , T2 );  
   ellipse( x+100 , y+110, T1+Shake1 , T2 );
   ellipse( x+155 , y+86, T1+Shake1 , T2 );
   ellipse( x+170 , y+88, T1+Shake1 , T2 );
   ellipse( x+180 , y+94, T1+Shake1 , T2 );

//Reste du corps

   fill ( d / width * 255,0,0 );
   ellipse( x+140 , y+160 , 140 , d );
   // 
   fill ( d / width * 255,d / width * 122,d / width * 114 );
   ellipse( x+140 , y+160 , d+14 , d-17 ); 
   fill ( d / width * 844);
   ellipse( x+140 , y+170 , d , d-25 );
   fill (14);
   ellipse( x+140 , y+170 , d+50 , d-20 );
      
   // Oeil-Iris.
   
   fill ( d / width * 444);
   ellipse( x+140 , y+159 , d-Shake2 , d-20 );
   fill ( d / width * 744);
   ellipse( x+140 , y+170 , d- Shake2 , d-37 );
   
   // Oeil-Pupille.
   fill ( d / width * 044);
   ellipse( x+140 , y+170 , 35+Shake2 , 35 );
   
   
    // Bouche.
   fill ( 155);
   ellipse( x+140 , y+240 , 80 , 27);
   fill ( 255);
   ellipse( x+140 , y+244 , 80 , 31);
   
   // Dents.
   
   fill(C1-17,C2,C3);
   ellipse( x+140 , y+236 ,Shake1+ 56 , 25);
   fill ( 255);
   ellipse( x+140 , y+240 , Shake1+26 , 25);
   
}


void draw()
{
  
//// Création des variables pour le shaking du monstre,ça chauffe dans le four !!!

 float Shake1 = random(2,4);
 float Shake2 = random(4,8);
 float Shake3 = random(8,12);
 float Shake4 = random(20,70);
 
 background(MyBackground);

 
  
////Création de l'éspace lumineux (fond du micro-ondes).
 
float inside = map (mouseX -140, 50, 200, 0, 260);
float lighten = map (mouseX -140, 50, 200, 255, 0);
float inside2 = constrain (inside, 0, 255);
float inside3 = constrain (inside, 0, 150);
inside = constrain (inside, 0, 260);
lighten = constrain (lighten, 0, 255);
fill (lighten);
rect (8, by+2 , 290, 240);  
       
Monster(Shake1,Shake2,Shake2,Shake4);
 
HitZones(mouseX, mouseY);
          
stroke(0);
  
  if (mouseX<750 && Locker==false)
  {
    fill(0,0,0);
    rect (8, by+2 , 290, 240);
    text(message[3],200,70);  
}
  else
  {
  //Construction et configuration de la porte d'aprés un exemple dans une gallerie sur le site openprocessing.org
  float xradius = 390;
  float yradius = 20;
  float zradius = 10;
  float angle = map(mouseX, 70, 200, 4, PI/2);
  angle = constrain (angle, 0, PI/2);
  float angle2 = map (mouseX, 70, 200, 4, PI/2);
  angle2 = constrain (angle2, 0, PI/2);
  fill (lighten); 
  quad (400 - xradius*cos(angle), by - yradius*sin(angle), 300, by,  300, 378,  400 - xradius*cos(angle), 380 + yradius*sin(angle) );
  fill(210);
  quad(400 - xradius*cos(angle) - zradius*sin(angle), by - yradius*sin(angle2), 400 - xradius*cos(angle), by - yradius*sin(angle), 
  400 - xradius*cos(angle), 400 + yradius*sin(angle), 
  400 - xradius*cos(angle) - zradius*sin(angle), 400 + yradius*sin(angle2) );

  }
  
}



