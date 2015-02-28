
PImage img;
PImage img2;
PImage img3;
PImage img4;
int anzahl = 100;
float winkel = 0; 
float xpos = 0;

void setup () {
  size(500, 500);
  smooth ();

  imageMode (CENTER);


  xpos = -200;
  img4 = loadImage ("sonne.png");
  img3 = loadImage ("verlauf.png");
  img2 = loadImage ("fisch.png");
  img = loadImage ("schiff.png"); 

  rectMode (CENTER);

}

void draw () {
  background(255);
  frameRate(9);
  noTint();
  image (img3,0,0);
  noLoop();
  tint(255,255,255,100);
  image (img4,width-500-random(3,6), height-500- random(3,6));
  loop();
  noTint(); 
  if (winkel> TWO_PI) {
    winkel = 0;
  }
  
  float xstep = (width *1.2/ anzahl);
  float astep = TWO_PI / (anzahl - 1);

  for (int i=0; i <1000; i = i + 1) {
    
    pushMatrix ();
    translate ( i * xstep, height-30 );
    rotate (i * -astep);
    strokeWeight(16);
    stroke(255,255,255, 40);
    fill(i/13,i/13,i/13,20);
    rotate (winkel);
    rect (0, 0, 80,80);
    popMatrix ();

    pushMatrix ();
    translate ( i * xstep, height-30 );
    rotate (i * -astep);
    strokeWeight(16);
    stroke(255,255,255, 40);
    fill(i/13,i/13,i/13,20);
    rotate (winkel);
    rect (0, 0, 80, 80);
    popMatrix ();

    pushMatrix ();
    translate ( i * xstep, width-30 );
    rotate (i * -astep);
    strokeWeight(16);
    stroke(255,255,255, 40);
    fill(i/13,i/13,i/13,20);
    rotate (winkel);
    rect (200,100, 60, 60);
    ellipse (200,100, 60, 60);
    fill(0,0,0,50);
    ellipse(100,100,60,60);
    popMatrix ();
  }

  winkel = winkel + 0.010;

  xpos = xpos + 1;


  if (xpos> width + 30) {
    xpos = -30;
  }
  image (img2,xpos+12- random(3,6), height / 2+122- random(3,6));
  image (img2,xpos+472- random(3,6), height / 2+122- random(3,6));
  image (img2,xpos+572- random(3,6), height / 2+152- random(3,6));
  image (img2,xpos+100- random(3,6), height / 2+160- random(3,6)); 
  image (img2,xpos-160- random(1,3), height / 2+120- random(3,46));
  image (img,xpos- random(3,6), height / 2+72- random(3,6));
}




