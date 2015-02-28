
int count;
int starSize;
int childNum;
int maxChildNum;
int maxLevel;
float distance;

class Node {

  float size;
  float x;
  float y;
  float z;
  Node[] child;

  Node(float _x, float _x, float _z, float _size, Node[] _child) {
    size = _size;
    x = _x;
    y = _y;
    z = _z;
    child = _child;
  }

}

void setup() {

  size( 512, 512 );
  frameRate(30);
  
  count = 0;
  starSize = 50;
  distance = 300;
  childNum = 2;
  
  
}

void draw() {

  randomSeed(0);

  fill( 0, 32, 64, 255);
  rect( 0, 0, width, height );

  noStroke();
  stroke(255, 64, 128,160);
  fill( 255, 224, 64 );
  
  float posX = width / 2;
  float posY = height / 2;

  drawSatellite( posX, posY, starSize/4, mouseY/2, mouseX/40, childNum, count );
  ellipse( posX, posY, starSize, starSize );
  
  textSize(20);
  text("move mouse", 10, 30);

  count++;
  
}

void drawSatellite(float centerX, float centerY, float starSize, float distance, int num, int level, float angle) {

  for(int i=0; i<num; i++) {
  
    float posX = centerX + ( (distance/2 + random(distance/2)) * cos( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
    float posY = centerY + ( (distance/2 + random(distance/2)) * sin( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
  
    line(centerX, centerY, posX, posY);

    if (level >= 1) {
      drawSatellite(posX, posY, starSize/3+random(starSize/3), (distance/5 + random(distance/5)), random(num-1), level-1, angle*3);
    }
    
    float tmpSize = starSize/2+random(starSize/2); 
    ellipse(posX, posY, tmpSize, tmpSize);
  }
    
}

void keyPressed() {
    if (key == CODED) {        
        if (keyCode == UP) {       
             starSize-=5;
        } else if (keyCode == DOWN) {
             starSize+=5;
        }
    }
}
