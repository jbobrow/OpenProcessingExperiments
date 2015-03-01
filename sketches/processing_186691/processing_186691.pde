
PImage bg1;
PImage bg2;
PImage spr1;
PImage spr2;
PImage terrain;
PImage terrainSnow;
PImage neu1;
PImage neu2;
int x;


void setup() {
  size(250, 250);  
  bg1 = loadImage("fondo.jpg"); //....................Carrega Imgs
  bg2 = loadImage("fondo.png");
  spr1 = loadImage("sprite1.png");
  spr2 = loadImage("sprite2.png");
  terrain = loadImage("terrain.png");
  terrainSnow = loadImage("terrainSnow.png");
  neu1 = loadImage("neu1.png");
  neu2 = loadImage("neu2.png");
}

void draw() {
  int h = hour(); // ...........................................Cel
  float hmap = map(h, 0, 23, 0, 950);
  image(bg1, -hmap, 0);

  int m = minute(); //....................................Something

  int s = second(); //......................................Terrain
  int mes = month();
  float smap = map(s, 0, 59, 0, 950);
  if ((mes == 12) || (mes <= 2)) {
    image(terrainSnow, -smap, 0);//.......Easter Egg Neu
  } else {
    image(terrain, -smap, 0);
  }

  int mes = month();//......................................Parallax
  float smap = map(s, 0, 59, 0, 950);
  if ((mes == 12) || (mes <= 2)) {
    image(terrainSnow, -smap/3, 0);//.....Easter Egg Neu
  } else {
    image(terrain, -smap/3, 0);
  }

  int s = second(); //................................Sprite Camina
  if ((s & 1) == 0) {
    image(spr1, width/3, 170);
  } else {
    image(spr2, width/3, 170);
  }

  int mes = month();//...........................Parallax 1r nivell
  float smap = map(s, 0, 59, 0, 950);
  if ((mes == 12) || (mes <= 2)) {
    image(terrainSnow, -smap-30, 60);//.....Easter Egg Neu
  } else {
    image(terrain, -smap-30, 60);
  }

  if ((mes == 12) || (mes <= 2)) {//..............Easter Egg Neu II
    if ((s & 1) == 0) {
      image(neu1, 0, 0);
    } else {
      image(neu2, 0, 0);
    }
  }

  int h = hour(); //.....................................Llum Solar
  image(bg2, -hmap, 0);

  noFill(); //.................................................Marc
  stroke(255);
  strokeWeight(10);
  rect(0, 0, width, height);
}



