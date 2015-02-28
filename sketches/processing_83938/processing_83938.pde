
//Arryas
DuckLine[] ducks = new DuckLine[0];
DuckLineLeft[] ducks2 = new DuckLineLeft[0];
Particle[] particles = new Particle[0];
//Ints
int score = 0;
int lives=3;
boolean GameOver = false;
//images
PImage duck;
PImage ducksmall;
PImage BG;
PImage BG2;

void setup() {
  size(1020, 720);
  smooth();
  //Images
   duck = loadImage ("duck.png");
   ducksmall = loadImage ("ducksmall.png");
    BG = loadImage ("BG.png");
   // BG2 = loadImage ("BG2.jpg");
}

void draw() {
  
  if (!GameOver) {
  //image(BG2, 0, 0);  
    background(0);
    //Particles
    while (particles.length>maxParticles) {
      particles = (Particle[]) subset(particles, 1);
    }
    for (int i=0; i<particles.length; i++) {  
      particles[i].update();
    }
    
   
    //Add a new duck 
    if (frameCount % 40 == 0) {
      DuckLine duck = new DuckLine();
      ducks = (DuckLine[]) append(ducks, duck);
    }
    //println("Frame Count " + (frameCount/2%40==0));
    // println(frameCount%5==5);





    if (frameCount%40==0) {
      DuckLineLeft duck2 = new DuckLineLeft();
      ducks2 = (DuckLineLeft[]) append(ducks2, duck2);
    }
    //Remove Duck after 30 have been created
    if (ducks.length>30) {
      ducks = (DuckLine[]) subset(ducks, 1);
      ducks2 = (DuckLineLeft[]) subset(ducks2, 1);
    }
    //Move Duck
    for (int i = 0; i<ducks.length; i++) {
      ducks[i].update();
      ducks2[i].update();
      }

     } 
  else {
    fill(255);
    textSize(26);
    text("GAME OVER", width/2-100, height/2); 
    text("Press any key to play again", width/2-100, height/2+100); 
    frameCount=0;
    if (keyPressed == true){
    reset();
    }
 
  }
  //Check if duck has left the stage
    for (int i = 0; i<ducks.length; i++) {
    DuckLine duck = ducks[i];
    if((duck.x<-20)&&(duck.x>-23)) {
     lives--;
    }
  }
  
  //Check if duck has left the stage
    for (int i = 0; i<ducks.length; i++) {
    DuckLineLeft duck2 = ducks2[i];
    if((duck2.x>width+duck2.w) && (duck2.x<width+duck2.w+3)) {
     lives--;
    }
  }
  
 


println(mouseX + "." +  mouseY);
/// Game Over   
  if(lives<0){
   GameOver =true; 
   lives=0;
  } 
  

   image(BG, 0, 0);  
     //Score 
      textSize(26);
      fill(255);
      stroke(0);
      rect(440,559,150,80);
    fill(0);
    text("Score:" + score, 457, 569+20);
    text("Lives:" + lives, 457, 600+20);
   
   
} // End of Draw

void mousePressed() {
  for (int i = 0; i<ducks.length; i++) {
    DuckLine duck = ducks[i];
    if ((mouseX>duck.x) && (mouseX<duck.x + duck.w) && (mouseY>duck.y) && (mouseY<duck.y+duck.h)) {
      duck.alive = false;
      score++;
      for (int ii = 0; ii<30; ii++) {
        Particle p = new Particle(mouseX, mouseY);
        p.yVel = random(-2, 2);
        p.xVel = random(-5, 5);
        p.gravity = 0.1;
        p.shrink = 0.94;
        particles = (Particle[]) append(particles, p );
      }
    }
  }
  for (int i = 0; i<ducks2.length; i++) {
    DuckLineLeft duck2 = ducks2[i];
    if ((mouseX>duck2.x) && (mouseX<duck2.x + duck2.w) && (mouseY>duck2.y) && (mouseY<duck2.y+duck2.h)) {
      duck2.alive = false;
       score++;
      for (int ii = 0; ii<30; ii++) {
        Particle p = new Particle(mouseX, mouseY);
        p.yVel = random(-2, 2);
        p.xVel = random(-5, 5);
        p.gravity = 0.1;
        p.shrink = 0.94;
        particles = (Particle[]) append(particles, p );
      }
    }
  }
}

class DuckLine {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float speed;
  boolean alive;
  DuckLine() {
    y = 200;
    w = 50;
    x = width+30;
    h = 50;
    velX = -3;
    velY = 0;
    alive = true;
    speed=1;
  } 
   void update() {
    x+=velX;
    y+=velY*speed;     
    if(alive) {
      fill(255, 0, 0);
      stroke(255);  
    } else {
      fill(0,0,0); 
      noStroke();
      velY-=1;
      velX=0;
      x=-1000;
     }
    
    //rect(x, y, w, h);
    image(ducksmall, x-55, y-20);
  }
}


class DuckLineLeft {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;
  DuckLineLeft() {
    y = 400;
    w = 80;
    x = 0-w-50;
    h = 80;
    velX = -3;
    velY = 0;
    alive = true;
  } 
   void update() {
    x-=velX;
    y+=velY;     
    if(alive) {
      fill(255, 0, 0);
      stroke(255);  
    } else {
      fill(0,0,0); 
      noStroke();
      velY+=1;
      velX=0;
      x=-1000;
     }
   // rect(x, y, w, h);
    image(duck, x-50, y-40);

  }
}



float maxParticles = 50;
class Particle {
   
  float x;
  float y;
  float xVel;
  float yVel;
  float particleSize;
  float opacity;
  float gravity;
  float fadeSpeed;
  float shrink;
   
  Particle(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xVel = random(-5,5);
    yVel = random(-5,5);
    particleSize = random(1,5);
    opacity = 255;
    gravity = 0;
    fadeSpeed = 1;
    shrink =2;
      
  }
   
  void update() {
    x+=xVel;
    y+=yVel;
    opacity*=fadeSpeed;
    yVel += gravity;
    particleSize*=shrink;
     
//noStroke();
    fill(255,255,0,opacity);
    ellipse(x, y, particleSize, particleSize);
  }
   
}

void reset(){
  lives =3;
  score=0;
  GameOver = false;
  ducks = (DuckLine[]) new DuckLine[0];
  ducks2 = (DuckLineLeft[]) new DuckLineLeft[0];
}



