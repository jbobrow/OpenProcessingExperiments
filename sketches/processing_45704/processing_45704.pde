
//ASTROWARS v1.0 BY DENNIS SCHMIDLIN // 2011 //dennis.schmidlin@students.fhnw.ch
// HAVE FUN!

int level =1;
int zeit = 0;
float gameframe=0;
boolean start = true;
boolean startgame = false;
boolean gameover = false;
boolean effekt = false;
int leben = 3;
int rad = 40;
boolean laser = true;
float starY = 0;
int count = 250;
int astrocount = 20;
int effektcount = 200;

float[] starleben = new float[leben];

float[] starYpos = new float[count];
float[] starXpos = new float[count];
float[] starYGeschwindigkeit = new float[count];
float[] starfarbe = new float[count];

float[] astroYpos = new float[astrocount];
float[] astroXpos = new float[astrocount];
float[] astroB = new float[astrocount];
float[] astrofarbe = new float[astrocount];
float[] astroYGeschwindigkeit = new float[astrocount];
boolean astrotreffer = false;

//int schuss = 0;
float laserYpos = mouseY;
float laserXpos = mouseX;
float laserYGeschwindigkeit = -10;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  background(0);
  frameRate(25);

  for (int i=0; i < starYpos.length; i++) {
    starYGeschwindigkeit[i] = random(0.1, 10);
    starXpos[i] = random(0, height);
  }
  for (int i=0; i < astroYpos.length; i++) {
    astroYGeschwindigkeit[i] = random(3, 8);
    astroYpos[i] = 0;
    astroXpos[i] = random(0, height);
    astroB[i] = rad;
  }
} // END SETUP

void draw() {
  fill(0);
  rect(0, 0, width, height);

  for (int i=0; i< starYpos.length; ++i) {
    starYpos[i] = starYpos[i] + starYGeschwindigkeit[i];
    fill (random(100, 255), random(100, 255), random(50, 255));  
    rect(starXpos[i], starYpos[i], random(0.5, 2), random(0.5, 2));

    if (starYpos[i] > height) {
      starYpos[i] = 0;
      starXpos[i] = random(0, width);
      starYGeschwindigkeit[i] = random(0.1, 10);
    }
  }

  fill(255);

  if (start == true) {
     level = 1;
    textSize(12);
    text ("TheNnis present a", width/2-50, height/2-50);
    text ("MANN IM MOND production", width/2-80, height/2-20);
    textSize(30);
    text ("PRESS START TO PLAY!", width/2-170, height/2+200);

    for (int i=0; i< astroYpos.length; ++i) {
      astroYpos[i] = -200;
    }

    if ( mousePressed) {
      start = false;
      startgame = true;
    }
  }

  //GAME OVER
  if (gameover == true) {
    textSize(12);
    text ("TheNnis present a", width/2-50, height/2-50);
    text ("MANN IM MOND production", width/2-80, height/2-20);
    textSize(30);
    text ("GAME OVER", width/2-90, height/2+200);
    textSize(20);
    text ("LEVEL:", width/2-50, height/2+230);
    text (level, width/2+20, height/2+230);
    if ( mousePressed) {
      leben = 3;
      start = true;
      gameover = false;
      startgame = false;
      for (int i=0; i < starYpos.length; i++) {
      astroYGeschwindigkeit[i] = random(3, 8);
      }
    }
  }

  //GAME START
  if (startgame == true) {
    
    if (laserYpos <= 0){
      laserYpos=mouseY;
      laserXpos=width+100;
    }

    if (mousePressed) {
      laser = false;
      laserYpos=mouseY;
      laserXpos=mouseX;
    }

    // LASER
    if (laser == true) {
      laserYpos = 0;
    }
    if (laser == false) {
      
      laserYpos = laserYpos + laserYGeschwindigkeit;  

      fill(255, 200, 230);
      rect(laserXpos, laserYpos, 3, 6);
      fill(150, 200, 230, 150);
      rect(laserXpos, laserYpos+6, 3, 8);
      fill(100, 200, 230, 100);
      rect(laserXpos, laserYpos+14, 3, 10);
      fill(50, 200, 230, 50);
      rect(laserXpos, laserYpos+24, 3, 12);
    } // LASER END

    //Raumschiff
    fill(200, 200, 255);
    triangle(mouseX-25, mouseY+25, mouseX, mouseY-25, mouseX+25, mouseY+25);
    fill(150, 200, 230, 100);
    triangle(mouseX-28, mouseY+28, mouseX, mouseY-28, mouseX+28, mouseY+28);
    fill(100, 200, 230, 50);
    triangle(mouseX-31, mouseY+30, mouseX, mouseY-30, mouseX+30, mouseY+30);
    //END RAUMSCHIFF


    for (int i=0; i< astroYpos.length; ++i) {
      astroYpos[i] = astroYpos[i] + astroYGeschwindigkeit[i];
      fill(200,230,100,200);
      rect(astroXpos[i], astroYpos[i], astroB[i], astroB[i]);

      if (astroYpos[i] > height) {
        astroYpos[i] = 0;
        astroXpos[i] = random(0, width);
      }
    }

    //LEBEN
    if (leben == 3) {
      fill(255, 100, 100, 200);
      ellipse(10, height-50, 10, 10);
      ellipse(10, height-30, 10, 10);
      ellipse(10, height-10, 10, 10);
    }
    if (leben == 2) {
      fill(255, 100, 100, 200);
      ellipse(10, height-30, 10, 10);
      ellipse(10, height-10, 10, 10);
    }

    if (leben == 1) {
      fill(255, 100, 100, 200);
      ellipse(10, height-10, 10, 10);
    }
    if (leben == 0) {
      gameover = true;
      startgame = false;
    }

    for (int i=0; i< astroYpos.length; ++i) { 
      if (dist (mouseX, mouseY, astroXpos[i]+rad/2, astroYpos[i]+rad/2) < rad) {
        leben = leben -1;
        astroYpos[i] = -500;
      }
    } //LEBEN END

    //TREFFER
    for (int i=0; i< astroYpos.length; ++i) {
      if (dist (laserXpos, laserYpos, astroXpos[i], astroYpos[i]) < rad) {
        astroYpos[i] = -500;
        laser = true;
      }
    }
    
    //level
    if(zeit > 750){
      astrocount = astrocount + astrocount/2;
      level++;
      zeit = 0;
      for (int i=0; i< astroYpos.length; ++i) {
      astroYGeschwindigkeit[i]=astroYGeschwindigkeit[i]+random(0.1,5);
      }
    }
      
    textSize(12);
    text ("LEVEL", 25, height-4);
    text(level,62,height-4 );
    
    zeit++;
    println(astroYGeschwindigkeit[0]);
  }
}

