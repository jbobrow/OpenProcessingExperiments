
PImage map;
PImage catONE;
PImage catTWO;
PImage catTHREE;
PImage catFOUR;
PImage catFIVE;
PImage catSIX;
PImage catSEVEN;
PImage catEIGHT;
PImage catNINE;
PImage catTEN;
PImage usa;
PImage china;
PImage russia;
PImage brazil;
PImage france;
PImage italy;
PImage uk;
PImage ukraine;
PImage japan;
PImage germany;
PFont font;

void setup() {
  size (900, 800);
  background (255);
  PImage img;
  map = loadImage("map1.jpg");
  catONE = loadImage("1.jpg");
  catTWO = loadImage("2.jpg");
  catTHREE = loadImage("3.jpg");
  catFOUR = loadImage("4.jpg");
  catFIVE = loadImage("5.jpg");
  catSIX = loadImage("6.jpg");
  catSEVEN = loadImage("7.jpg");
  catEIGHT = loadImage("8.jpg");
  catNINE = loadImage("9.jpg");
  catTEN = loadImage("10.jpg");
  brazil = loadImage("brazil.jpg");
  france = loadImage("france.jpg");
  germany = loadImage("germany.jpg");
  italy = loadImage("italy.jpg");
  japan = loadImage("japan.jpg");
  russia = loadImage("russia.jpg");
  uk = loadImage("uk.jpg");
  ukraine = loadImage("ukraine.jpg");
  usa = loadImage("usa.jpg");
  china = loadImage("china.jpg");

}



void draw() {

  image(map, 0, 25);





  if (dist(mouseX, mouseY, 209, 336) < 11) {

    image(catONE, 250, 600);

    image(usa, 450, 620);
  }

  if (dist(mouseX, mouseY, 316, 469) < 6) {

    image(catTWO, 250, 600);

    image(brazil, 450, 620);
  }



  if (dist(mouseX, mouseY, 441, 284) < 6) {

    image(catTHREE, 250, 600);

    image(uk, 450, 620);
  }

  if (dist(mouseX, mouseY, 449, 307) < 6) {

    image(catFOUR, 250, 600);

    image(france, 450, 620);
  }

  if (dist(mouseX, mouseY, 469, 289) < 6) {

    image(catFIVE, 250, 600);

    image(germany, 450, 620);
  }

  if (dist(mouseX, mouseY, 475, 322) < 6) {

    image(catTEN, 250, 600);

    image(italy, 450, 620);
  }

  if (dist(mouseX, mouseY, 520, 299) < 6) {

    image(catSEVEN, 250, 600);

    image(ukraine, 450, 620);
  }

  if (dist(mouseX, mouseY, 700, 341) < 10) {

    image(catEIGHT, 250, 600);

    image(china, 450, 620);
  }

  if (dist(mouseX, mouseY, 703, 243) < 6) {

    image(catNINE, 250, 600);

    image(russia, 450, 620);
  }

  if (dist(mouseX, mouseY, 783, 339) < 6) {

    image(catSIX, 250, 600);

    image(japan, 450, 620);
  }
}


