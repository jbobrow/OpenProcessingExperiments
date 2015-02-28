
int slices = 20;
float pie_slice = TWO_PI/slices;

float x, y, szX, szY, theta;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  strokeCap(SQUARE);
}

void draw() {
  background(#ffffff);
  fill(#202020);
  float edge = height/10;

  createRing(0,PI);
  createRing(1,0);

  theta += 0.0523;

  //if (frameCount%4==0 && frameCount<121) saveFrame("image-###.gif");
}

void createRing(int opt, float offSet) {
  for (int i=0; i<slices; i++) { 
    y = map(sin(offSet+theta+(TWO_PI/slices)*i*5), -1, 1, -10, -180);
    szX = 200; 
    szY = height/2+y ;
    if (opt==1) {
      fill((360/slices)*i, 90, 90);
    } 
    else {
      fill(#404040);
    }
    noStroke();
    pushMatrix();
    translate(width/2, height/2);   
    rotate(i*pie_slice);
    arc(0, y, szX, szY, (PI*1.5)-(pie_slice/2), (PI*1.5)+(pie_slice/2));
    popMatrix();
  }
}

