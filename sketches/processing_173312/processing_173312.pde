
// vv
int i; //sangre colmillos
int speedI = 10; // movimiento sangre
int j; //sangre fondo
int speedJ = -10;
int state  = 0;
float rW;
float r; //ojos random
int fillOjos;
int ojo;

void setup () {
  size (400,400);
  frameRate (30);
  
}

void draw () {
  background (255);
  
  rectMode(CENTER);
  // RECUADRO
  strokeWeight (8);
  stroke (0);
  fill (255);
  rect (width/2,height/2,200,200);
  
   if (keyPressed) {
     if (key == 'f') { 
     state = 1;
     }  
     if (key == 'a') { 
     rW = 3;
     }
     if (key == 's') { 
     fillOjos = (255);
     }
     
    }
  
  noStroke();
  fill (fillOjos,0,0);               //ojos
  ellipse (165,180, r,rW);
  ellipse (235,180, r,rW);
  fillOjos = 0;
  
  stroke (0);
  strokeWeight (6); //Stroke colmillos
    line (170,230,180,250);
    line (180,250,190,230);
    line (210,230,220,250);
    line (220,250,230,230);
  
  rectMode (CORNER); //fondo sangre
  noStroke ();
  fill (255,0,0);
  rect (0,height+j,width,500);
  
    if (i >= height) {
      j = j + speedJ ;
      constrain (j,height,-100);
    }

    if (state == 0) {
        r =  25;
        rW = 25;
        i = 0;
    } 
    if (state == 1) {
        rW= random (10,40);;
        r = random (10,40);
        i = i + speedI;
        constrain (i,  0, 400);
        fill (255,0,0); //sangre colmillos
        noStroke ();
        rectMode (CORNER);
          rect (170,250,20,i);
          rect (210,250,20,i);
        if (j==-500) {
          i=0;
          state = 2;
        }
    }
    if (state == 2) {
      j = j + speedJ;
      r = 25;
      rW = 25;
        if (j == -1000){
          i=0;
          j=0;
          state = 0;
        }
    }

    
}
