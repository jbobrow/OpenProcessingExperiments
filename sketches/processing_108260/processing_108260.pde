
int x,y,xD,yD,rxD,ryD; //x,y: location; xD,yD: xy direction of movement; rxD,ryD: direction of rotation
float rY,rX; //amount of rotation

void setup() {
   //frameRate(30);
   size(500,500,P3D);
   colorMode(RGB, 1);
   rX=0;
   rY=1.25;
   x=130;
   y=250;
   xD=yD=rxD=ryD=1;
}


void draw() {
  background(0,0,0);
  pushMatrix();
  translate(x, y, 0);
  if (mousePressed) {
    lights();
    directionalLight(0, 255, 0, 0, 1, 0);
    x=mouseX;
    y=mouseY;
  }
  rotateY(rY);
  rotateX(rX);
  //noStroke();
  box(100);
  popMatrix();
  
  if ((x==500-50)||(x<50)) {
    xD=-xD;
    rxD=-rxD;
  }
  if ((y==500-50)||(y<50)) {
    yD=-yD;
    ryD=-ryD;
  }
  rY=rY+(0.05*ryD);
  rX=rX+(0.05*rxD);
  x=x+xD;
  y=y+yD;
  
}
