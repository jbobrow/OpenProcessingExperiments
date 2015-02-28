
//*********************************** 12/12/2008 * Guigui 8^) ***
PGraphics etoile;
PFont Andal;
int grand_rayon, petit_rayon, branches;
//***************************************************************
void setup()
{
  size(600,600);
  smooth();
  Andal = loadFont("AndaleMono-90.vlw");
  textFont(Andal, 90);
  fill(255);
  textAlign(CENTER);
  grand_rayon = 300;
  petit_rayon = 75;
  branches = 150;
  etoile = createGraphics(600, 600, JAVA2D);
  etoile.beginDraw();
  etoile.smooth();
  etoile.noStroke();
  etoile.fill(255);
  etoile.endDraw();
}
//***************************************************************
void draw()
{
  background(0);
  text("a<"+grand_rayon+">z",300,240);
  text("q<"+petit_rayon+">s",300,330);
  text("w<"+branches+">x",300,420);
  etoile.beginDraw();
  etoile.background(0);
  etoile.beginShape();
  for (int i = 0; i < branches; i = i+1) {
    etoile.vertex(
    300+sin(2*PI/branches*i)*grand_rayon
      ,
    300+cos(2*PI/branches*i)*grand_rayon
      );
    etoile.vertex(
    300+sin((2*PI/branches)/2+2*PI/branches*i)*petit_rayon
      ,
    300+cos((2*PI/branches)/2+2*PI/branches*i)*petit_rayon
      );
  }
  etoile.endShape(CLOSE);
  etoile.endDraw();
  blend(etoile,0, 0, 600, 600, 0, 0, 600, 600, DIFFERENCE);
}
//***************************************************************
void keyPressed() {
  switch(key) {
  case 'a': 
    grand_rayon = grand_rayon-1;
    break;
  case 'z': 
    grand_rayon = grand_rayon+1;
    break;
  case 'q': 
    petit_rayon = petit_rayon-1;
    break;
  case 's': 
    petit_rayon = petit_rayon+1;
    break;
  case 'w': 
    branches = max(branches-1, 2);
    break;
  case 'x': 
    branches = branches+1;
    break;
  default:
    break;
  }
}




