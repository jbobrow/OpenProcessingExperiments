
final int MAX = 100;

float []pontsX = new float [MAX];
float []pontsY = new float [MAX];
float []deltaX = new float [MAX];
float []deltaY = new float [MAX];

float dia;


void setup() {
  size(400,400);

    for(int i = 0; i < MAX; i++) {
    pontsX[i] = random(0,width);
    pontsY[i] = random(0,height);
    deltaX[i] = random(.2,1);
    deltaY[i] = random(.2,.5);

  }

  dia = 2;
}

void draw() {

  drawPoints();
}


void drawPoints() {
  
  fill(255,100);
  rect(0,0,width,height);
    
  for(int i = 0; i < MAX; i++) {
    pontsX[i] = pontsX[i] += deltaX[i];
    pontsY[i] = pontsY[i] += deltaY[i];

    fill(0);
    noStroke();
    ellipse(pontsX[i],pontsY[i],dia,dia);

    if(i > 0) {
      stroke(200);
      line(pontsX[i-1], pontsY[i-1],pontsX[i],pontsY[i]);
    }
        
    if(pontsX[i] < 0 || pontsX[i] > width) {
        deltaX[i] = -deltaX[i];
    }
    if(pontsY[i] < 0 || pontsY[i] > height) {
        deltaY[i] = -deltaY[i];
    }
    
  }
}

