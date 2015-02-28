
int count;
int branchSize;
int childNum;
float distance;


void setup() {

  size( 750, 750 );
  frameRate(30);
  
  count = 0;
  branchSize= 20;
  distance = 300;
  childNum = 6;  
  
}

void draw() {

  randomSeed(0);

  background( 0, 32, 80, 255);

  float posX = width / 2;
  float posY = height * 3 / 4;

  fill( 255, 224, 64 );
  drawTree( posX, posY, branchSize/2, mouseY/2, mouseX/50, childNum, -PI/2, PI);
  
  textSize(20);
  text("move mouse", 10, 30);

  count++;
  
}

void drawTree(float centerX, float centerY, float nodeSize, float distance, int num, int level, float angle, float angleWidth) {

  for(int i=0; i<num; i++) {
  
    float tmpAngle = angle - angleWidth/2 + (angleWidth * (float)i / (float)num) ;  
    float posX = centerX + ( (distance/4 + random(distance/2)) * cos( tmpAngle ) );
    float posY = centerY + ( (distance/4 + random(distance/2)) * sin( tmpAngle ) );
  
    stroke(255, 64, 128,160);
    strokeWeight(nodeSize);
    line(centerX, centerY, posX, posY);

    if (level >= 1) {
      drawTree(posX, posY, nodeSize/4+random(nodeSize/4), (distance/4 + random(distance/2)), random(num-1), level-1, tmpAngle , angleWidth/2);
    }
    
    noStroke();
    ellipse(posX, posY, 2, 2);
  }
    
}
