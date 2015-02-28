
/**********************************************************
Tapisserie interactive - TP2
Algorithmie et interactivité
FÉLIX DESCÔTEAUX
***********************************************************/

//Initialisation des variables
float pos;
float bruit;
PImage img;
PImage b;

void setup() {
  size(400, 400);
  smooth();
  img = loadImage( "jiggly.png" );
  pos = dist(0, 0, width, height);
  b = loadImage("nuage.jpg");
}

void draw() {
  image (b, 0, 0);
  //boucles imbriquées
  for (int x = 0; x<= (width-42); x += 60){
    
    for (int y = 0; y<=(height-42); y += 60){
 
     float distSouris = dist(mouseX, mouseY, x, y);
     float largeur = (distSouris / pos) * 220;
     //Les JigglyPuff's s'agitent un peu sans MousePressed
     image( img , random(x-bruit, x+bruit),random(y-bruit, y+bruit) , largeur,largeur );
    
      //Agitation des JigglyPuff's
      if (mousePressed == true){ 
       bruit += 0.005;
       }    
       
       else
         {
          bruit -= 0.015 ;//L'agitation descend plus rapidement que son apparition
          //L'agitation ne peut descendre sous zéro
         
          if (bruit <=0){
            bruit=0;
          }
          
        else {
        }
       }
     }     
   }
 }
       
       
        
      


 
      
   

