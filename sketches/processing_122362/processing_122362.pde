
int timer;
int m = 0;

int y;
int[][] multi = new int[][]{
{268, 10, 268, 10, 268, 10},
{268,270,268,270,268,270},
{268,270,217,216,211,193},
{204,171,156,175,146,173},
{146,173,123,173,128,145},
{128,145,128,141,123,137},
{120,134,117,130,123,122},
{126,122,115,121,117,108},
{122,102,116,109,120,104},
{122,102,123,100,123,97},
{123,95,117,94,111,88},
{111,88,102,81,114,71},
{114,71,123,58,127,53},
{130,49,137,46,137,36},
{137,27,137,29,137,26},
{137,26,136,19,134,16},
{131,12,131,13,131,10}};

void setup() {
  size(300, 300);
  frameRate(60);
  background(255);
  smooth();
  noCursor();
 
}

void draw() {
  background(255);
  translate(30,-12);
  scale(1.1, 1.1);
  beginShape();
  pushMatrix();
  
  noFill();
  stroke(0);
   
  strokeWeight(2);  
  beginShape();
  vertex(131,10);
  for ( y =0; y < m; y++){
    bezierVertex(multi[y][0],multi[y][1],multi[y][2],multi[y][3],multi[y][4],multi[y][5]);
  }
  endShape();
  popMatrix();
}


void mouseMoved(){
  if (m < 17){
  m++;
  } else {
    
  }
}
 
