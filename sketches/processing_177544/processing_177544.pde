
PFont t;  

int fill1, fill2, fill2a, fill3; // fill botones

int xB1 = 112; // coordenadas botones
int yB1 = 518;
int xB2 = 263 ;
int yB2 = 518 ;
int xB3 = 414;
int yB3 = 518;

int state = 0;

int buttonW = 75; // tamaño botones
int buttonH = 13;

float vampX;
float vampY;
float buttonX, buttonY;

int ojoW, ojoH, colorOjos;

boolean button1 = false;
boolean button2 = false;
boolean button3 = false;

int j = 0;
int i = 0;

void setup() {  
  size (600, 600); 
  background(255); 
  smooth(); 
  frameRate (60);
  buttonX = width/4;
  buttonY = height/8*7;
  t = loadFont( "SanFranciscoDisplay-Bold-48.vlw" ); 
}   

void draw() {  
  background (255);
  vampX = width/2;
  vampY = height/3;
  ojoW = 25;
  ojoH = 25;
  colorOjos = 0;

  /* BOTONES */

  /* 1er BOTON - Mouse over */
  if (mouseX > xB1 && mouseX < xB1 + buttonW 
   && mouseY > yB1 && mouseY < yB1 + buttonH) {
    fill1 = #ff0000;
  } else {
    fill1 = 0;
  }

  /* 2do BOTON - Mouse over  */
  if (mouseX > xB2 && mouseX < xB2 + buttonW 
   && mouseY > yB2 && mouseY < yB2 + buttonH) {
    fill2 = #ff0000;
    fill2a = #ff0000;
  } else {
    fill2 = 0;
    fill2a = 0;
  }

  /* 3er BOTON - Mouse over */        
   if (mouseX > xB3 && mouseX < xB3 + buttonW 
    && mouseY > yB3 && mouseY < yB3 + buttonH) {
   fill3 = #ff0000;
  } else {
    fill3 = 0;
  }
  
  if (mousePressed) { //button1
    if (mouseX > xB1 && mouseX < xB1 + buttonW 
     && mouseY > yB1 && mouseY < yB1 + buttonH) {
    ojoH = 3;
    } 
  }
  if (button2) {
    colorOjos = #ff0000;
    fill2a = #ff0000;
  }
  if (state == 0) {
    j = 0;
    i = 0;
  }
  if (button3) {
    state = 1;
  }
  
  if (state == 1) {
    i += 5;
    ojoW = int (random (10,40));
    ojoH = int (random (10,40));
    constrain (i, vampY+50, height);
      if (i >= height) {
        j -= 10;
        constrain (j, height, -1201);
      }
      if (j < -600) {
        ojoW = (25);
        ojoH = (25);
        i = 0;
        j -= 10;
        
      }
      if (j < -1200) {
        j = 0;
        button3 = !button3 ;
        state = 0;
      }
  }
  
  
  
  rectMode (CORNER); // SANGRE COLMILLOS
  noStroke ();
  fill (#ff0000);
  rect (vampX-25, vampY+50, 10, i);
  rect (vampX+16, vampY+50, 10, i);

  rectMode (CENTER); // BOTONES
  noStroke ();
  fill (fill1);
  rect (buttonX, buttonY, buttonX/2, buttonY/40);
  fill (fill2);
  rect (buttonX*2, buttonY, buttonX/2, buttonY/40);
  fill (fill2a);
  rect (buttonX*2, buttonY, buttonX/4, buttonY/80); 
  fill (fill3);
  rect (buttonX*3, buttonY, buttonX/2, buttonY/40); 
  
  /* CUERPO Y COLMILLOS */
  rectMode(CENTER); 
  noFill();
  strokeWeight (10);
  stroke (0); /* cuerpo */
  rect (vampX, vampY, 200, 200);

  strokeWeight(5);
  fill(0); /* colmillos */
  line(vampX-30, vampY+30, vampX-20, vampY+50);
  line(vampX-20, vampY+50, vampX-10, vampY+30);
  line (vampX+30, vampY+30, vampX+20, vampY+50);
  line (vampX+20, vampY+50, vampX+10, vampY+30);
  
  fill (255); /* recuadro blanco */
  noStroke ();
  rect (width/2,180, 120, 40);
  
  
  fill (colorOjos);
  noStroke ();  /* ojos */
  ellipse(vampX-40, vampY-20, ojoW, ojoH);
  ellipse(vampX+40, vampY-20, ojoW, ojoH);
  
  rectMode (CORNER); // FONDO SANGRE
  noStroke ();
  fill (#ff0000);
  rect (0, height+j, width, 600);
  
}

  void mouseClicked () { 

  if (mouseX > xB2 && mouseX < xB2 + buttonW 
   && mouseY > yB2 && mouseY < yB2 + buttonH) { 
    button2 = !button2;
  }
  if (mouseX > xB3 && mouseX < xB3 + buttonW 
   && mouseY > yB3 && mouseY < yB3 + buttonH) {
    button3 = !button3 ;
  }
}



