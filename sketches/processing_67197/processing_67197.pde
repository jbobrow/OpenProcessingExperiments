
int tapon;
int speedY;
int numCircle = 20;
//int duckY;
//int speedDuck;

//float[] circleX = new float [numCircle];
float[] circleY = new float [numCircle];

float[] cspeedY = new float [numCircle];

int wY;

void setup() {
  
  size (500, 800);
  background (255);
  noStroke();
  smooth();

  tapon = 40; //radius of button on for tap
  speedY = 4;
  wY = 500;
  //duckY = height+100;
  //speedDuck = -2;
  
  
  noStroke();
    fill(50, 200, 250, 150);
    ellipse(400, wY, 50, 50);
    
    for(int i = 0; i < numCircle; i++){
      //circleX[i] = 0;
      circleY[i] = height + 150;
      cspeedY[i] = -0.5;
    }
  
  
}

void draw() {
  
  PImage myImage = loadImage("tap.gif");
  PImage myImage2 = loadImage("duck.gif");
  
  image(myImage, -10, 0);
  smooth();
  
  noStroke();
  strokeWeight(5);
  fill(255, 0, 0, 100);
  ellipse(195, 72, tapon*2, tapon*2);
  
  float distance = dist(195, 72, mouseX, mouseY);
  
  if(mousePressed == true && distance < tapon) {
    fill(50, 200, 250, 100);
    ellipse(400, wY, 50, 50);
    wY += speedY;
  }
  
  if(wY >= height) {
    for(int i = 0; i < numCircle; i ++) {
    fill(50, 200, 250, 50);
    ellipse(random(0, width), circleY[i], i*2, i*2);
    circleY[i] += cspeedY[i];
    
    
    if(circleY[i] <= 500) {
      cspeedY[i] = 0;
      wY=0;
      image(myImage2, 310, 270);
    smooth();
      
    } 
    
    
      
  }
    
  }


  }



