
int card = 1;

boolean move = true;
float y = 0;

int b1x = 458;
int b1y = 400;
int b1w = 150;
int b1h = 50;

int b2x = 50;
int b2y = 240;
int b2w = 150;
int b2h = 200;

int b3x = 440;
int b3y = 240;
int b3w = 150;
int b3h = 200;

int ex = 90;
int ey = 200;
int ew = 100;
int eh = 100;

int wx = 90;
int wy = 300;
int ww = 100;
int wh = 100;

int shakeX = 0;
int shakeY = 0;
int dd = 0;



PFont font;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PShape aa;

PShape ninjastar;
PImage shell;
PImage slj;
PImage walken;
PImage tp;
PImage pokeball;
PImage bbeye;


void setup(){
  size(640, 480);
  smooth();

  font = loadFont("Circoex-48.vlw");

  // Page Images
  a = loadImage("P1-2.png");
  b = loadImage("seamaiden.png");
  c = loadImage("ninjabride.png");
  d = loadImage("B1.png");
  e = loadImage("B1.1.png");
  f = loadImage("B1.2.png");
  g = loadImage("B1.3.png");
  h = loadImage("A2.png");
  i = loadImage("A2.1.png");
  j = loadImage("chuck.png");
  k = loadImage("P2.png");
  l = loadImage("B2.png");
  m = loadImage("walken.png");
  n = loadImage("chuck.png");
  aa = loadShape("globe.svg");


  // Decisions & Cursors
  slj = loadImage("A2.3.png");
  walken = loadImage("A2.4.png");
  tp = loadImage("A2.5.png");
  pokeball = loadImage("pokeball.png");
  bbeye = loadImage("eye.png");

  ninjastar = loadShape("ninjastar.svg");
  textFont(font);
  
}


void draw(){
  if (card == 1){
    cardOne ();
  }
  else if (card == 2){
    cardTwo();
  }
  else if (card == 3){
    cardThree();
  }
  else if (card == 4){
    cardFour();
  }
  else if (card == 5){
    cardFive();
  }
  else if (card == 6){
    cardSix();
  }
  else if (card == 7){
    cardSeven();
  }
  else if (card == 8){
    cardEight();
  }
  else if (card == 9){
    cardNine();
  }
  else if (card == 10){
    cardTen();
  }
  else if (card == 11){
    cardEleven();
  }
  else if (card == 12){
    cardTwelve();
  }
  else if (card == 13){
    cardThirteen();    

  }
  println(card);
}


// Mouse Events

void mousePressed() {
  if (card == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true){
      card = 2;
    }
  }
  if (card == 2){
    if (overButton(b2x, b2y, b2w, b2h) == true){
      card = 4;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true){
      card = 3;
    }
  }
  if (card == 3){
    if (overButton(b2x, b2y, b2w, b2h) == true){
      card = 5;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true){
      card = 7;
    }   

  }
  if (card == 4) {
    if (overButton(ex, ey, ew, eh) == true){
      card = 6;
    }
    else if (overButton(wx, wy, ww, wh) == true){
      card = 9;
    }
  }
  if (card == 5){
    if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 9;
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true){
      card = 6;
    }
  }
  if (card == 6){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 12;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true){
      card = 13;
    }
    else if (overButton(b1x, b1y, b1w, b1h) == true){
      card = 9;
    }
  }

  if (card == 7){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 12;
    }
    else if(overButton(b3x, b3y, b3w, b3h) ==true){
      card = 8;
    }

  }
  if (card == 8){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 10;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 11;
    }
  }
  if (card == 9){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }
  if (card == 10){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }
  if (card == 11){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }
  if (card == 12){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 10;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 1;
    }
  }
  if (card == 13){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 10;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 1;

    }

  }
}

//BUTTON BOOLEAN


boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && move) {
    move = false;
    return true;
  }
  else {
    return false;
  }
}

// Mouse Events 2

void mouseReleased(){
  move = true;
}


// CARD 1 Hey Bluebeard

void cardOne(){

  image(a, 0, 0);
  textSize(28);
  fill(0);
  text("So You Think You Can Be a Pirate With Cpt. Bluebeard... ", 50, 420);

  fill(255);
  textSize(20);
  shape(ninjastar, 440, 230);


}

// CARD 2 Bride Choice

void cardTwo(){
  image(a, 0, 0);

  textSize(38);
  fill(0);
  text("Bluebeard needs a fair bride", 50, 50);
  textSize(28);
  text("Who would make the better bride?", 50, 100);
  textSize(20);

  image(c, 60, 150);
  image(b, 450, 150);
  text("A Ninja, his sworn enemy", 50, 450); // CARD 4
  text("A Sea Maiden of Mercantile Class", 430, 450); // CARD 3



}

// CARD 3 Sea Maiden Decision

void cardThree(){
  background(255);
  image(d, 0, 0);
  image(b, 140, 110);
 
  textSize(38);
  pushMatrix();
  fill(random(0, 255), 232, 64, 200);
  text("Bluebeard asks her if she would join him on his", 50, 50);
  text("plundering of the sea...", 50, 100);
  text("What should you do?", 50, 150);

  text("Plunder!", 100, 370); // CARD 5
  text("Become WASPs", 450, 370); // CARD 7
  popMatrix();


}

// CARD 4 Ninja Bride Deciscion

void cardFour(){
  image(h, 0, 0);
  textSize(28);
  text("Lives on Ninja Pirate Island the most intellectually, geo-", 50, 35);
  text("graphically, and spasmatically advanced country in the universe.", 50, 70);
  textSize(20);
  fill(0);
  text("Must a Prodigal Heir come next?", 100, 130);

  text("Born", 110, 270); // CARD 6
  text("Become DINKs", 110, 390); // CARD 9

}

