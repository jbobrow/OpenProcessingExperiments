
class Moto {
  
 PImage img;
 float x;
 float y;
 float vitesse;
 float grandeur;


 
  Moto() {
    
   
 
  
    y=random(height);
    vitesse= random(2,6);
    img= loadImage ("moto.png"); 
    grandeur=75;
    x=0-grandeur-10;
   
  }
   
   
  void draw() {
     

    x=x+vitesse;


    if ( x > width) {
     x=-10;
     y=random(height);
    } 
     


    image(img, x , y, grandeur , grandeur);
     
  }
   
   
   
}

