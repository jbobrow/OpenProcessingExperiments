
int NbTiles = 20;
int s = 10; 
int tileSize = 2*s;

// Change to whatever color combinations you want
color c1 = color(238,124,35);
color c2 = color(251,195,10);

int lastCorner;
int lastRowCorner =0;
void setup()
{
  int W = NbTiles*tileSize;
  int H = NbTiles*tileSize;
  size(W,H);
  noLoop();
  lastCorner = lastRowCorner;
}

void draw()
{
  translate(s,s);
  pushMatrix();
  for (int j=1; j<=NbTiles; j++) {
     for (int i=0; i<NbTiles; i++) {
       
        if (i==0) {
          if (lastRowCorner==1)
            drawBlackCorner();
          else
            drawWhiteCorner();
          lastRowCorner = lastCorner;
        }
        else {
          if (lastCorner == 1)
            drawBlackCorner();
          else
            drawWhiteCorner();
        }
        translate(tileSize,0);
     }
     popMatrix();
     translate(0,tileSize);
     pushMatrix();
     
  }
}

void drawSquare()
{
  noFill();
  rectMode(CENTER);
  rect(0,0,tileSize,tileSize);
}

void drawWhiteCorner()
{
  lastCorner = 1;
  float r = random(-1,1);
  smooth();
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  if (r<0) {
    fill(c2);
    rect(0,0,tileSize,tileSize);
    fill(c1);
    arc(-s,-s,tileSize,tileSize,0,PI/2); // leftupper
    arc(s,s,tileSize,tileSize,PI,PI+PI/2); // rightbottom
  }
  else {
    fill(c1);
    rect(0,0,tileSize,tileSize);
    fill(c2);
    arc(s,-s,tileSize,tileSize,PI/2,PI);
    arc(-s,s,tileSize,tileSize,PI+PI/2,TWO_PI);
  }
}

void drawBlackCorner()
{
  lastCorner = 0;
  float r = random(-1,1);
  smooth();
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  if (r<0) {
    fill(c1);
    rect(0,0,tileSize,tileSize);
    fill(c2);
    arc(-s,-s,tileSize,tileSize,0,PI/2); // leftupper
    arc(s,s,tileSize,tileSize,PI,PI+PI/2); // rightbottom
  }
  else {
    fill(c2);
    rect(0,0,tileSize,tileSize);
    fill(c1);
    arc(s,-s,tileSize,tileSize,PI/2,PI);
    arc(-s,s,tileSize,tileSize,PI+PI/2,TWO_PI);
  }
}                                                                               
