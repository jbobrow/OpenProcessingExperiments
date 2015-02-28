
float hexSize = 25.0; // 15.0 - 40.0 (length of one hex side)
float margin =25.0; // 10.0 - 50.0 (minimum gap between hexes and edge of display)
float speed = 0.2; // 0.0 - 0.5 (the speed at which the perlin noise "goes by")
float noiseScale = 0.08; // 0.03 - 0.15 (the amount of perlin noisiness (or smoothness if you prefer))
float scaling = 3.0;

int cntW, cntH; //counts of displayed hexes (width and height)
float borderX, borderY; //size of gap between hexes and edge of display
float counter = 0.0; //simple counter for perlin noise

hexDef hd = new hexDef(hexSize); //figures and stores the hex dimensions
hexagon[][] hexes; //the displayed hexes

void setup() {
  size(800,600);
  smooth();
  noStroke();
  
  //figure out hex counts and border sizes
  cntW = int((width - 2*margin - hd.ss) / (hd.side + hd.ss));
  cntH = int((height - 2*margin) / hd.ls - 1);
  borderX = (width - cntW*(hd.side + hd.ss) - hd.ss) / 2.0;
  borderY = (height - (cntH + 1)*hd.ls) / 2.0;
  
  //setup hexes
  hexes = new hexagon[cntW][cntH];
  for(int y = 0; y < cntH; y++)
    for(int x = y%2; x < cntW; x+=2)
      hexes[x][y] = new hexagon(x, y + 1);
}

void draw() {
  //main draw loop
  background(0);
  counter += speed;
  for(int y=0; y<cntH; y++)
    for(int x=y%2; x<cntW; x+=2)
      hexes[x][y].show();
}

class hexDef {
  float side, ss, ls, h, w, halfH, halfW, halfSide, offset, offsetBal;
  hexDef(float hexSide) {
    side = hexSide; //length of one hex side (in pixels)
    //if you picture each hex nestled in a rectangle of the same height and width, there would be 
    //four right triangles *outside* the hex. I use the 30° angle (PI/6 radians) of those triangles 
    //to figure up the lengths of the triangle's sides (thank you again, Pythagoras).
    ss = sin(PI/6)*side; //length of short side of triangle
    ls = cos(PI/6)*side; //length of long side of triangle
    h = ls*2.0; //total height of hex
    w = ss*2.0 + side; //total width of hex
    halfH = ls; //half of the hex's height (for drawing each hex from its center)
    halfW = w/2.0; //half of the hex's width (for drawing each hex from its center)
    halfSide = side/2.0; //half of one side (for drawing each hex from its center)
    offset = side * scaling; // maximum perlin offset 
    offsetBal = offset/2.0; // offest balance - to keep the hex nicely centered
  }
}

class hexagon {
  PVector pos, sPos;  
  hexagon(float x, float y) {
    //I use PVectors to hold the real coordinates and screen coordinates of the hex,  but I never got
    //around to actually using them as vectors.
    pos = new PVector(x, y); 
    sPos = new PVector(pos.x*(hd.side + hd.ss) + hd.ss + hd.halfSide + borderX, pos.y*(hd.ls) + borderY);
  }
  
  void show() {
    float c = noise(pos.x*noiseScale, (pos.y+counter)*noiseScale); //get this hex's perlin noise value
    fill(c*255); //c is always somewhere between 0 and 1, so we just multiply it by 255 for the grayscale
    pushMatrix();
      translate(sPos.x, sPos.y - c*hd.offset + hd.offsetBal); //translate to the hex's center
      beginShape();
      vertex(-hd.halfW, 0); //center left
      vertex(-hd.halfSide, -hd.halfH); //upper left
      vertex(hd.halfSide, -hd.halfH); //upper right
      vertex(hd.halfW, 0); //center right
      vertex(hd.halfSide, hd.halfH); //lower right
      vertex(-hd.halfSide, hd.halfH); //lower left
      endShape(CLOSE);
      fill(0);
    popMatrix();
  }
  
}

