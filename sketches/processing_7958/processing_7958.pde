
// Jouons avec:  line(x1, y1, x2, y2); 
 
 
 
 
void setup() { 
  size(500, 500); 
  background (#FFFFFF); 
 } 
 
 
void draw() { 
 if (mousePressed == true) {
    } 
    
//line( 500, mouseY+50, 5, 250);
//line(10, 50, mouseX, mouseY); 
//line( mouseX, 500, 250, 77);
//line ( 500, 73, 11, mouseY);
//line (500, mouseY, 500, 73);
//line (500, 500, 500, 500);
//line(mouseX+1, mouseY, mouseX*500,mouseX);
//line(mouseX-100, mouseY-50, mouseX+500,mouseX*50);
//line( mouseY-500, 500, mouseY+78, mouseY+500);
//line( 250, 250, 250, 250 );
//line ( mouseY*250, mouseX, mouseX, mouseY*250);
//line ( mouseY+250, mouseX, mouseX, mouseY-250);
//line ( mouseY+250, mouseX-22, mouseX+22, mouseY-250);
//line ( 80, 50, mouseY+250, mouseX-250 );
//line ( 70, mouseX-22, mouseX+22, mouseY-250);
line ( 250,mouseX+250, mouseY+250, 250 );  
//(ligne du dessus ++)

//line ( mouseY, mouseX, mouseY+250,mouseY*250 ); 
//line ( 250, mouseX*250, 250, mouseY*250);


     
} 



 
 
 
 
 
 
//--------Boite à outils du cours------------// 
 
/* 
 
>>>un double slash // met une ligne en commentaire, ce texte devient gris et est ignoré 
>>>slash etoile etoile slash met plusieurs lignes en commentaires 
 
>>>taille du sketch hauteur, largeur 
 size(500, 500); 
 
>>>couleur de fond, ou effacer l'écran 
background(hex); 
background(hex, alpha); 
 
>>>et voila line() qui trace une ligne entre deux coordonnées 
line(x1, y1, x2, y2); 
 
>>>couleur et épaisseur de la ligne 
stroke() 
strokeWeight() 
 
>>>coordonnées actuelles de la souris 
mouseX, mouseX 
 
>>>coordonnées précédentes de la souris 
pmouseX, pmouseY 
 
 
>>>si (l'utilisateur presse le bouton de la souris){ fais ceci); 
 
 if (mousePressed == true) { 
   ecrire ici ce qu'il doit se passer  
  }; 
   
>>>si (l'utilisateur presse un bouton du clavier) { fais cela); 
 
  if (keyPressed == true) { 
  ecrire ici ce qu'il doit se passer  
 
  }; 
   
   
*/ 
 


