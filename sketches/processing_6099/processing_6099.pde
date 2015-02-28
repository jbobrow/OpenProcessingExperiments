

//GOBI (assignment7)
//designed by Rue Song for Interactivity
//November 18, 2009

PShape gobivbody;
PShape gobivsoilcover;
PShape gobivleftleaf;
PShape gobivrightleaf;
PShape gobiveye;
PShape skyd;
PImage skyg;
Gobi g1;
Gobi g2;


void setup () {
  size(480,320);
  smooth();
  gobivbody = loadShape ("GobiVBody.svg");
  gobivsoilcover = loadShape ("GobiVSoilCover.svg");
  gobivleftleaf = loadShape ("GobiVLeftLeaf.svg");
  gobivrightleaf = loadShape ("GobiVRightLeaf.svg");
  gobiveye = loadShape ("GobiVEye.svg");
  skyd = loadShape ("backgroundSky.svg");
  skyg = loadImage ("gradientSky.png");
  g1 = new Gobi ();
  g2 = new Gobi ();

}

void draw () {
  background (50);
  sky ();
  fill (171, 255, 99);
  ellipse (width/2, 300, width + 100, 70);

  if (dist(g1.x, g1.y, g2.x, g2.y) < (75)) {
    g1.FireWork();
    g1.Move (0.1);
    g1.Display (0.9, 3, 1.4, 50, 255, 0, 0);
    g2.Move (0.1);
    g2.Display (0.7, 3, 0.75, 10, 0, 255, 0);
  }
  else {
    g1.FireWork();
    g1.Move(0.01);
    g1.Display(0.9, 0, 1.4, 10, 0, 255, 0);
    g2.Move (0.08);
    g2.Display(0.7, 0, 0.75, 100, 0, 0, 0);
  } 


}

void sky () {
  float skyRotate = map (mouseY, 0, height, 0, -PI);
  pushMatrix();
    translate (240, 420);
    rotate (skyRotate);
    image (skyg, -500, -500, 1000, 1000);
    shape (skyd, -500, -500, 1000, 1000);
  popMatrix();
}



