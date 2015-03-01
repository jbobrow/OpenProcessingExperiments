
//INTERACTIVE TOY ASSIGNMENT
//by Brennan McNamara
//References: http://processing.org/discourse/beta/num_1139256015.html
//            Cylon Lander example


float gravity;

float shipX;
float shipY;

float shipXspeed;

float cowColorR;
float cowColorG;
float cowColorB;
float cowSpotAlpha;
float cowX;
float cowY;
float cowSpeed; 
float cowGround; //how far can the cow fall?

boolean cowcangoright;
boolean cowcangoleft;
boolean cowcanfall;
boolean cowbeamX;
boolean cowbeamY; //lets me know if the cow is effected by gravity or not
boolean cowalive; //not in use

//CONTROLS These make it so I can press multiple keys at a time.
boolean aPressed;
boolean dPressed;
boolean spacePressed;


void setup() {
  size(400, 400);
  background(110, 157, 117);
  gravity=1;
  cowColorR=255;
  cowColorG=255;
  cowColorB=255;
  cowSpotAlpha=100;
  cowalive=true;
  cowbeamX=false;
  cowbeamY=false;
  cowcangoright=true;
  cowcangoleft=true;
  aPressed=false;
  dPressed=false;
  spacePressed=false;
  shipandcowstart();
  cowGround=340;
}

//"INITIALIZE" SHIP AND COW
void shipandcowstart() {
  shipX=width/2;
  shipY=70;
  shipXspeed=0;
  //shipYspeed=0;
  cowX=130;
  cowY=340;
}

void draw() {
  drawscenery();
  drawstars();
  displaycontrols();
  moveship();
  drawship();
  updatecow();
  limitcow();
  drawcow(); 
  killcow(); 
  drawbeam();
  drawgrinder();
}

//BACKGROUND WITH STARS, GRADIENT, BARN
void drawscenery() {
  noStroke();
  fill(29, 7, 46);
  rect(0, 0, width, 340);
  horizonfadealphas();
  //GRASS
  fill(110, 157, 117); //green
  rect(0, 340, 340, 60);
}


//STARS - I referenced cylon_lander example
void drawstars() {
  strokeWeight(2);
  stroke(random(100, 255));
  point(220, 100);
  stroke(random(100, 255));
  point(250, 70);
  stroke(random(100, 255));
  point(280, 72);
  stroke(random(100, 255));
  point(305, 70);
  stroke(random(100, 255));
  point(365, 35);
  stroke(random(100, 255));
  point(370, 73);
  stroke(random(100, 255));
  point(330, 95);
  stroke(random(100, 255));
  point(30, 130);
  stroke(random(100, 255));
  point(70, 70);
  stroke(random(100, 255));
  point(90, 80);
  stroke(random(100, 255));
  point(30, 60);
  stroke(random(100, 255));
  point(110, 190);
  stroke(random(100, 255));
  point(120, 220);
  stroke(random(100, 255));
  point(110, 30);
  stroke(random(100, 255));
  point(290, 160);
}

void displaycontrols() {
  text("[A]-Left [D]-Right [SPACE]-Abduct", 10, 20);
}

void moveship() {
  if (shipX>0 && aPressed==true) {
    shipX=shipX-1.5;
  }
  if (shipX+80<400 && dPressed==true) {
    shipX=shipX+1.5;
  }
}

//DRAW SHIP!
void drawship() {
  //SHIP BASE
  noStroke();
  fill(201); //grey
  rect(shipX, shipY-5, 80, 15, 15);
  //BUBBLE WINDOW
  fill(70, 131, 134); //blue
  ellipseMode(CENTER);
  arc(shipX+40, shipY-5, 40, 40, PI, TWO_PI);
  fill(255, 255, 255, 50);
  ellipse(shipX+50, shipY-15, 5, 5);


}


//LIMIT COW so he doesn't magically phase through mean grinder
void limitcow() {

  //COW Y LIMITS
  if (320 > cowX && cowX > 280) {
    cowGround=280;
  } else if (cowX+50 >= 220 && cowX <= 220) {
    cowGround=260;
  } else if (cowX+50 >= 280 && cowX <280) {
    cowGround=260;
  } else {
    cowGround=340;
  }
}
//COW X LIMITS - Absolutely could not get these to work. No idea why. Leaving them in case you'd want to see my process
// if (cowY >= 260) {
//  fill(0, 255, 0);
//   rect(40, 40, 40, 40);
//  if (cowX+50 == 220) {
//     float constraincowX = constrain(cowX, 0, 170);
//    cowX = constraincowX;
//     cowcangoright=false;
//   }
// }

