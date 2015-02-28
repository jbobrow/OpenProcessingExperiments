
int radius = 300;
float [] xPos = new float [360];
float [] yPos = new float [360];

void setup() {    
  size(800, 800);
  background(0);
  smooth();

  for (int i = 0; i < 360; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
}

void draw() {  
  translate(width/2, height/2);
  int random1 = int(random(359));
  int random2 = int(random(359));

  for (int i = 0; i < 360; i++) {
    stroke(random(255), random(255), random(255));
    line(xPos[random1], yPos[random1], xPos[random2], yPos[random2]);
  }
}



