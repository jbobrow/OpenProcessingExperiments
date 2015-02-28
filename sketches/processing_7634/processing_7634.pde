
PImage ballImg;
Ball balls[];
int attractors[][];
boolean applyFilter;

void setup() {
  size(500,500);
  noSmooth();
  frameRate(10);
  imageMode(CENTER);
  background(255);
  
  applyFilter = true;
  
  ballImg = createAlphaBall(50);
  balls = new Ball[40];
  for(int i=0; i<balls.length; i++)
    balls[i] = new Ball();
  
  createAttractors();
}

void createAttractors() {
  attractors = new int[3][3];
  for(int i=0; i<attractors.length; i++) {
    attractors[i][0] = int(random(width / 4,width/2)); // x coordinate
    attractors[i][1] = int(random(height/4,3 * height / 4)); // y coordinate
    attractors[i][2] = 1; // attraction
  } 
}

void draw() {
  background(255);
  
  for(int i=0; i<balls.length; i++) {
    balls[i].update();
    balls[i].draw();
  }

  if(applyFilter)
    filter(THRESHOLD, 0.2);

//  filter(BLUR);

/*
  PImage img=get();
  img.resize(round(width/2),round(height/2));
  img.resize(width-2,height-2);
  image(img,width/2,height/2);
*/
}

void keyPressed() {
  applyFilter = !applyFilter;  
}

void mousePressed() {
  createAttractors();  
}

PImage createAlphaBall(int radius) {
  PImage img = createImage(radius*2, radius*2, ARGB);
  img.loadPixels();
  int rSqr = radius * radius;
  for(int i=0; i<=radius; i++) {
    for(int j=0; j<=radius; j++) {
      int dSqr = int(sq(radius - i) + sq(radius - j));
      int opacity = int(255 * (1 - dSqr / float(rSqr)));
      color pointColor = color(0f,0f,0f,opacity);

      img.pixels[i * img.width + j] = pointColor;
      img.pixels[(img.width - i -1) * img.width + j] = pointColor;
      img.pixels[i * img.width + (img.height - j - 1)] = pointColor;
      img.pixels[(img.width - i -1) * img.width + (img.height - j - 1)] = pointColor;
    }  
  }
  img.updatePixels();
  return img;
}

class Ball {
  float x, y;
  float speedX, speedY;

  Ball() {
    x = random(width / 2);
    y = random(height);
    speedX = speedY = 0;
  }  
  
  void update() {
    float xAccel = 0, yAccel = 0;
    for(int i=0; i<attractors.length; i++) {
      xAccel += constrain(attractors[i][2] / (attractors[i][0] - x) / 5f, -3, 3);
      yAccel += constrain(attractors[i][2] / (attractors[i][1] - y) / 5f, -3, 3);
    }
    
    speedX = constrain(speedX + xAccel, -3, 3);
    speedY = constrain(speedY + yAccel, -3, 3);
    
    x+= speedX;
    y+= speedY;
    
    float newX = constrain(x, 0, width / 2); if(newX != x) { speedX = 0; }
    float newY = constrain(y, 0, height);  if(newY != y) { speedY = 0; }
    
    x = newX;
    y = newY;
  }
  
  void draw() {
    image(ballImg,x,y);
    image(ballImg,width - x,y);
  }
}


