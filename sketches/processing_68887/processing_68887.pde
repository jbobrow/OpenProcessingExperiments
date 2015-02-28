
PImage img1;
PImage img2;
float r;
float g;
float b;
float a;
int rad = 30;                            
int numBalls = 30;                       
float[] xpos = new float[numBalls];     
float[] ypos = new float[numBalls];      
float[] velX = new float [numBalls];     
float[] velY = new float [numBalls];     


void setup() {
  size(800, 800);
  img1 = loadImage("heart.png");
  img2 = loadImage("heart2.png");
  smooth();
  
   for (int i = 0; i < numBalls; i++){
    xpos[i]= random(rad, width-rad);
    ypos[i]= random(rad, height-rad);  
    velX[i] = random(5,40);
    velY[i] = random(3,60);
}
}



//------------------------------
void draw() {
  background(0);
  
  smooth();
  for (int i = 1; i < width; i++) {
    drawCircle(width/2, height/2, i * i, color(r, g, b));
    r = random(255);
    g = random(5);
    b = random(255);
  }
  
  checkMouse();
  
  for(int i = 0; i < numBalls; i++){
    fill(250, 5, 5);
    ellipseMode(CENTER);
    noStroke();
    ellipse(xpos[i], ypos[i], rad, rad);
    xpos[i] += velX[i];
    ypos[i] += velY[i];
    
    if(xpos[i] <= rad || xpos[i] > width-rad){
      velX[i] *= -1;
    }
    if(ypos[i] <= rad || ypos[i] > height-rad){
      velY[i] *= -1;

    }
    
  }
}
//------------------------------
void drawCircle(float circX, float circY, int diameter, color c) {
  noFill();   
  
  stroke(c);
  ellipse(circX, circY, diameter, diameter);
}
//------------------------------
void checkMouse() {
  if (mousePressed) {

    if (mouseButton == LEFT) {
      println("LEFT CLICK");

      imageMode(CENTER);
      image(img1, 400, 400);
    }

    if (mouseButton == RIGHT) {
      println("RIGHT CLICK");

      imageMode(CENTER);
      image(img2, 400, 400);
    }
  }
}
 

