
int num = 360, niv = 50, fc;
PVector[] pos = new PVector[num];
PVector[] endPoints = new PVector[num];

void setup() {
  size(500, 500);
  background(20);
  noStroke();

  initPoints();
}

void draw() {
  background(20);

  for (int i=0; i<num; i++) {
    ellipse(pos[i].x, pos[i].y, 40, 40);
    pos[i].x = lerp(pos[i].x, endPoints[i].x, 0.025);
    pos[i].y = lerp(pos[i].y, endPoints[i].y, 0.025);
  } 
  
  //if (frameCount%4==0 && frameCount < 241) saveFrame("image-####.gif");
}

void initPoints() {

  float angle = 3*PI/2, radius = 200;
  float a1 = 0, centerX = 0, centerY = 0;

  for (int i=0; i<num; i++) {
    float x = width/2 + cos(angle)*radius;
    float y = height/2 + sin(angle)*radius;
    pos[i]= new PVector(x, y);
    angle += (TWO_PI/num);
    //ellipse(pos[i].x, pos[i].y, 5, 5);
  }

  for (int j=0; j<5; j++) {
    a1 = j*(TWO_PI/5);
    for (int i=0; i<(num/5); i++) {
      switch(j) {
      case 1:
        centerX = radius/2;
        centerY = - radius/2;
        break;
      case 2:
        centerX = radius/2;
        centerY = radius/2;
        break;
      case 3:
        centerX = - radius/2;
        centerY = radius/2;
        break;
      case 4:
        centerX = - radius/2;
        centerY = - radius/2;
        break;
      case 0:
        centerX = 0;
        centerY = 0;
        break;
      }
      float x = width/2 + centerX + cos(a1)*(radius/3);
      float y = height/2 + centerY + sin(a1)*(radius/3);
      endPoints[j*(num/5)+i] = new PVector(x, y);
      a1 += (TWO_PI/(num/5));
      //ellipse(endPoints[i].x, endPoints[i].y, 2, 2);
    }
  }
}

void mouseReleased() {
  initPoints();
}

