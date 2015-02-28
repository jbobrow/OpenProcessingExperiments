
void setup()

{
  //taille du plan de travail
  size(500,500);
  
  //couleur de fond blanc
  background(250);
   
 }
 
void draw ()

{

  //variable: aucun contour pour toutes les ellipses 
  float s;
  s = 0 ;
   noStroke();
   
   //variable: taille des grandes ellipses
   float tailleG=45;
   
   //variable: taille des petites ellipses
   float tailleP=20;
//variable: taille des toutes petites ellipses
float taillePP=10;

   
   //variable: position des ellipses dans le plan de travail
  for (int posX=25; posX<width; posX=posX+50)
  {
   
   for (int posY=25; posY<height; posY=posY+50)
   {
    
    //variable: couleur beige de la plus grande ellipse 
    color beige = color (#F5CBCB); 
    
    //couleur beige de la grande ellipse
    fill(beige);
    
    //variable: couleur multicolor aléatoire des petites ellipses
    color multicolor = color (random(0,250),random(0,250),random(0,250));
    
    
    
    
  //taille des grandes ellipses et position des ellipses par rapport à une variable donnée 
  ellipse(posX, posY,tailleG, tailleG);
 
  //adoucir le trait des grandes ellipses
  smooth();
  
  //taille des grandes ellipses et position des ellipses par rapport à une variable donnée
  ellipse(posX, posY,tailleP, tailleP);
  
  //adoucir le trait des grandes ellipses
  smooth();
 
 //couleur multicolor des petites ellipses
 fill(multicolor);
 
 //taille des petites ellipses et position des ellipses par rapport à une variable donnée
  ellipse(posX, posY,taillePP,taillePP);

//adoucir les traits des petites ellipses
  smooth();
  
  }
  }
  }
