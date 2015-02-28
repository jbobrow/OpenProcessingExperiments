
import ddf.minim.*;

Minim minim;
AudioSample bounce;

float x = 130, y = 180;
float xSpeed = random(3, 1);
float ySpeed = random(5, 1);
float a = 20, b = 150;
float aSpeed = random(3, 5);
float bSpeed = random(4, 6);
float c = 130, d = 180;
float cSpeed = random(7, 5);
float dSpeed = random(5, 8);
float e = 250, f = 300;
float eSpeed = random(4, 5);
float fSpeed = random(3, 6);

float g = 300, h = 400;
float gSpeed = random(5, 8);
float hSpeed = random(4, 9);

float lr = 0;
float lrSpeed = 3;
float ud = 0;
float udSpeed = 3;

PImage img;

void setup() {
  size(600, 600);
  noStroke();
  img = loadImage("rat.png");
  minim = new Minim(this);
  bounce = minim.loadSample("123.mp3");
  
}

void draw() {
  fill(0);
  rect(0, 0, 600, 600);
  fill(255);
  rect(100, 100, 400, 400);
  fill(0);
  rect(200, 200, 200, 200);
  fill(255);
  rect(250, 250, 100, 100);
  fill(0,255,0);
  textSize(20);
  text("GO HERE",254,310);


  //ball 1
  fill(255);
  ellipse(x, y, 50, 50);
  x = x + xSpeed;
  y = y + ySpeed;
  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  if (y > height-5 || y < 5) {
    ySpeed = -ySpeed;
  }
  //ball 2
  fill(0);
  ellipse(c, d, 10, 10);
  c = c + cSpeed;
  d = d + dSpeed;
  if (c > width-5 || c < 5) {
    cSpeed = -cSpeed;
  }
  if (d > height-5 || d < 5) {
    dSpeed = -dSpeed;
  }

  //ball 3
  fill(255);
  ellipse(a, b, 10, 10);
  a = a + aSpeed;
  b = b + bSpeed;
  if (a > width-5 || a < 5 )
  {
    aSpeed = -aSpeed; 
  }
  
  if (b > height-5 || b < 5 ) 
  {
    bSpeed = -bSpeed;
  }
  

  if ((b >= 100 && bSpeed>0) && a > 105 && a < 500)
  {
    bSpeed = -bSpeed;
  }
  
  if ((b >= 500 && bSpeed<0) && a > 105 && a < 500)
  {
    bSpeed = bSpeed;
  } 
  
  fill(0);
  ellipse(e, f, 10, 10);
  e = e + eSpeed;
  f = f + fSpeed;
  if (e > width-5 || e < 5 || e > 200 && e < 400 ) {
    eSpeed = -eSpeed;
  }
  if (f > height-5 || f < 5) {
    fSpeed = -fSpeed;
  }
  
  fill(0);
  ellipse(g, h, 20, 20);
  g = g + gSpeed;
  h = h + hSpeed;
  if (g > width-5 || g < 5 )
  {
    gSpeed = -gSpeed; 
  }
  
  if (h > height-5 || h < 5 ) 
  {
    hSpeed = -hSpeed;
  }
  
  

  //mouse move
  image(img, lr, ud, 50, 50);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      ud = ud - udSpeed;
      bounce.trigger();
    }
    if (key == 's' || key == 'S') {
      ud = ud + udSpeed;
      bounce.trigger();
    }
    if (key == 'a' || key == 'A') {
      lr = lr - lrSpeed;
      bounce.trigger();
    }
    if (key == 'd' || key == 'D') {
      lr = lr + lrSpeed;
      bounce.trigger();
    }
  }

  //mouse move to centre
  if (lr >= 260 && lr <= 350 && ud >=260 && ud <= 350)
  {
    textSize(32);
    fill(0, 0, 255);
    text("YOU WIN", 200, 200);
    text("PRESS R TO PLAY AGAIN", 200, 500);
    noLoop();
  }

  //ball hit the mouse
  if ( x <= lr+50 && x >= lr &&  y <= ud+50 && y >= ud||
    a <= lr+50 && a >= lr &&  b <= ud+50 && b >= ud||
    c <= lr+50 && c >= lr &&  d <= ud+50 && d >= ud||
    e <= lr+50 && e >= lr &&  f <= ud+50 && f >= ud
   
    )

  {
    textSize(32);
    fill(255, 0, 0);
    text("YOU LOSE", 200, 200);
    noLoop();
    text("PRESS R TO RESTART", 200, 500);
  }
}
// restart the game
void keyReleased() {
  if (key == 'r' || key == 'R') {
    loop();
    lr = 0;
    ud = 0;
    x=200;
    y=300;
  }
    
}


