
   
          //MARTINS Julie
          
          
          
  //je voudrais rÃ�Â©aliser bille qui suit souris puis qui se dÃ�Â©forme selon des boutons donnÃ�Â©s
  
  // je voudrais qu'une image se charge et 
  //apparaisse au niveau du bouton rose clair en plus en plus opaque qd le bouton est approchÃ�Â©...
        PImage img;

        int opacite;




  
  
//tout ce qui il y a a faire au debut:
void setup(){

          
          // j'agrandis la fenÃ�Âªtre
          size(800,800);
          
          // code pour uploader l'image:
          img = loadImage("baron.png");
          
          // je mets un fond blanc (pour faire ressortir couleurs)
          background(255,255,255);
          
          
          //mise ici sinon dans void draw, il est systematiquement a 0
          // ici Ã�Â©crit une fois 
          opacite=0;
          
          //fermeture accolade void setup ->
}
  



// a chaque instant le cercle suit la souris
void draw(){


  // VARIABLES :
  // Certaines variable se sont rÃ�Â©vÃ�Â©lÃ�Â©es inutiles au dernier moment (ODR et OGV par exemple)
  
        int TailleTeteLargeur;
        int TailleTeteHauteur;
        int TeteRemplieR, TeteRemplieV,TeteRemplieB;
        
        //changement sur les yeux:
        int OG,OD;
        int OD2=20;
        int OG2=20;
        
        //modifier sourire
        int S1,S2;
        
        int O;
        
        // modifier couleur yeux tous les deux indÃ�Â©pendemment:
        int ODR,ODV,ODB;
        int OGR,OGV,OGB;
        
        
        //je redessine fond blanc pour effacer les traces:
        background(255,255,255);
        
                


  // apriori, la taille est standard :
  //taille de la tÃ�Âªte par dÃ�Â©faut:
  TailleTeteLargeur=60;
  TailleTeteHauteur=60;
  
  // Couleur de la tete au dÃ�Â©but temps 0
  TeteRemplieR= 255;
  TeteRemplieV=255;
  TeteRemplieB=255;
  
  //Les Yeux:
  OD=20;
  OG=10;
  
  // le sourire:
  S1=70;
  S2=50;
  O=8;
  
  // Couleurs de l'Oeil DROIT OD + Rouge / +Vert / +Bleu
  ODR=20;
  ODV=190;
  ODB=10;
  
  
  // Couleurs de l'Oeil GAUCHE OG + Rouge / +Vert / +Bleu
  OGR=150;
  OGV=0;
  OGB=255;

  
  
    // BOUTON ROUGE DEFORMATION de la TETE
    // tete change de forme
         //1er bouton rouge + brillance
         strokeWeight(1);
         fill(200,0,0);
         stroke(0,0,0);
         ellipse(60,90,20,20);
         ellipse(60,90,16,16);
         //tache blanche du B. Rouge  brillant
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(65,86,5,5);
      
         //VARIABLE HAUTEUR + LARGEUR TETE
         if(dist (mouseX,mouseY,60,90)<150)
         {
           TailleTeteLargeur= int(random(70,95));
           TailleTeteHauteur= int(random(70,90));
           
         } else {
           //On n'est pas prÃ�Â¨s du rond donc tete normale
         }
          
          
          
          
    // BOUTON BORDEAUX COULEUR ALEATOIRE de la TETE
    // couleur de la tete au hasard compris tout de meme entre 2 valeurs
         //1e bouton violet + brillance
         strokeWeight(1);
         stroke(0,0,0);
         fill(160,0,90);
         ellipse(200,220,20,20);
         ellipse(200,220,16,16);      
         //point brillant Bouton Violet
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(205,216,5,5);
         
         
         //VARIALBLE 
         if(dist (mouseX,mouseY,220,220)<200)
         {
           TeteRemplieR=int(random(90,255));
           TeteRemplieV=int(0);
           TeteRemplieB=int(random(80,255));
          } else {
          
          }
          

   //BOUTON Rose flashy : APPARITION du CHAPEAU--------------------------------------------------------------
         strokeWeight(1);
         stroke(0,0,0);
         fill(255,90,250);
         ellipse(230,680,20,20);
         ellipse(230,680,16,16);
         //point brillant Bouton Rose flashy
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(233,676,5,5);
         
         
         
         
         
         if(dist (mouseX,mouseY,230,680)<300)
         {
           
           //TeteRemplieR=int(random(50,255));
           TeteRemplieV=int(random (50,100));
           TeteRemplieB=int(random(50,120));
           
           
          
           TailleTeteLargeur= int(random(120,140));
           TailleTeteHauteur= int(random(60,80));

           OG=int (random (5,10));
           OD=int (random (10,19));
          S1=int (random ((S1+50),(S1+70)));
          S2=int (random ((S2+8),(S2+15)));
                  
         ODR=255;  ODV=255; ODB=50;
         
  // Couleurs de l'Oeil GAUCHE OG + Rouge / +Vert / +Bleu
  OGR=0;
  OGV=0;
  OGB=255;
      
         }else{
           
           
         }
         

         

 //BOUTON ORANGE 
 //Tout change: la taille de la tete+ les yeux + remplissage de la tÃ�Âªte
         
         //Bouton ORANGE:
         stroke(0,0,0);
         fill(255,120,20);
         ellipse(600,90,20,20);
         ellipse(600,90,16,16);
         //point brillant Bouton Orange
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(605,86,5,5);
         
         //VARIABLE HAUTEUR + LARGEUR TETE
         if(dist (mouseX,mouseY,600,90)<150)
         {
           

           TailleTeteLargeur= int(random(90,110));
           TailleTeteHauteur= int(random(90,110));

           
           TeteRemplieR=int(random(1,10));
           TeteRemplieV=int(random (80,250));
           TeteRemplieB=int(random(80,255));
           OD=int (random (20,30));
           OG=int (random (5,15));
           S1=int (random (70,95));
           S2= int (random (50,65));
           
           
         } else {
           //On n'est pas prÃ�Â¨s du rond donc tete normale
         }
            
            
            
 //BOUTON Jaune : 
 //les yeux ont des couleurs difÃ�Â©rentes+ tailles diffÃ�Â©rentes 
 //le tout est alÃ�Â©atoire compris entre 2 valeurs choisie
         strokeWeight(1);
         stroke(0,0,0);
         fill(255,220,90);
         ellipse(700,760,20,20);
         ellipse(700,760,16,16);
         //point brillant Bouton Jaune
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(706,756,5,5);
                   if(dist (mouseX,mouseY,700,760)<200)
         {
           // au hasard contour entre 1 et 8 pix de large
             OD=int (random (20,50));
                 
                 // finalement ODR -> rouge pr oeil droit n'a pas servit
                 ODV=int (random(0,255));
                 ODB=int (random(100,200));
                 
             OG=int (random (10,50));
                 OGR=int (random (50,255));
                 
                 OGB=int (random (20,200));
           
         } else {
           
         }   
         
         

   //BOUTON Violet clair : la taille de l'Ã�Â©paisseur du trait change (alÃ�Â©atoire aussi)
         stroke(0,0,0);
         fill(200,90,255);
         ellipse(500,490,20,20);
         ellipse(500,490,16,16);
         //point brillant Bouton violet clair
         fill(255,255,255);
         stroke(255,255,255);
         ellipse(505,487,5,5);
         
         
                  if(dist (mouseX,mouseY,500,490)<200)
         {
           // au hasard contour entre 1 et 8 pix de large
             strokeWeight(random(0,20));
           
         } else {
           strokeWeight(1);
         }
         
 


          // TETE
          // je veux un cercle seul,pas une trainÃ�Â©e de son dÃ�Â©placement, 

          // ! A mettre AVANT cercle qui se dessine
          
          //dessine les lignes noires tete/yeux/sourire/bouton
          stroke(0,0,0);
          
          //toujours remplir avant de dÃ�Â©ssiner la tete
          fill(TeteRemplieR,TeteRemplieV,TeteRemplieB);
          //rotate(PI/3);
          ellipse(mouseX,mouseY,TailleTeteLargeur,TailleTeteHauteur);
          
          //je ne veus pas que la tÃ�Âªte du perso soit bleue:
          
          //noFill();
          
          // le cercle se dessine
          // ellipse ou (X,Y,Largeur,Hauteur)
          
          
          
            
          // LES YEUX
          
          // je remplis l'oeil DROIT de vert:
          //fill(20,190,10,100);
          
          // AVEC les variables :
          fill(ODR,ODV,ODB,100);
         

          // je dessine l'oeil droit du personnage Ã�Â  l'intÃ�Â©rieur du gros cercle:
          // j'appelle la variable nommÃ�Â©e plus haut OD qui a dÃ�Â©finit l'oeil Ã�Â  20 pix
          ellipse(mouseX+15,mouseY-10,OD,OD);
          fill (0,0,0,255);
          
          
          
          // je veux remplir l'oeil GAUCHE en violet:
          //fill(150,0,255,100);   = en Variables:
          fill(OGR,OGV,OGB,100);
          // je dessine l'oiel gauche du personnage a l'intÃ�Â©rieur du gros cercle:
          // j'ai dÃ�Â©fini plus haut OG = 10 donc remplacer 10 par OG revient au mÃ�Âªme, la variable est justÃ�Â© dÃ�Â©placÃ�Â©e
          ellipse(mouseX-15,mouseY-10,OG,OG);
          
                  
          //je ne veux pas que le sourire soit colorÃ�Â©
          noFill();
          // Essai d'un sourire en arc de cercle:
          // tel que a=x, b=y, c=largeur, d= hauteur, e= star, f= stop le tout en radians
          arc(mouseX,mouseY-15,S1, S2,+PI/4,HALF_PI+PI/4);  

         //je veux faire des boutons qui dÃ�Â©forment/explosent/ Ã�Â©tirent la tete du personnage
         //sous forme de petits boutons de formes diffÃ�Â©rentes:
 
 
 
  
  //fermeture accolade void draw ->
}

