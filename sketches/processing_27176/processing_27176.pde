
// Copyright Grégoire Gamichon HAHAHA
// Le Salami Vaincra !
// Vive Lunariville !



void setup() {
  


    
 stroke (255, 0, 0);  // thomas = rat d'égout
 size (2000, 800);
 
background(0, 0, 0); 
  
 
 text("Hello World !", 10, 20);
        text("-Appuyer sur une touche-", 10, 40);  

  

}



 
void draw() {
    smooth (); {
  
 


 
  

  
   

  
  
  
   if (keyPressed) {
   background(0, 0, 0); 
    text("Hello World !", 10, 20);
     text("Je suis Grégoire -Goo m' Ba- Gamichon, créateur du programme que vous utilisez !", 10, 40);
      text("Voici les commandes :", 10, 60);
       text("Clic droit (->) : Des belles fenêtres roses !", 10, 80);
        text("Clic gauche (<-) : un beau trait, rouge et continu !", 10, 100);
        text("Une touche du clavier au hasard : tout effacer !", 10, 120);
        text("Bon Dessin et, n'oubliez pas : Le Salami Vaincra !!", 100, 160);
          
        
        
     
   }     
  

stroke (255, 0, 0);
strokeWeight (10);
fill(255, 200, 0);
// line (mouseX, mouseY, 100, 10);

if (mousePressed && (mouseButton == LEFT)) {
  strokeWeight (4) ;
  line (pmouseX, pmouseY , mouseX, mouseY);
  
}

 if (mousePressed && (mouseButton == RIGHT)) {
fill (50, 50);  
   stroke (255, 0, 255);
rect (mouseX, mouseY, 150, 250);
fill (0, 0); 
   stroke (255, 0, 255);
rect (mouseX, mouseY, 150, 83);
fill (0, 0);
   stroke (255, 0, 255);
rect (mouseX, mouseY, 75, 250);
fill (0, 0);
   stroke (255, 0, 255);
rect (mouseX, mouseY, 75, 82);
fill (0, 0);
   stroke (255, 0, 255);
rect (mouseX, mouseY, 150, 166);
fill (0, 0);
   stroke (255, 0, 255);
rect (mouseX, mouseY, 150, 82);
fill (0, 0);
}


    }



  



 

 








    }


