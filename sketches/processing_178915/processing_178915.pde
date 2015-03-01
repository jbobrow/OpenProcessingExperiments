
//人工降雪システム「コナユキ」

//降らす雪の数
int SNOW_NUM = 1500;

float V_X_MAX = 0.1;

float V_Y_MIN = 0.1;
float V_Y_MAX = 0.5;

float A_X_MAX = 0.01;
float A_Y_MAX = 0.01;

int DIAMETER_MIN = 1;
int DIAMETER_MAX = 3;

float yokoKaze = 0;
float YOKOKAZE_MAX = 10.0;

Snow[] mySnows;


void setup() {
  size(640, 480);
  
  smooth();
  noStroke();
  fill(255);
  
  mySnows = new Snow[SNOW_NUM];
  for (int snowIndex = 0; snowIndex < mySnows.length; snowIndex++) {
    mySnows[snowIndex] = new Snow();
  }
}


void draw() {
  background(0);
  
  for (Snow mySnow : mySnows) {
    mySnow.drawSnow();
  }
}


void keyPressed() {
  if (keyCode == LEFT) {
    yokoKaze -= 0.1;
    if (yokoKaze < -YOKOKAZE_MAX) {
      yokoKaze = -YOKOKAZE_MAX;
    }
  } else if (keyCode == RIGHT) {
    yokoKaze += 0.1;
    if (yokoKaze > YOKOKAZE_MAX) {
      yokoKaze = YOKOKAZE_MAX;
    }
  } else if (keyCode == DOWN) {
  }
}



class Snow
{
  float posX, posY;
  float vX, vY;
  float diameter;
  
  Snow() {
    posX = random(width);
    posY = random(height);
    
    vX = random(-V_X_MAX, V_X_MAX);
    vY = random(V_Y_MIN, V_Y_MAX);
    
    diameter = random(DIAMETER_MIN, DIAMETER_MAX);
  }
  
  void changePos() {
    vX += random(-A_X_MAX, A_X_MAX);
    if (vX > V_X_MAX) {
      vX = V_X_MAX;
    } else if (vX < -V_X_MAX) {
      vX = -V_X_MAX;
    }
    
    posX += vX + yokoKaze;
    if (posX + diameter * 0.5 < 0) {
      posX += width;
    } else if (posX - diameter * 0.5 > width) {
      posX -= width;
    }
    
    vY += random(-A_Y_MAX, A_Y_MAX);
    //あまりに落下速度が遅いときは補正
    if (vY < V_Y_MIN) {
      vY = V_Y_MIN;
    }
    
    posY += vY;    
    if (posY - diameter * 0.5 > height) {
      reset();
    }    
  }
  
  void drawSnow() {
    changePos();
    
    ellipse(posX, posY, diameter, diameter);
    
    if (posX - diameter * 0.5 < 0) {
      //左端にかかっているときの処理
      ellipse(posX + width, posY, diameter, diameter);
    } else if (posX + diameter * 0.5 > width) {
      //右端にかかっているときの処理
      ellipse(posX - width, posY, diameter, diameter);
    }
  }
  
  //位置・直径・速度を初期化
  void reset() {
    posX = random(width);
    posY = -DIAMETER_MAX * 0.5;
    diameter = random(DIAMETER_MIN, DIAMETER_MAX);
    
    vX = random(-V_X_MAX, V_X_MAX);
    vY = random(V_Y_MIN, V_Y_MAX);
  }
}


