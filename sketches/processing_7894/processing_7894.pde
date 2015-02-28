

//((((CRAZY BARCODE FLYGHT)))) Quentin Aurat.  
//si vous voulez investir l'espace au maximun, je conseille de commencer par dessiner à gauche.
 

void setup() { 
  size(500, 500); 
  background(#ffffff);
 strokeWeight (0.8); 
  smooth(); 
} 
 

void draw() {
 /*stroke(200); 
  line (0,600,0,0);
  line (600,0,0,0);
  line (0,0,600,0);
  line (0,0,0,600);*/
 
 
  
 if (mousePressed == true) { 
     
     stroke(0,0,0);  
     line(mouseX+30,mouseY+30,mouseX+20,mouseY+20);    
}
    
 if (mousePressed == true) { 
            
     stroke(255,255,255);
     line(mouseX-10,mouseY-10,mouseX*100,mouseY+60);   
                                            
 
};
     
 if (mousePressed == true) { 
        
     stroke(0,0,0);
     line(mouseX-100,mouseY-100,mouseX,mouseY);
                                            
 
};

    
  if (keyPressed == true) { 
     
  saveFrame();  
  background(#FFFFFF); 
 
 
}; 
   
   
     
} 
 
 
 
 
 
 
//--------Boite à outils du cours------------// 
 
/* 
 
>>>un double slash // met une ligne en commentaire, ce texte devient gris et est ignoré 
>>>slash etoile etoile slash met plusieurs lignes en commentaires 
 
>>>taille du sketch hauteur, largeur 
 size(500, 500); 
 
>>>couleur de fond, ou effacer l'écran 
background(hex); 
 
 
>>>et voila line() qui trace une ligne entre deux coordonnées 
line(x1, y1, x2, y2); 
 
>>>coordonnées actuelles de la souris 
mouseX, mouseX 
 
 
>>>si (l'utilisateur presse le bouton de la souris){ fais ceci); 
 
 if (mousePressed == true) { 
   ecrire ici ce qu'il doit se passer  
  }; 
   
>>>si (l'utilisateur presse un bouton du clavier) { fais cela); 
 
  if (keyPressed == true) { 
  ecrire ici ce qu'il doit se passer  
 
  }; 
   
   
*/ 
 

