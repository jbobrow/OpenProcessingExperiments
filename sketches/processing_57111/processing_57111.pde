
// The Orb
// Steve Tiffany, 2012
// The blue guy was [originally] made with Blend Morph Coder:
// http://www.stevetiffany.com/blendmorphcoder.html

// Antony Bartlett, 2012 - Changed implementation to see if it's possible to do blend-morphs with SVG loaded into Geomerative.
 
int x, y, xspeed, yspeed;
boolean starting = true;
PGraphics orb;
 
void setup() {
  size(800,400);
  frameRate(30);
  smooth();
  x = 400; y = 500;
  xspeed = 0; yspeed = -4;
  int orbAlpha = 1;
  orb = createGraphics(190,190,JAVA2D);
  orb.beginDraw();
  orb.noStroke();
  for (int orbDiameter=190; orbDiameter>30; orbDiameter-=4) {
    orbAlpha+=2;
    orb.fill(255,int(orbAlpha));
    orb.ellipse(95,95,orbDiameter,orbDiameter);
  }
  orb.fill(255,240);
  orb.ellipse(95,95,30,30);
  orb.endDraw();

  // Get the Geomerative library ready for use, so it doesn't have to be done on-the-fly
  RG.init(this);
  
  // Pre-load our SVG files, so it doesn't have to be done on-the-fly
  getOrLoadShapePair("blueguy-top-left.svg");
  getOrLoadShape("blueguy-top-right.svg");
  getOrLoadShape("blueguy-bottom-left.svg");
}
 
void draw() {
  background(75);
  setXY();
  int trueX  =  x;
  x= trueX*2; if (x>width) {x=width;}

  float horizantalProportion = map(x, 0, width, 0, 1);
  float verticalProportion = map(y, 0, height, 0, 1);

  blendMorph(0, 0, "blueguy-top-left.svg", "blueguy-top-right.svg", horizantalProportion, "blueguy-bottom-left.svg", verticalProportion);

  translate(400,0);
  x = int(map(trueX,width/2,width,0,width));
  if (x<0) {x=0;}

  horizantalProportion = map(x, 0, width, 0, 1);
  verticalProportion = map(y, 0, height, 0, 1);

  blendMorph(0, 0, "blueguy-top-left.svg", "blueguy-top-right.svg", horizantalProportion, "blueguy-bottom-left.svg", verticalProportion);

  translate(-400,0);
  x=trueX;
  orb();
}
 
void setXY() {
  x = x + xspeed; y = y + yspeed;
  if (x >780) {xspeed = int(random(-2,-3));}
  if (y < 20)  {yspeed = int(random(2,3));}
  if (x < 20) {xspeed = int(random(2,3));}
  if (y > 380) {yspeed = int(random(-2,-3));}
  if (x>80 && x<720 && y>80 && y<320) {
    if (int(random(6))<1) {
      xspeed = xspeed + int(random(-3,3));
      while(xspeed==0) {
        xspeed = xspeed + int(random(-3,3));
      }
      yspeed = yspeed + int(random(-3,3));
      while(yspeed==0) {
        yspeed = yspeed + int(random(-3,3));
      }
    }
  }
}
 
void orb() {
  image(orb,x-95,y-95);
  fill(255,243,0,127); stroke(0,20);
  ellipse(x,y,random(28,38),random(28,38));
} 
 


