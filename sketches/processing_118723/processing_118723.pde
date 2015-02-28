
// Stephanie Cheung's Computing for the Arts with Processing Homework 9
// Code is copyright 2013 of Stephanie Cheung.
// Move the mouse in the X direction to change the speed of the waves
// Move the mouse in the Y direction to change the color of the middle boxes

int [] xpos;
int [] ypos;
int [] zpos;
float magic;
float controlX;
float controlY;

void setup() {
  size(800, 600, P3D);
  xpos = new int [100];
  ypos = new int [100];
  zpos = new int [100];
  initCoords ( xpos, 0, 1500 );
  initCoords ( ypos, 0, 1500 );
  initCoords ( zpos, -20000, 0);
  magic = .5;
  controlX = 1;
  controlY = 1;
  
}

void initCoords ( int [] pos, int min, int max){
 for ( int i = 0; i < pos.length ; i++ ) {
  pos [ i ] = i*(max/100);
 } 
}

void draw () {
  
  background(255);
  wave();
}

void wave(){
  for (int h = 0; h<99; h+=4){
    for (int i = 0; i<99; i+=4){
     magic += 0.0005*controlX; //magic basically makes everything move
     strokeWeight(2);
     fill(255-9*(i+(cos(magic)*6))*controlY, 6*(i+(cos(magic)*10))*controlY, 6*(i+(cos(magic)*10))*controlY);
     pushMatrix();
     translate(xpos[h]+i*5+cos(magic+i*.1)*10-500, ypos[i]+i*5+sin(magic+i*.1)*10+50, zpos[i]+i*5+sin(magic+i*.1)*30);
     rotate(magic*.15);
     box(10,10,10);
     popMatrix();
    }
  }
}

void mouseMoved(){
  controlX = map(mouseX,0, width,.4, 1);
  controlY = map(mouseY,0, width,.4, 1);
}


