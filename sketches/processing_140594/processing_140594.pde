
int count;
int starSize;
int childNum;
float distance;

void setup() {

  size( 512, 512 );
  
  count = 0;
  starSize = 50;
  distance = 300;
  childNum = 2;
  
}

void draw() {

  fill( 0, 32, 64, 16);
  rect( 0, 0, width, height );

  noStroke();
  fill( 64, 192, 255 );
  
  float posX = width / 2;
  float posY = height / 2;
  ellipse( posX, posY, starSize, starSize );

  drawSatellite( posX, posY, starSize/4, mouseY/2, mouseX/40, childNum, count );

  count++;
  
}

void drawSatellite(float centerX, float centerY, float starSize, float distance, int num, int level, float angle) {

  for(int i=0; i<num; i++) {
  
    float posX = centerX + ( distance * cos( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
    float posY = centerY + ( distance * sin( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
  
    ellipse(posX, posY, starSize, starSize);
  
    if (level >= 1) {
      drawSatellite(posX, posY, starSize/4, distance/3, num, level-1, angle*3);
    }
    
  }
    
}

void keyPressed() {
    if (key == CODED) {         // コード化されているキーが押された
        if (keyCode == UP) {        // キーコードを判定
             starSize-=5;
        } else if (keyCode == DOWN) {
             starSize+=5;
        }
    }
}

