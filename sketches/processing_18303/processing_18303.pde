
float deplacementX;
float x;

float v;

float deplacementY;
float y;

float w;

PFont font;
int score;




void setup() {
  noCursor();
  size(600,600);
  smooth();
  noStroke();
  x = 50;
  deplacementX = 1;
  
  y = 50;
  deplacementY = 3;
  
  v = 1.5;

  w = 1.5; 
  
  font = loadFont("Superdigital-20.vlw");
  textFont(font);
  

}

void draw () {
  background(0);
  
  //score
   fill(0,255,0);
   text(score,30,15);


  //tester si on touche la plateforme
  if ( (y > 545 && y < 555) && (x >= mouseX && x <= mouseX+50)) {
    deplacementY= -3;
    w= -1.5;
    score = score + 10;
  }



  //test bord droit
  if ( x > 540 ) {
    deplacementX = -1;
    v= -1.5;
    
  }

  //test bord gauche
  if ( x < 40 ) {
    deplacementX = 1;
     v = 1.5;
  }

  //test haut
  if ( y < 40 ) {
    deplacementY = 3;
    w = 1.5;
    
  }

  //Dépalcer la balle
  x = x + deplacementX + v;
  y = y + deplacementY + w;


  //tracer la balle
  rect(x,y,10,10);

  // tracer la plateforme
  rect(mouseX,550,50,5);
  
  //tracer les bords
  fill(0,255,0);
  rect(35,40,520,2);
  rect(35,40,2,520);
  rect(555,40,2,520);
  
  
  //fin de jeu
  if (y > 650 ){
    deplacementX = 0;
    deplacementY = 0;
    text("game over",220,310);

    
  } 
  
  
}

void mouseClicked(){
    y=50 ;
    x=50 ;
}
 
  








