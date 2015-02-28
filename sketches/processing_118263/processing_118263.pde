
// "interrupteur" qui correspond à la barre espace/entrer appuyée ou non
int space =0;
int enter =0;
// variables de la balle
int x,y;
int deplacementX,deplacementY;
//variables de la barre
int w,z;
int deplacementW, deplacementZ;
//variables du chien
float a,b;
// variables du mouvement du chien
float xoff,yoff;

// Variable de l'image du chien
PImage dog;
// variable des vies du chien !
int lives;
//-------------------------------------------------------------------------- 
void setup(){
  size(800,400);
  x = 400;
  y = 300;
  deplacementX = -4;
  deplacementY = 7;
  
  w = 10;
  z = 60;
  
  a = 500;
  b = 150;
  
  xoff = 0.0;
  yoff = 0.0;
  
  dog = loadImage("dog.png"); //chargement de l'image dog
  lives = 3;
  
}
//-------------------------------------------------------------------------- 
void draw(){
  background(255); //nettoyer
  
  //tant que space n'est pas pressé, donc qu'il est = à 0, rester sur l'intro
  if(space ==0){
  intro();
  }
  if(space==1){
    balle();
    barre();
    dog();
  }
  fin();
}

//------------------------------
    void intro(){
  //rectangle opaque sur lequel est inscrit les instructions
    fill(255);
    rect(0,0,width,height); //20 c'est les bords arrondis
  //instructions
  fill(0);
  textSize(18);
    text("  Welcome to KAHPONG!\n\n  Press SPACEBAR to start \n                 & \nUse the arrow keys to move.",280,150);
    }
    
//--------------------------------------------------------------------------    
    
    void keyPressed(){
      if(key ==' '){
        space = 1;
      }
      if(key == ENTER){
        enter = 1;
    }
    }

//-------------------------------------------------------------------------- 
void balle(){
  bougerBalle();
  rebondirBalle();
  dessinerBalle();
}
  void bougerBalle(){
    x = deplacementX + x;
    y = deplacementY + y;

  }
  void rebondirBalle() {
    // si on est trop à droite ET positive
    if (x > width-20 && deplacementX > 0) {
    deplacementX = -deplacementX;
   }
 
   // si on est (trop bas ET positive) OU on est (trop haut ET négative)
   if ( (y > height-20 && deplacementY > 0) || (y < 0 && deplacementY < 0) ) {
   deplacementY = -deplacementY;
   }

  
   //si on touche la barre, la balle rebondit
   if(x<w+25 && y>z && y<z+85){
   deplacementX = -deplacementX;
   }
   //si on touche le dog, la balle rebondit
   if(x>a-10 && x<a+190 && y>b-10 && y<b+120){
   deplacementX = -deplacementX;
   }
 
}

  void dessinerBalle(){
    smooth();
    noStroke();
    fill(0);
  rect(x,y,20,20);
  }

//-------------------------------------------------------------------------- 

void barre(){
  bougerBarre();
  dessinerBarre();
}
  void bougerBarre(){
     if(keyPressed){
          if(keyCode == UP && z>0){
            z+= -7;
          }
         if(keyCode == DOWN && z<height-85){
          z+= 7;
         }
        }
  }
  void dessinerBarre(){  
  noStroke();
  fill(0);
  rect(w,z,25,85);
  }

//-------------------------------------------------------------------------- 

void dog(){
  actionDog();
  tickleDog();
  dessinerDog();
  livesDog();
}
  void actionDog(){
    mouvementDog();
    tickleDog();
  }
  
  void mouvementDog(){ //les mouvements aléatoires du chien, "je m'balade hétéroclyte"
    //xoff = xoff + 0.001;
    //yoff = yoff + 0.003;
    //float a = noise(xoff)* width;
    //float b = noise(yoff) * height;
    //image(dog,a,b,180,110);
  }
  
  void tickleDog(){ //le chien tremble quand il se fait toucher par la balle, genre il a mal quoi
    if(x>a-10 && x<a+190 && y>b-10 && y<b+120){
      a += random(-3,3);
      b += random(-3,3);
    }
  }
  
  void dessinerDog(){ 
  //noStroke();
  //fill(255,0,0);
  //rect(a,b, 50,50);
  image(dog,a,b,180,110);
  }
  void livesDog(){
    // affichage du nombre de vies restantes
    //scale(0.5);
    //if(lives <= 10){
    //  for(j=0; 5*j < lives; j++) 
    //    for(i=0; (i < 5) && (5*j + i < lives); i++) 
    //      image(assets.alliedShipPicture, 10 + i*50 , 15 + 20*j);
   // }
  }

//-------------------------------------------------------------------------- 

void fin(){
    //si balle sort du cadre à gauche > game over!
     if (x < 10) 
   {
    fill(200,200,200,100);          //couleur réctangle. Le dernier c'est l'opacité
    rect(180,130,400,150, 20);
    fill(0);
    textSize(18);
    textAlign(LEFT,TOP);
    text ("      GAME OVER \nPress ENTER to try again!",290,170);
    
      if (enter ==1){
      x=400;  
      z = 60;
      a = 500;
      }
      if (x>10){
        enter = 0;
      }
  }
  

  
  // si 0 vies > you win !
    //if (lives == 0){
    //noLoop();
    //fill(255);
    //rect(400,150,350,100,20);
    //fill(0);
    //textSize(18);
    //textAlign(LEFT,TOP);
    //text("You Win!\n Press ENTER to try again!", 280,150);
  //}
}
  


