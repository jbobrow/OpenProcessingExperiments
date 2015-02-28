
//ODE A JUSTIN//
//Par***********Xavier Bégin-Leblanc************
//EDM4600


// IDENTIFICATION DES VARIABLES
int col = 20;
int rang = 20;
float L;
float H;
float theta;
PImage ninja;
//boolean b = true; 

//Setup pour la préparation de la mosaique
void setup() {
  size(400,400);
  smooth();
  noStroke();
  frameRate(30);
  
  //Variable pour la grosseur de chaque images
  L = width/col;
  H = height/rang;
  
  ninja = loadImage("ninjaJeek.jpg");
 
}

void draw() {
  background(0);
   
   //Boucle imbriquée
for(int k=0; k<col; k++) {
   for (int g=0; g<rang; g++){
     float x = k * L;
     float y = g * H;
  
 //Variable en fonction de la rotation des éléments 
  if (mousePressed) { image(ninja,x,y,L,H);}
  else {
  float theta = PI*mouseX / width,height ; 
  rotate(theta);
     image (ninja,x,y,L,H);
  }
}
 //Ramener l'image de premier plan



 }

   }
   
   //PS mon idée