//UPDATE COW'S POSITION
void updatecow() {
  //TEMPORARY
  if (cowbeamX==true) {
    fill(0, 255, 0);
  } 
  if (cowbeamX==false) {
    fill(255, 0, 0);
  }

  //IS BEAM ON?
  if (spacePressed==true) {
    //Is cow slightly to left of beam? Yes -> Move right
    if (cowX>shipX-10 && cowX<=shipX+20 && cowcangoright==true) {
      cowSpeed=.5;
      cowX=cowX+cowSpeed;
      cowbeamX=true;
      //Is cow on the right? Yes -> Move left
    } else if (cowX+45>=shipX+65 && cowX+45<shipX+90 && cowcangoleft==true) { 
      cowSpeed=.5;
      cowX=cowX-cowSpeed;
      cowbeamX=true;
    } else

      cowbeamX=false;
    cowbeamY=false;

    //Y
    if (cowX>shipX-10 && cowX<=shipX+20) {
      cowbeamY=true;
    } else if (cowX+45>=shipX+65 && cowX+45<shipX+90) {
      cowbeamY=true;
    }
  } else {

    cowbeamY=false;
    cowbeamX=false;
  }

  //Is cow being beamed and not too high? Yes -> Decrease Y (rise)
  if (cowbeamY==true && cowY-45>=shipY+60) {

    cowY = cowY-.3;
  }
  //Is cow not being beamed and in the air? Yes -> Increase Y (fall)
  if (cowbeamY==false && cowbeamX==false && cowY<=cowGround) {
    cowY=cowY+gravity;
  }
}



//DRAW COW!
void drawcow() {
  //BODY
  noStroke();
  fill(cowColorR, cowColorG, cowColorB);
  rect(cowX, cowY-30, 45, 20);
  //LEGS, left to right
  rect(cowX, cowY-10, 5, 10);
  rect(cowX+10, cowY-10, 5, 10);
  rect(cowX+35, cowY-10, 5, 10);
  rect(cowX+45, cowY-10, 5, 10);
  //HEAD
  rect(cowX+30, cowY-40, 20, 20);
  //SPOT on back
  fill(0, 0, 0, cowSpotAlpha);
  ellipseMode(CORNER);
  arc(cowX+5, cowY-40, 20, 20, 0, PI); 
  //NOSE
  fill(234, 156, 156); //PINK
  rect(cowX+35, cowY-30, 15, 10);
  //NOSTRILS
  fill(196, 129, 129); //DARK PINK
  ellipse(cowX+40, cowY-28, 2, 5);
  ellipse(cowX+45, cowY-28, 2, 5);
  //HORNS
  fill(133);
  rect(cowX+27, cowY-45, 3, 8);
  rect(cowX+47, cowY-45, 3, 5);
  //EYES
  stroke(0);
  strokeWeight(2);
  point(cowX+35, cowY-35); //left
  point(cowX+40, cowY-34); //right
}

//KILL COW - When cow goes inside the grinder, draw guts.
void killcow() {
  if (cowX>=221 && cowX+50<=279 && cowY>320) {
    drawguts();
  }
}

//DRAW GUTS - Spits guts out of the grinder and changes cow color to red
void drawguts() {
  float randomred = random(120, 220);
  float randombloodX = random(340, 400);
  float randombloodY = random(325, 350);
  //PILE O' GUTS  
  noStroke();
  fill(randomred, 0, 0);
  rect(randombloodX, randombloodY, 5, 5);


  text("OWIE, PLEASE PULL ME OUT!", 200, 220);

  cowColorR=255;
  cowColorG=0;
  cowColorB=0;
  cowSpotAlpha=0;
}

//DRAW BEAM! while spacebar is being pressed
void drawbeam() {
  if (spacePressed==true) {
    noStroke();
    fill(0, 255, 0, 30);
    rect(shipX+20, shipY+10, 40, 260);
  }
}

//GRINDER
void drawgrinder() {
  strokeWeight(1);
  stroke(150);
  fill(201);
  rect(220, 260, 60, 20); //top
  rect(220, 280, 100, 60); //base
  rect(320, 320, 20, 20); //out
  fill(0);
  text("COWS GO HERE", 222, 292);
}

//CONTROLS
void keyPressed() {
  //A KEYPRESS
  if (shipX>0) {
    if (key=='a' || key=='A') {
      aPressed=true;
    }
  }
  //D KEYPRESS
  if (shipX+80<400) {
    if (key=='d' || key=='D') {
      dPressed=true;
    }
  }
  //SPACEBAR KEYPRESS
  if (shipX+80<400) {
    if (key==' ') {
      spacePressed=true;
    }
  }
}

void keyReleased() {
  //A KEY RELEASE
  if (key=='a' || key=='A') {
    aPressed=false;
  }
  //D KEY RELEASE
  if (key=='d' || key=='D') {
    dPressed=false;
  }
  //SPACEBAR KEY RELEASE
  if (key==' ') {
    spacePressed=false;
  }
}




//SKY GRADIENT
void horizonfadealphas() {
  fill(255, 255, 255, 10);
  rect(0, 325, width, 15); //horizon
  fill(255, 255, 255, 10);
  rect(0, 295, width, 45);
  fill(255, 255, 255, 10);
  rect(0, 255, width, 85);
  fill(255, 255, 255, 10);
  rect(0, 205, width, 135); //sky
}



