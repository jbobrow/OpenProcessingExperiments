
int radius = 300;

float [] xPos = new float [360];
float [] yPos = new float [360];
float [] xPosD = new float [360];
float [] yPosD = new float [360];


void setup() {     
  size(800, 800);   
  smooth();         
  background(0);    

  for (int i = 0; i < 360; i++) {
    int deg = i * 10;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }

  for (int i = 0; i < 360; i++) {
    int deg = i * int(random(0,360));
    float angle = radians(deg);
    xPosD[i] = cos(angle) * radius;
    yPosD[i] = sin(angle) * radius;
  }
}

void draw() {     
  background(0);

  translate(width/2, height/2);

  for (int i = 0; i < 360; i++) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(xPos[i], yPos[i], xPosD[i], yPosD[i]);
    noLoop();
  }
}


