
void setup(){  
//Taille du sketch.
  size(800,800);  
//Trait plus "fin".
  smooth(); 
//Appaisseur de trait de O,4 unité.
  strokeWeight (0.4); 
//Pas de curseur.
  noCursor();
} 

void draw() { 
 
//Couleur de fond blanche.   
  background(250);  
//Boucle qui fait apparaitre 400 lignes. 
  for (int b=1; b<400;b++  ) 
    {
//Couleur de ligne, noire.      
     stroke(0);
//Definition du point de départ et d'arrivée de la ligne.     
     line (0, mouseY/cos(b), width, pmouseY/cos(b)); 
     } 
     
//Boucle qui fait apparaitre 400 lignes.  
  for (int a=1; a<400;a++  ) 
     {  
//Couleur de ligne, blanche.            
   stroke(255);
//Appaisseur de ligne d'unité 2.   
   strokeWeight (2); 
//Definition du point de départ et d'arrivée de la ligne.    
   line (mouseX-a, mouseY/cos(a), mouseX+a, pmouseY/cos(a)); 
    }
} 


//Thomas Fontaine. Merci à Q. Aurat pour ses cos et sin.

