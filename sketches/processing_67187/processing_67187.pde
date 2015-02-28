
//int numBall = 30;

int value = 0;
int saltPepper = 200;

//float[] ballX = new float[numBall];
//float[] ballY = new float[numBall];

//float[] legX = new float[numBall];
//float[] legY = new float[numBall];

float[] saltX = new float[saltPepper];
float[] saltY = new float[saltPepper];

float[] pepperX = new float[saltPepper];
float[] pepperY = new float[saltPepper];

color[] callColor = new color[saltPepper];
float gravity;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  
  colorMode(HSB);
  gravity = .1;


  for (int i = 0; i < saltX.length; i ++) { //for (int i = 0; i < numBall; i ++)

     saltX[i] = 0;
     saltY[i] = 0;
    
     pepperX[i] = 0;
     pepperY[i] = 0;
    

    //legX[i] = random(5);
    //legY[i] = random(5);
    
  }
}

void draw() {

  PImage myImage = loadImage("stew.JPG"); 
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  color getColor = myImage.get(mouseX, mouseY);
  noStroke();
  
  for(int i =0; i < saltX.length; i++){
    
    saltX[i] += pepperX[i];
    saltY[i] += pepperY[i];
    
    pepperY[i] += gravity;
  }
    
  for(int i = 0; i < saltX.length; i++) {
    fill(value); //(callColor[i]);
    ellipse(saltX[i], saltY[i], 10, 10);
  }
}
  
void mouseReleased() {
  for(int i = 0; i < saltX.length; i++) {
    
    saltX[i] = mouseX;
    saltY[i] = mouseY;
    
    pepperX[i] = random(-2, 2);
    pepperY[i] = random(-7, -3);
    
    //callColor[i] = color(0, 0, 0, 50);
  }
}



/*
 fill(value);

  for (int i = 0; i < ballX.length; i ++) { //int i = 0; i < numBall; i ++)
    ellipse(ballX[i], ballY[i], i - 10, i - 10);
    float distance = dist(400, 400, mouseX, mouseY);

    ballX[i] = ballX[i] += legX[i];
    ballY[i] = ballY[i] += legY[i];

    if (ballX[i] >= width || ballX[i] <= 0) {
      legX[i] *= -1;
    }

    if (ballY[i] >= height || ballY[i] <= 0) {
      legY[i] *= -1;
    }
  }
}*/

void mousePressed() {
  if (value == 0) {
    value = 255;
  }
  else {
    value = 0;
  }
}


