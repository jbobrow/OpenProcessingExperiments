
PShape gobibody, gobitop, gobileaf, gobisdist, clouds;
PFont verdana;
int numGobis = 10;
int currentGobi = 0;
float ground, bshift;
Gobi[] gobis = new Gobi[numGobis];

void setup() {
  size (480, 320);
  smooth ();
  noCursor();
  gobibody = loadShape("GobiVBody.svg");
  gobitop = loadShape("GobiVSoilCover.svg");
  gobileaf = loadShape("GobiVLeaf.svg");
  clouds = loadShape("Clouds.svg");
  verdana = loadFont("Verdana-8.vlw");
  textFont(verdana);
  textAlign (CENTER);
  for (int i = 0; i < gobis.length; i++) {
    gobis[i] = new Gobi();

  }
}

void draw() {
  bshift = map(mouseY,20,height,100,0);
  background(122,207,237);
  scene();
  sunseed();
  for (int i = 0; i < currentGobi; i++) {
    gobis[i].grow();
    gobis[i].hover();
    gobis[i].quiver();
    gobis[i].fly();
    gobis[i].follow(); 
  }
  conversation();
}

void mousePressed() {
  bshift = map(mouseY,0,height,100,0);
  ground = 260 + bshift/2;
  if (mouseY >= ground-20) {
    if (currentGobi < gobis.length) {
      gobis[currentGobi].plant(mouseX);
      currentGobi ++;
      if (currentGobi >= numGobis) {
        currentGobi = 0;
      }
    }
  }
}


void sunseed () {
  noStroke();
  fill(255,236,157,80);
  for (int s = (250-mouseY)/3; s > 0; s -= 10){
    ellipse(mouseX,mouseY,s+20,s+20);
  }
  if (mouseY >= 250) {
    shape (gobileaf,mouseX-20,mouseY, 10, 15);
    shape (gobileaf,mouseX+20,mouseY,-10,15);
    fill(0);
    text ("click to plant", mouseX, mouseY + 30);
  }
}


void scene () {
  shape (clouds,0,-150+bshift,width,height);
  strokeWeight(0.1);
  fill(180);
  ellipse(width/2, 355 + bshift/2, 1800, 200);
}







