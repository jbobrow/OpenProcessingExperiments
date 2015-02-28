
int count;
int starSize;
int childNum;
float distance;

void setup() {

  size( 512, 512, OPENGL);
  sphereDetail(6);
  rectMode(CENTER);
  
  count = 0;
  starSize = 100;
  distance = 330;
  childNum = 2;
  
}

void draw() {

  randomSeed(0);
  
  background( 0, 32, 64 );

  noStroke();
  lights();
  ambientLight( 64, 64, 64 );
  

  pushMatrix();
  translate( width / 2, height / 2 );
  rotateX( count * 0.001 );
  rotateY( count * 0.002 );
  rotateZ( count * 0.003 );
  
  fill( random(128) + 127, random(128) + 127, random(128) + 127 );
  sphere(starSize);
  float posX = 0;
  float posY = 0;
  drawSatellite( posX, posY, starSize/4, mouseY/10+240, floor(mouseX/100)+6, childNum, count );
  
  popMatrix();

  count++;
  
}

void drawSatellite( float centerX, float centerY, float starSize, float distance, int num, int level, float angle ) {


  fill( random(128)+127, random(128)+127, random(128)+127 );
  
  for(int i=0; i<num; i++) {
  
    float posX = centerX + ( distance * cos( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
    float posY = centerY + ( distance * sin( 2 * PI * ( (float)i / (float)num ) + ( angle / 360.0 ) ) );
  
    pushMatrix();

    translate(posX,  posY);
    scale( random(0.7) + 0.3);

    sphere(starSize);
   
    popMatrix();
  
    if (level >= 1) {
      drawSatellite(posX, posY, starSize/4, distance/3, num, level-1, angle*3);
    }
    
  }

    
}

