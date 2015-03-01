
int amount = 1000;
int[] x = new int [amount];
int[] y = new int [amount];
int[] z = new int [amount];

int xPos;
int yPos;
int cR;
int cG;
int cB;
float dotSize;
float bSize;


void setup() {
  boolean bG = true;
  size(1000, 1000, P3D);
  smooth();
  background(0);
  //noFill();
  stroke(cR, cG, cB);
  dotSize=2;
  strokeWeight(dotSize);
  //frameRate(24);
  for (int i = 0; i < amount; i ++) {
    x[i] = int(random(-500, 500));
    y[i] = int(random(-500, 500));
    z[i] = int(random(-500, 500));
  }

  cR = 255;
  cG = 255;
  cB = 255;
}

void draw() {
  boolean bG = false;
  
  //background(0);
  stroke(cR, cG, cB);
  strokeWeight(dotSize); 
  translate(width/2, height/2);
  rotateX(-yPos/80.0);
  rotateY(-xPos/100.0);
  fill(-cR,-cG,-cB);
  bSize = random(xPos,yPos)-500;
  sphere(bSize);
  //if(){}
  for (int i = 0; i < amount; i ++) {


    point(x[i], y[i], z[i]);
  }
  if (xPos >=500){
  dotSize = (xPos/100)+5;
  }
  if (xPos <=501){
  dotSize = (yPos/100)+5;
  }
  xPos = mouseX;
  yPos = mouseY;
  cR = mouseX/3;
  cG = mouseY-700;
  cB = cR + cG;
}

void mouseClicked(){
  
  background(0);
  //translate(random(0,500),random(500,0));
  //box(bSize);
}
