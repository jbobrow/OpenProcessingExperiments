
int num = 35;
float ball = 20;
float [] posX = new float [num];
float [] posY = new float [num];
float [] velX = new float [num];
float [] velY = new float [num];

float color1 = 255;
float color2 = 255;
float color3 = 255;

void setup () {
  size(800,600);
  //noSmooth();
  
  for (int i = 0; i<num; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random (-15, 15);
    velY[i] = random (-15, 15);
  }
}

void draw() {
  //background (255);
   noStroke();
  
  for (int i = 0; i<num; i++) {
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];
    fill(color1, color2, color3);
    ellipse(posX[i], posY[i], ball, ball);
    
    if ((posX[i] >= width - ball/2) || (posX[i] <= 0 + ball/2))  {
      velX[i] = -velX[i];
    }
    if ((posY[i] >= height - ball/2) || (posY[i] <= 0 + ball/2)) 
    {velY[i] = - velY[i];
    }
  }
}

void mousePressed()  {
  color1 = random(0,255);
  color2 = random (0,255);
  color3 = random (0,255);
  background(random(255), random(255), random(255));
  for(int i = 0; i<35; i++){
    posX[i] = mouseX;
    posY[i] = mouseY;
  }
}
  
