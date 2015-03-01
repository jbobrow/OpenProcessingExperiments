
//Pong
int []  posx = {20, 100, 180, 260, 340, 20, 100, 180, 260, 340, 20, 100, 180, 260, 340 };
int []  posy = {50, 50, 50, 50, 50, 90, 90, 90, 90, 90, 130, 130, 130, 130, 130};
boolean []  tocat = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean start = false;

    //posicions
int posX_barra;
int posY_barra;
int posX_pilota;
int posY_pilota;

    //mides
int mida_barra;
int mida_pilota;

    //velocitats
float velocitatsX;
float velocitatsY;

int score;

boolean moure;

void setup()
{
  
   size(400, 600);
   smooth();
   fill(255);
   stroke(0);
   textAlign(CENTER, CENTER);
   textSize(20);
   
   
   posX_barra = width/2;
   posY_barra = 550;
   mida_barra = 50;
   mida_pilota = 10;
   moure = true;
   score = 0 ;
}
   
void draw()
{
  background(0);
  fill (100);
  rect (0, 0, width, 50);
  fill (250);
  text ( "SCORE: "+score, width/2, 20);
   
  for (int i=0; i < 15; i++) {
  
  dibuixar_barra();
  dibuixar_pilota ();
  moviment_pilota ();
  blocs (i);
  moviment_blocs (i);
  }
}


  void dibuixar_barra ()
  {
  noStroke ();
  rectMode (CENTER);
  fill (255);
  rect (posX_barra, posY_barra, mida_barra, 5);
  fill (#E0FF1A);
  arc (posX_barra, posY_barra, 50, 20, radians (0), PI ); 
  }
      
  void keyPressed()
  { if((keyPressed == true) && (keyCode ==RIGHT))
    { if (posX_barra <  (width - mida_barra/2)){
       posX_barra+=10;
       }
    }
    
    if((keyPressed==true) && (keyCode==LEFT))
    {if (posX_barra > mida_barra - mida_barra/2){
      posX_barra-=10;
      }
    }
  }

  void dibuixar_pilota ()
  {
   fill (150);
    ellipse (posX_pilota, posY_pilota, mida_pilota, mida_pilota);
  }
  
  void blocs ( int _i) 
  {   
    color trobat = get (posX_pilota, posY_pilota - mida_pilota - 2);
    if (trobat != #000000){
    velocitatsY = -velocitatsY;
    tocat[_i] = true;
  }
 
else {   
  if (!tocat[_i]){
  rectMode (CORNER);
  fill (color (int (random(255)), int (random (255)), int (random (255))));
  rect (posx [_i], posy [_i], 50, 20);
   velocitatsY= -velocitatsY;
  }
}
  }
  
  
  void moviment_blocs (int _i)
 {
  if (moure == true) {
        if ( posy [_i] < height/2) {
              posy [_i] += 1;
        }
        else moure = false;
  }
} 


void moviment_pilota () {
  
  if (start == true) {
    if ((posY_pilota > height - 60) && (posX_pilota > posX_barra - mida_barra/2) && (posX_pilota < posX_pilota + mida_barra/2))
    {
      velocitatsX =- velocitatsY;
      score++;
    }
    
    if (posY_pilota<0){
      velocitatsY=-velocitatsY;
    }
   
    if ((posX_pilota> width-10) || (posX_pilota<0)) {
      velocitatsX =- velocitatsX;
    }
  }
  
  else {
   velocitatsX = 0;
   velocitatsY = 0;
   posX_pilota = width/2;
   posY_pilota = 540;
  }
  
  if (posY_pilota> height-10)  
  {
    text("GAME OVER", width/2, height/2);
    noLoop();  
  } 
  
  posX_pilota += velocitatsX;
  posY_pilota += velocitatsY;
}


void mouseClicked()
{
  velocitatsX=1;
  velocitatsY=2;
  start=true;
}

