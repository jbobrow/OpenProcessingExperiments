
/*
Andrée-Anne Babin

Tp2 - Tapisserie visuelle interactive
EDM4600 - Algorithmie de base et interactivite

Inspiration pour explosion de l'image:
Livre LEARNING PROCESSING par David Shiffman
Site : http://www.learningprocessing.com/examples/chapter-15/example-15-15/
*/


//Déclation des variables

PImage img;

int taille = 2;
int cols; 
int rows;
int index = 1;

float rotationX, rotationY;
float time;

void setup() 
{
  img = loadImage("warp1.jpg");//on telecharge l'image
  size(400,400, P3D); //Par default on utilise P2D, nous devons donc le mettre a P3D pour utiliser l'attribut Z.
  
  cols = img.width/taille;//le nombres de colonnes a afficher en largeur.
  rows = img.height/taille;//le nombres de rangees a afficher en hauteur.
  
  frameRate(60); //vitesse des frames.
}

void draw()
{
  background(0); 
  img.loadPixels();//Permet de charger les pixels dans un tableau.
  
  translate(width/2, height/2);
  rotateX(rotationX);
  rotateY(rotationY);
  
  //Colonnes
  //cette boucle permet de dessiner les colones.
    for(int i = 0; i < cols; i++) 
    {
      //Rangees
      //cette boucle permet de dessiner les rangees.
      for(int j = 0; j < rows; j++)
      {
         int x = i*taille + taille/2;//donne la position en x du pixel.
         int y = j*taille + taille/2;//donne la position en y du pixel. 
         int position = x + y*img.width;//position du pixel dans le tableau.
         color couleur = img.pixels[position];//couleur du pixel a cette position.
         
         //permet de deplacer les pixels sur l'axe de Z
         float z = (mouseX-width/2)*10/float(width) * brightness(img.pixels[position]);//brightness = luminosite du point, de la couleur
         
         
         pushMatrix();
             translate(x-width/2, y-height/2,z);//deplace au bon endroit le pixel.
             fill(couleur);
             noStroke();
             rectMode(CENTER);//fait partir le rectangle(pixel) a partir du centre de la scene.
             rect(0,0, taille, taille);//creer le pixel
         popMatrix();
      }
      
    }  
}   

//Lorsque l'on clique avec le bouton de la souris, on change entre les 3 images.
void mousePressed()
{
  index++;
  if(index > 3)
   {
      index = 1;
   } 
   
 img = loadImage("warp"+index+".jpg");     
}

//Fleches du clavier et barre d'espacement

void keyPressed()
{
  if(key == CODED)//Tout les boutons utilisant un code doivent etre à l'interieur de ce dernier. 
  {
    if(keyCode == DOWN)//lorsque la fleche de bas est pese, cela deplace l'image sur l'axe des X en negatif.
    {  
        rotationX -=0.01;      
    }
    else if(keyCode == UP)//lorsque la fleche du haut est pese, cela deplace l'image sur l'axe des X en positif.
    {
     rotationX +=0.01; 
    }
    
    
    
    if(keyCode == LEFT)//lorsque la fleche de gauche est pese, cela deplace l'image sur l'axe des Y en negatif.
    {
      rotationY -= 0.01;
    }
    else if(keyCode ==RIGHT)//lorsque la fleche de droite est pese, cela deplace l'image sur l'axe des Y en positif.
    {
      rotationY += 0.01;
    }
  }
  
  if(key == 32)//lorsque la barre d'espacement est pese, cela permet de remettrer l'image a son point de depart.
  {
    rotationX = rotationY = 0;
  }
  
switch(key)
{
  //lorsque la touche du clavier 2 est pese les pixels change a 2.
 case 50: 
 taille = 2;
 break; 

 //lorsque la touche du clavier 3 est pese les pixels change a 3.
 case 51:
 taille = 3;
 break;  
 
  //lorsque la touche du clavier 4 est pese les pixels change a 4. 
 case 52:
 taille = 4;
 break; 
 
  //lorsque la touche du clavier 5 est pese les pixels change a 5.
 case 53:
 taille = 5;
 break; 
 
  //lorsque la touche du clavier 6 est pese les pixels change a 6.
 case 54:
 taille = 6;
 break; 

 //lorsque la touche du clavier 7 est pese les pixels change a 7. 
 case 55:
 taille = 7;
 break; 
 
  //lorsque la touche du clavier 8 est pese les pixels change a 8.
 case 56:
 taille = 8;
 break; 
}
    
    //on doit "reset" les colonnes et les rangees avec les nouvelles tailles.
     cols = img.width/taille;//le nombres de colonnes a afficher en largeur.
     rows = img.height/taille;//le nombres de rangees a afficher en hauteur.
  
  
}


