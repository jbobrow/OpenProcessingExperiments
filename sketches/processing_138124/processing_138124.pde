

//Ball catching game in Processing 2.0.1

//Global variable declaration
float x1Vel, x2Vel, x3Vel, x4Vel;   //x velocities
float y1Vel, y2Vel, y3Vel, y4Vel;   //y velocities
int x1Dir, x2Dir, x3Dir, x4Dir;     //x directions
int y1Dir, y2Dir, y3Dir, y4Dir;     //y directions
int ball1, ball2, ball3, ball4 = 0; // scores
int h = 800;                        //canvas height    
int w = 800;                        //canvas width
Boolean running = false;

//canvas color scheme
float hue = random(h);              
float sat = random(w);
float brt = random(100);
int cX1, cX2, cX3, cX4;
int cY1, cY2, cY3, cY4;

String message = ""; // Empty message

PImage hit;
PImage miss;
PImage design;

// Setup() code block
void setup(){
  size(800, 800);
  colorMode(HSB, h, w, 100);
  background(hue, sat, brt);
  cX1 = 390;
  cY1 = 390;
  cX2 = 410;
  cY2 = 390;
  cX3 = 390;
  cY3 = 410;
  cX4 = 410;
  cY4 = 410;
  message = "Press 'space bar' to start";
  hit = loadImage("hit.png");
  miss = loadImage("miss.png");
  design = loadImage("design.png");
}

//Draw() code block
void draw(){
  background(hue, sat, brt);
  textSize(20);
  textAlign(LEFT);
  text("Ball 1: "+ball1, 10, 20);
  textSize(20);
  textAlign(LEFT);
  text("Ball 2: "+ball2, 120, 20);
  textSize(20);
  textAlign(LEFT);
  text("Ball 3: "+ball3, 10, 40);
  textSize(20);
  textAlign(LEFT);
  text("Ball 4: "+ball4, 120, 40);
  textSize(20);
  textAlign(RIGHT);
  text("Press 'Q' to Quit", 700, 20);
  image(design, 350, 350, 100, 100); //Design at center
  textSize(32);
  textAlign(CENTER);
  text(message, 400, 200);
  
  ellipse(cX1, cY1, 20, 20);
//Ball 1 dynamics
  cX1 += x1Vel*x1Dir;
  cY1 += y1Vel*y1Dir;
  if (cX1 > w-10 || cX1<10){
    x1Dir = -x1Dir;
  }
  if (cY1 > h-10 || cY1 < 10){
    y1Dir = -y1Dir;
  }
  
  ellipse(cX2, cY2, 20, 20);
//Ball 2 dynamics
  cX2 += x2Vel*x2Dir;
  cY2 += y2Vel*y2Dir;
  if (cX2 > w-10 || cX2<10){
    x2Dir = -x2Dir;
  }
  if (cY2 > h-10 || cY2 < 10){
    y2Dir = -y2Dir;
  }
  
  ellipse(cX3, cY3, 20, 20);
//Ball 3 dynamics
  cX3 += x3Vel*x3Dir;
  cY3 += y3Vel*y3Dir;
  if (cX3 > w-10 || cX3<10){
    x3Dir = -x3Dir;
  }
  if (cY3 > h-10 || cY3 < 10){
    y3Dir = -y3Dir;
  }

  ellipse(cX4, cY4, 20, 20);
//Ball 4 dynamics
  cX4 += x4Vel*x4Dir;
  cY4 += y4Vel*y4Dir;
  if (cX4 > w-10 || cX4<10){
    x4Dir = -x4Dir;
  }
  if (cY4 > h-10 || cY4 < 10){
    y4Dir = -y4Dir;
  }
  
}

//Keypressed() code block
void keyPressed(){
  
  if (key == 'Q' || key == 'q'){
    message = "You score is: \nBall 1: " + ball1 + "  Ball 2: "+ ball2 + "\nBall 3: " + ball3 + "  Ball 4: " + ball4 + "\n \nGAME OVER";
    running = false;
  }
  if (key == ' '){
    running = true;
    message = ""; // Clear Message
    
// Ball 1 velocity
    x1Vel = int(random(-6, 6));
    y1Vel = int(random(-6, 6));
    if (x1Vel < 0){
      x1Dir = -1;
    }
    else{
      x1Dir = 1;
    }
    x1Vel = abs(x1Vel);
    if (y1Vel < 0){
      y1Dir = -1;
    }
    else{
      y1Dir = 1;
    }
    y1Vel = abs(y1Vel);
// Ball 2 velocity
    x2Vel = int(random(-5, 5));
    y2Vel = int(random(-5, 5));
    if (x2Vel < 0){
      x2Dir = -1;
    }
    else{
      x2Dir = 1;
    }
    x2Vel = abs(x2Vel);
    if (y2Vel < 0){
      y2Dir = -1;
    }
    else{
      y2Dir = 1;
    }
    y2Vel = abs(y2Vel);    
// Ball 3 velocity
    x3Vel = int(random(-4, 4));
    y3Vel = int(random(-4, 4));
    if (x3Vel < 0){
      x3Dir = -1;
    }
    else{
      x3Dir = 1;
    }
    x3Vel = abs(x3Vel);
    
    if (y3Vel < 0){
      y3Dir = -1;
    }
    else{
      y3Dir = 1;
    }
    y3Vel = abs(y3Vel);
// Ball 4 velocity
    x4Vel = int(random(-3, 3));
    y4Vel = int(random(-3, 3));
    if (x4Vel < 0){
      x4Dir = -1;
    }
    else{
      x4Dir = 1;
    }
    x4Vel = abs(x4Vel);
    if (y4Vel < 0){
      y4Dir = -1;
    }
    else{
      y4Dir = 1;
    }
    y4Vel = abs(y4Vel);
  }
}

//Mousepressed() code block
void mousePressed(){
if (running == true){  
//score updation 
  if (dist(mouseX, mouseY, cX1, cY1) <= 10){
    ball1 += 1;
    image(hit, cX1, cY1, 100, 100);
  }
  else if (dist(mouseX, mouseY, cX2, cY2) <= 10){
    ball2 += 1;
    image(hit, cX2, cY2, 100, 100);
  }
  else if (dist(mouseX, mouseY, cX3, cY3) <= 10){
    ball3 += 1;
    image(hit, cX3, cY3, 100, 100);
  }
  else if (dist(mouseX, mouseY, cX4, cY4) <= 10){
    ball4 += 1;
    image(hit, cX4, cY4, 100, 100);
  }  
  else{
    image(miss, mouseX+10, mouseY+10, 100, 100);
  }
} 
}


