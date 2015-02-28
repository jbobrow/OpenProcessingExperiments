
//Jason Fitzgerald
//cloud balancer
//Math programming and art
//Spring CCA
//Midterm project
//based on physics demo from class. I've implimented user controlled wind directions.
//use WASD to shoot wind at the cloud to keep it balanced in mid air
//much thanks to "learning processing" by Daniel Shiffman.
//I need to sleep or I'm going to die.


float vy = .01; //velocity y
float vx = .01;//velocity x
float x,y;
float i,j; //for drop location variables
float friction = -.8;
float frictionX = .1;
float gravity = .1;//gravity
float fanX, fanY;



void setup() {
  size(500,700,JAVA2D);
  colorMode(HSB,360,100,100,100);
  noCursor();
  fanX = 400;
  fanY = 300;
  frameRate(30);

  i = width/2;
  j = 0;

  smooth();
}
void draw() {
  background(200,18,100,50);
  //mouseChecks();//I think I fianlly figured out how to isolate specific functions in the draw loop
  bubbleFunctions();
  bubblePhysics();
  fan();
}


//bubble physics
void bubblePhysics() {
  vy += gravity;
  //vx += -.09;//wind
  i += vx;
  j += vy;

  //if(j > height) {///I want it to reset if it falls off bottom of screen
  //  j = height;
  ///  vy *= friction;
//  }
  if(j < 0) {
    j = 0;
    vy *= friction;
  }

  if(i > width) {
    i = width;
    vx = -vx;
  }
  if(i < 0) {
    i = 0;
    vx = -vx;
  }
} 
void bubbleFunctions() {



  fill(186,0,100,random(50,100));
  strokeWeight(1);
  stroke(255,random(0,25),100,100);
  //filter(BLUR,3);///slows it down hardcore
  ellipse(i,j,95,50);
  fill(186,0,100,random(50,100));
  ellipse(i+30,j-20,80,45);
  fill(186,0,100,random(50,100));
  ellipse(i-25,j-25,85,45);
  fill(186,0,100,random(50,100));
  ellipse(i+5,j-42,48,32);
  fill(186,0,100,random(50,100));
  ellipse(i+35,j+7,48,32);
  fill(186,0,100,random(50,100));
  ellipse(i-35,j-7,48,32);
  //fan
  //draw fan 
  fill (360, 227, 169);
  ellipse(mouseX,mouseY, random(5,20),random(5,20));
}
void fan() {
  if (keyPressed) {
    if (key == 'W'||key == 'w') {
      vy += -.3;
    }

    if (key == 'S'||key == 's') {
      vy += +.3;
    }
    if (key == 'A'||key == 'a') {
      vx += -.1;
    }
    if (key == 'D'||key == 'd') {
      vx += +.1;
    }
  }
}







