
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

  fill( 0, 32, 64, 255);
  rect( 0, 0, width, height );

  noStroke();
  stroke(255,255,255,128);
  fill( 64, 192, 255 );
  
  float posX = width / 2;
  float posY = height / 2;
  ellipse( posX, posY, starSize, starSize );

  drawSatellite( posX, posY, starSize/4, mouseY/2, mouseX/40, childNum, count );
  
  textSize(20);
  text("move mouse", 10, 30);

  count++;
  
}

void drawSatellite(float centerX, float centerY, float starSize, float distance, int num, int level, float angle) {

  for(int i=0; i<num; i++) {
  
    float posX = centerX + ( distance * cos( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
    float posY = centerY + ( distance * sin( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
  
    line(centerX, centerY, posX, posY);
  
    if (level >= 1) {
      drawSatellite(posX, posY, starSize/2, distance/2, num, level-1, angle*3);
    }
    
    ellipse(posX, posY, starSize, starSize);
  }
    
}

void keyPressed() {
    if (key == CODED) {         // Ã£ï¿½Â³Ã£ï¿½Â¼Ã£ï¿½ï¿½Ã¥ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â¦Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â­Ã£ï¿½Â¼Ã£ï¿½ï¿½Ã¦ï¿½Â¼Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½
        if (keyCode == UP) {        // Ã£ï¿½Â­Ã£ï¿½Â¼Ã£ï¿½Â³Ã£ï¿½Â¼Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã¥ï¿½Â¤Ã¥Â®ï¿½
             starSize-=5;
        } else if (keyCode == DOWN) {
             starSize+=5;
        }
    }
}
