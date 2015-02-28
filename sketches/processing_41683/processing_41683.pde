
PImage rock1, rock1uv;
PImage rock2, rock2uv;
PImage rock3, rock3uv;
PImage rock4, rock4uv;

void setup() {
  size(600, 600);
  rock1 = loadImage ("rock1s.png");
  rock1uv = loadImage ("rock1uvs.png");
  rock2 = loadImage ("rock2.png");
  rock2uv = loadImage ("rock2uv.png");
  rock3 = loadImage ("rock3.png");
  rock3uv = loadImage ("rock3uv.png");
  rock4 = loadImage ("rock4.png");
  rock4uv = loadImage ("rock4uv.png");
}

void draw() {
  int H = hour();
  int M = minute();
  int S = second();

  //-----------------meridian------------------------
  float shade = map (H, 0, 12, 0, 255);
  float shade2 = map (H, 12, 24, 255, 0);
  if (H < 12) {
    background (shade);
    tint (255, 255);
    image (rock4uv, 325, 370);
    tint (255, shade);
    image (rock4, 325, 370);
  } 
  else {
    background (shade2);
    tint (255, 255);
    image (rock4uv, 325, 370);
    tint (255, shade2);
    image (rock4, 325, 370);
  }


  //-------------------------seconds--------------------------------
  float opac1 = map ((millis()%1000), 0, 1000, 255, 0);
  fill (opac1);
  noStroke();
  rect (0, 0, 300, 300);

  tint (255, 255);
  image (rock2uv, 25, 45);
  tint (255, opac1);
  image (rock2, 25, 45);
  //-----------------------minutes---------------------------------
  float opac2 = map (S, 0, 60, 255, 0);
  fill (opac2);
  noStroke();
  rect (300, 0, 300, 300);

  tint (255, 255);
  image (rock1uv, 330, 75);
  tint (255, opac2);
  image (rock1, 330, 75);
  //-----------------------hours--------------------------------------
  float opac3 = map (M, 0, 60, 255, 0);
  fill (opac3);
  noStroke();
  rect (0, 300, 300, 300);

  tint (255, 255);
  image (rock3uv, 25, 375);
  tint (255, opac3);
  image (rock3, 25, 375);
}


