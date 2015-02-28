
//Sandrick Mathurin
//Médias Interactif
//UQAM
//EDM4600
//Tapisserie interactive

/////////////////définition des images
PImage a; //image 1
PImage b; //image 2
PImage c; //image3
PImage z; //variable de l'image

//variables
int w = 400;  // width 
int h = 400;  // height 
int fps = 60;  // frame rate 

int largeur =25; //largeur de l'image
int longeur =25; //longeur de l'image


int rouge=255; //couleur rouge de l'image
int bleue=255; //couleur bleue de l'image
int vert=255; //couleur verte de l'image
  
void setup()
{
  size(400,400);  
  frameRate(fps);    

  a = loadImage("fou.jpg");
  b= loadImage("fou2.jpg");
  c= loadImage("fille.jpg");
  z=a;

}

void draw()
{
//Changer la couleur de l'image avec l,axe de la souris et le bouton droit
 if (mousePressed &&  mouseButton == RIGHT){ 
    rouge=abs(mouseX);  
    bleue=abs(mouseY);
  }
//Changer la grosseur et la forme de l'image avec la position de la souris et le bouton gauche  
  if (mousePressed &&  mouseButton == LEFT) { 
    largeur =abs(mouseX);
      longeur =abs(mouseY);
 if (mouseX == 0){
 mouseX=1;
 }   if (mouseY == 0){
 mouseY = 1;
 }   
   
  }
   
   
   
/////Sélection de l'image avec les touches du clavier
  if(keyPressed) {
    if (key == '1') {z=a;
       }
      if (key == '2') {z=b;
       
    }
    
       if (key == '3') {z=c;
       
    }
}

//loop

  for ( int x = 0 ; x < width ; x=x+largeur) {
    for ( int y = 0 ; y < height ; y=y+longeur ) {

      tint(rouge, bleue, vert, 126); //teinte de l'image
      image(z, x, y, largeur,longeur) ; //dessiner l'image
    }
  }

}






