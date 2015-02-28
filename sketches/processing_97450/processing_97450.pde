
//Min Kyung Kim, minkyunk@andrew.cmu.edu
//Copyright Min Kyung Kim April 2013. All rights reserved.
//h o m e w o r k 1 2
//c l i c k   t o   v i e w

//arrays
  //dates
String [ ] yr = {"1 8 7 7", "1 8 8 0 ~ 1 8 9 0", "1 8 7 4", "1 8 6 2 ~ 6 3", "1 8 8 9"};
  //artists
String [ ] artist = {"C a i l l e b o t t e", "C e z a n n e", "D e g a s", "M a n e t", "M o n e t"};
  //paintings
PImage[] images = new PImage[6];
//background
PImage bg;


PFont i;
int dataPhase;


void setup () {
  size (800, 600);
  noStroke ( );
  smooth ( );

  i = loadFont ("Garamond-48.vlw");
  textFont (i);
  fill (255);
  
  //load image arrays
  imageMode (CENTER);
  for (int i = 0; i< images.length; i++)
  {images[i] = loadImage( i + ".jpg"); }
  
  bg = loadImage ("bg.jpg");
  
  
  
}

void draw ( ) {
  
  background (bg);
  fill (0, 50);
  rect (0, 0, width, height);
  
  if (dataPhase == 0) {
    home ( );
  } else if (dataPhase == 1) {
    realPaintings ( );
  }
  if (keyPressed == true) {
    dataPhase = 0;
  }
  
}

void home ( ) {
  //home screen
  fill (255);
  textSize (48);
  text ("i m p r e s s i o n i s m", width/4, height/2.5);
  textSize (36);
  text ("s i n c e 1 8 6 2", width/2, height/2.25);
}

void mousePressed ( ) {
  if (dataPhase == 0) {
    dataPhase = 1;
  }
}

// second screen
void realPaintings ( ) {
  fill (180, 20);
  rect (0, 0, width * .2, height);
  fill (200, 80);
  rect (width * .2, 0, width * .2, height);
  fill (220, 150);
  rect (width * .4, 0, width * .2, height);
  fill (240, 200);
  rect (width * .6, 0, width * .2, height);
  fill (255);
  rect (width * .8, 0, width * .2, height);
  mouse ( );
  loadText ( );
}

//hover effect
void mouse ( ) {
    textSize (24);
    if (mouseX < width * .2) {
      caillebotte ( );
    } else if (mouseX < width * .4 && mouseX > width * .2) {
      cezanne ( );
    } else if (mouseX < width * .6 && mouseX > width * .4) {
      degas ( );
    } else if (mouseX < width * .8 && mouseX > width * .6) {
      manet ( );
    } else if (mouseX < width && mouseX > width * .8) {
      monet ( );
    }
}
void caillebotte ( ) {
  fill (230, 100);
  rect (0, 0, width, height);
  fill (70);
  image (images [0], width/2, height/2);

}

void cezanne ( ) {
  fill (230, 100);
  rect (0, 0, width, height);
  fill (70);
  image (images [1], width/2, height/2);

}

void degas ( ) {
  fill (230, 100);
  rect (0, 0, width, height);
  fill (70);
  image (images [2], width/2, height/2);

}

void manet ( ) {
  fill (230, 100);
  rect (0, 0, width, height);
  fill (70);
  image (images [3], width/2, height/2);
}

void monet ( ) {
  fill (230, 100);
  rect (0, 0, width, height);
  fill (70);
  image (images [4], width/2, height/2);

}

void loadText ( ) {
  fill (0);
  textSize (22);
  
  //caillebotte
  text (yr [0], 0, height * 0.05);
  text (artist [0], 0, height * 0.1);
  //cezanne
  text (yr [1], width * .2, height * 0.05);
  text (artist [1], width * .2, height * 0.1);
  //degas
  text (yr [2], width * .4, height * 0.05);
  text (artist [2], width * .4, height * 0.1);
  //manet
  text (yr [3], width * .6, height * 0.05);
  text (artist [3], width * .6, height * 0.1);
  //monet
  text (yr [4], width * .8, height * 0.05);
  text (artist [4], width * .8, height * 0.1);
  
  //instruction
  text ("m o u s e   o v e r   a r t i s t   o f   y o u r   c h o i c e   t o   v i e w", width * .2, height * .92);
  text ("p r e s s   a n y   k e y   t o   r e t u r n", width * .2, height * .95);
}

