
PImage space, space2, spaceShip, spaceShip2, spaceShip3, meteorite, gameOver;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
boolean game = true;
boolean started = false;
int score = 0;
int power = 3;
int i;
float x, y;
ArrayList<PImage> meteor = new ArrayList<PImage>();
void setup() {
  size(800, 500);
  noStroke();
  smooth();
  space = loadImage("space.jpg");
  space2 = loadImage("space2.jpg");
  spaceShip = loadImage("ship.png");
  spaceShip2 = loadImage("ship2.png");
  spaceShip3 = loadImage("ship3.png");
  meteorite = loadImage("meteor.png");
  gameOver = loadImage("end.jpg");
  meteor.add(meteorite);
}
void mousePressed() { 
  if (game == true && started == false) {
    started = true;
  }
  if ( game == false && started == true) {
    game = true;
    started = false;
  }
}

void draw() {

  if ( game == true && started == false) {
    background(space);
    textSize(40);
    fill(250);
    text("Never Stop Dodging ", width/4, height/5);
    textSize(40);
    fill(250);
    text("Click To Start Game ", width/4, height/2);
    score = 0;
  }
  if ( game == true && started == true && power > 0) {
    background(space2);
    if (power == 3) {
      image(spaceShip, mouseX-35, mouseY-40, 70, 80);
    }
    if (power == 2) {
      image(spaceShip2, mouseX-35, mouseY-40, 70, 80);
    }
    if (power == 1) {
      image(spaceShip3, mouseX-35, mouseY-40, 70, 80);
    }
    fill(255);
    textSize(15);
    text("Score: " + score, width/2, height/20);
    score +=1;
    fill(255);
    textSize(15);
    text("Power: " + power, width/30, height/20);
    if (score % 500 == 0 ) {
      meteor.add(meteorite);
    }
    for (i = 0; i < meteor.size() ; i++ ) {
      image(meteor.get(i), x, y, 20, 110);
      if (y < height) {
        y+=2;
      }
      else if (y >= height) {
        y = 0 ;
        x = (int)(random(800));
        image(meteor.get(i), x, y, 20, 110);
      }
    }
    if ((mouseY - (y+80) >= -80 && mouseY - (y+80) <= 80 )
      && (mouseX - x >= -20 && mouseX - x <= 50)) { // if the meteorite's x and y is inside of the space ship's x and y  then do the following:
      minim = new Minim(this);
      player = minim.loadFile("Explosion.wav");
      player.play();
      x = (int)(random(800 - 10));
      y = 0; // after hitted by meteorite reset the meteorite's x and y;
      power--;
    } 

    if (score >= 500 && score < 1000 ) {
      y = y+3;
    } 
    else if (score >= 1000 && score < 1500 ) {
      y = y+6;
    } 
    else if (score >= 1500 && score < 2000 ) {
      y = y+9;
    } 
    else if (score >= 2000 && score < 2500 ) {
      y = y+12;
    } 
    else if (score >= 2500 && score < 3000 ) {
      y = y+15;
    }
    else if (score >= 3000 && score < 3500 ) {
      y = y+20;
    }
    else if (score >= 3500 ) {
      y = y+25;
    }

    if ( power > 3 ) {// power won't able bigger than 3
      power = 3;
    }
    if ( power > 0) {
      if (score % 500 == 0 && power < 3) {
        power+=1;
      }
    }
    if ( power == 0) {
      game = false;
    }
  }
  if ( game == false && started == true ) {
    background(gameOver);
    textSize(40);
    fill(#FA0505);
    text("GameOver", width/2.7, height/8);
    textSize(40);
    fill(#FA0505);
    text("Score: " + score, width/2.5, height/3.5);
    textSize(40);
    fill(#FA0505);
    text("Click To ReStart Game ", width/4, height/2);
    power = 3;
  }
}