// CARD 5 Plunder Decision

void cardFive(){
  background(255);
  image(e, 0, 0);
  textSize(38);
colorMode(HSB, 100);
  fill(239, 68, 37);
  text("Bluebeard gives", 380, 150);
  text("her a key to un-", 380, 200);
  text("lock her chastity?", 380, 250);
  textSize(22);
colorMode(HSB, 360);
fill(0, 100, 100);
  text("Other: D-I-V-O-R-C-E", 380, 300); // CARD 9
  text("Unlock?", 100, 390); // CARD 6
}

// CARD 6 Prodigal son is Bourne

void cardSix(){
  background(255);

  image(i, 160, 120);
  textSize(28);
  fill(0);
  text("Jason Bourne, a rare Ninja Pirate hybrid is borne from the marriage.", 50, 30);
  textSize(20);
  text("He must be trained but by whom?", 10, 60);

  image(walken, 400, 20);
  image(slj, 35, 280);
  image(tp, 440, 300);

  text("Christopher Walken", 460, 300); // CARD 12
  text("Samuel L. Jackson", 60, 300); // CARD 13
  text("WeHo couple, Timon and Pumbaa", 460, 450); // CARD 14

}

// CARD 7 Becoming a WASP decision

void cardSeven(){
  image(f, 0, 0);
  textSize(28);
  fill(0);
  text("Bluebeard drops his maiden off at Samurai Cowboy Island,", 30, 35);
  text("the most intellectually, geographically, and spas-", 30, 70);
  text("-matically advanced country in the universe.",30, 105);
  textSize(20);
  text("Yet the enemy of Ninja Pirate Island. Chuck seeks an adversary.", 240, 180);

  text("Find him one", 60, 350); // CARD 12
  text("Bluebeard becomes the adversary", 420, 350); // CARD 8

}
// CARD 8 Bluebeard chooses to not find Chuck an adversary

void cardEight(){

  background(255);
  image(g, 1, 1);
  textSize(38);
  text("Bluebeard must battle for his maiden's life.", 50, 50);
  text("All is fair in love and war?", 50, 100);

  text("Battle", 60, 350); // CARD 10
  text("BIG EPIC FAIL", 450, 350); // CARD 11


}



// CARD 9 Ending 1

void cardNine(){
  pushMatrix();
  colorMode(HSB, 100);
  background(random(0, 255), 232, 64, 200);
  popMatrix();
  
  textSize(28);
  text("Global warming occurs due to a severe decrease in pirates", 50, 200); 
  textSize(28);
  
  shape(aa, 150, 100);

  text("Restart?", 440, 420); // CARD 1
}

// CARD 10 Ending 2

void cardTen(){
  pushMatrix();
  colorMode(HSB, 100);
  background(random(0, 360), 232, 64, 200);
  popMatrix();
  
  fill(0);
  textSize(28);
  text("Chuck Norris causes the earth to explode because no one ever defeats", 20, 120);
  textSize(32);
  text("Chuck", 20, 160);
   
// exploding parts or something  
//  pushMatrix();
//  translate(x, y);
//  rotate(radians(frameCount));
//  scale (.5);
//  image (a, 0, 0);
//  popMatrix();
//   
//   pushMatrix();
//  translate(x1, y1);
//  rotate(radians(frameCount));
//  scale (.5);
//  image (b, 0, 0);
//  popMatrix();
//   
//    pushMatrix();
//  translate(x2, y2);
//  rotate(radians(frameCount));
// scale (.5);
//  image (d, 0, 0);
//  popMatrix();
//   
//   pushMatrix();
//  translate(x3, y3);
//  rotate(radians(frameCount));
//  scale (.5);
//  image (e, 0, 0);
//  popMatrix();

 text("Restart?", 450, 410); // CARD 1
   
}

// CARD 11 Ending 3

void cardEleven(){
  pushMatrix();
  colorMode(HSB, 100);
  background(random(0, 360), 232, 64, 200);
  popMatrix();
  image(l, 310, 220);
  textSize(28);
  text("The universe turns into a bowl of porridge because of the", 30, 120);
  text("infinite amount of raw power", 30, 155);

  text("Restart?", 450, 410); // CARD 1
}

// CARD 12 Plot twist galore

void cardTwelve(){
  background(255);
  pushMatrix();
  image(pokeball, 50, 40);
  popMatrix();
  image(n, 150, 40);
  textSize(25);
  text("The one known as Bourne has succeeded the pokemon level of Chuck Norris.", 20, 50);
  text("Do Bourne and Chuck battle?", 270, 120);



  textSize(20);
  text("Battle", 70, 320); // CARD 10
  text("BIG EPIC FAIL", 70, 350); // CARD 1
}

//CARD 13, Bourne chose Christopher Walken as his trainer

void cardThirteen(){
  pushMatrix();
  colorMode(HSB, 100);
  background(random(0,360), 358, 88, 93);
  frameRate(5);
  popMatrix();



  textSize(28);

  text("Bourne wields the Walken death stare that no Ninja Pirate hybrid", 30, 150);
  text("can withstand.", 30, 188);
  fill(0);
  textSize(28);
  text("Proceed to battle", 30, 230);
  text("with an equal such as", 30, 262);
  text("Chuck Norris?", 30, 294);
  textSize(18);

  text("Battle", 100, 410); // CARD 10
  text("Restart?", 450, 410); // CARD 1
  
   y = y + 2;
   if(y > height+300) {
     y = 0;
   }
  
   pushMatrix();
        translate(150, y-200);
        rotate(radians(frameCount*10));
        image(m, 50, 40);
      popMatrix();

}








