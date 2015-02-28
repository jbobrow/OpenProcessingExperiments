
import ddf.minim.*;

Minim minim;
AudioPlayer bgmusic;
AudioSample xlife;
AudioSample mousetouch;
AudioSample keypressed;

// Bouncing Ball
float x = 100, y = 100; // ball
float p2x = 100; // top paddle
float xSpeed = random(4, 6); 
float ySpeed = random(4, 6); 
int life = 10, score = 0;
PImage img;
PImage img2;

void setup() {
  size(600, 600); 
  noStroke(); 
  noCursor();
  img = loadImage("bg.jpg");
  
  //bg
  img2 = createImage(480, 480, ARGB);
  for(int i = 0; i < img2.pixels.length; i++) {
    float a = map(i, 0, img2.pixels.length, 255, 0);
    img2.pixels[i] = color(200, 200, 200, a); 
}
   minim = new Minim(this);
   bgmusic = minim.loadFile("Sequence 01.mp3");
   xlife = minim.loadSample("colt45.wav");
   mousetouch = minim.loadSample("beep02.wav");
   keypressed = minim.loadSample("hit01.wav");
   bgmusic.loop();
}
  
void draw() {
    
  fill(0,64);
  rect(0,0,width,height);
  
  tint(200,200);
  image(img, 60,60,480,480);
  image(img2, 60, 60);  fill(164,360,60);
  ellipse(x, y, 20, 20); 
  
  x = x + xSpeed; 
  y = y + ySpeed;
  // bounce of the left/right wall
  if (x >= width-5 || x <= 5) {
    xSpeed = -xSpeed;
  } 
  // bounce of the top/bottom wall
  if (y >= height-5 || y <= 5) {
    ySpeed = -ySpeed;
  }
  
  // Instruction
  textSize(16);
  fill(255,255,255,250);
  text("Instruction: 2 hands' game:", 80, 260);
  text("The top & bottom paddles are controlled by keypressed", 80, 280);
  text("Pressing 'Left' or 'right' on keyboard to move keypressed", 80, 300);
  text("The left & right paddles are controlled by mouse", 80, 320);
  text("20 scores add,When ball touch keypressed paddles", 80, 340);
  text("10 scores add,When ball touch mouse-controlled paddles", 80, 360);
  
  textSize(30);
  fill(30,215,300);
  text("Welcome to play game!  ", 100, 470);
  
  
  //life & Score(1)
  textSize(30);
  fill(30,215,300);
  text("Life: "+life, 130, 160);
  text("Score: "+score, 130, 130);
  
  fill(320,159,82);
  rect((width-60), mouseY, 10, 100);
  if (x >= (width-60) && y > mouseY && y < (mouseY+100)) {
    mousetouch.trigger();
    xSpeed = -xSpeed;
    score = score+10;
  }
  
  rect(60, mouseY, 10, 100);
  if (x <= 60 && y > mouseY && y < (mouseY+100)) {
    mousetouch.trigger();
    xSpeed = -xSpeed;
    score = score+10;
  }
  
  rect(p2x, height-60, 100, 10);
    if (y >= height-60 && x > p2x && x < (p2x + 100)) {
      keypressed.trigger();
      ySpeed = -ySpeed;
      score = score+20;
    }
    
  rect(p2x, 60, 100, 10);
  if (y <= 60 && x > p2x && x < (p2x + 100)) {
      keypressed.trigger();
      ySpeed = -ySpeed;
      score = score+20;
    }
    
     // life & Score(2)
    if ((y<=5) || (y>=height-5)) {
      xlife.trigger();
      life = life-1;
    }
    
    if ((x<=5) || (x>=width-5)) {
      xlife.trigger();
      life = life-1;
    }
    
    if (life == 0) {
      life = life-1;
      noLoop();
      textSize(50);
      fill(255,255,0);
      text("'Game over'", 150, 220);
      textSize(30);
      text("'Press 'R' to restart the game!", 90, 430);
    }
}
void keyPressed() {
  println(keyCode);
  if (keyCode == 39) {
    p2x = p2x+(20*3);
  }
  else if (keyCode == 37) {
    p2x = p2x-(20*3);
  } 
}
void keyReleased() {
  if (key == 'r' || key =='R') {
    loop();
    x = 100;
    y = 100;
    p2x = 100;
    life = 10;
    score = 0;
  }
}


