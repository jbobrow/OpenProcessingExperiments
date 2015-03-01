
lPoints[] P = new Points[30];
int len = 5;
int win = 0;
PImage butterfly;
float butterflyX;
float butterflyY;
float butterflyWidth = 100;
float butterflyHeight = 10;
float mouseHeight = 100;
float mouseWidth = 10;
PImage city;   
PImage trainer1;
PImage cloud;
PImage ice;
float x;
float y;

float myhorizontalspeed = 0;
float myverticalspeed = 0;
//starts the score  at zero-----------------------------------
int score = 0;
Object[] ices = new Object[0];
boolean gameOver;
boolean isOverlappingRect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


//First trainer's starting position
float trainer1xstart = -20;
//First trainer's position on Y axis
float trainer1yposition = 325;
float trainer1SVision = trainer1yposition + 10;

void setup() {
  size(600,600);
  for (int i=0;i<P.length;i++) {
    P[i] = new Points();
    butterfly = loadImage("face.png");
    city = loadImage("1.jpg");
    trainer1 = loadImage("bad.png");   
    ice = loadImage("ice.png");
    cloud = loadImage("cloudsss.jpg");
     man = loadImage("face.png");
  }

}
 float timer = 0;
 
 
void draw() {
  
   if (win == 0){
    image(city,0,0,600,600);   
    //displays the score ---------------------------------
  textAlign(CORNER);
  textSize(26);
  fill(255,255,255);
  text("Score:" + score, 20, 40);
  
    trainer1xstart += 2;

     if (trainer1xstart > width)
    {
      butterflyX += myhorizontalspeed;
      butterflyY += myverticalspeed;
      trainer1xstart = -50;
    }
   }
   
    float trainer1FVision = trainer1xstart + 68;
    image(trainer1,trainer1xstart,trainer1yposition);
    
   
 
    
  P[0].move(mouseX, mouseY);
  P[0].display(#F20055);
  for (int i=1;i<P.length;i++) {
    float t = atan2(P[i].y-P[i-1].y, P[i].x-P[i-1].x);
    float sx = P[i-1].x + len*cos(t);
    float sy = P[i-1].y + len*sin(t);
    sx+=0.2; // for fluidic motion
    sy+=0.5; // for fluidic motion
    P[i].move(sx, sy);
    P[i].display(#C5F200);
    //stroke(0);
    //line(P[i].x, P[i].y, P[i-1].x, P[i-1].y);
    
    image(butterfly,mouseX-50, mouseY-50,100,100);

  }

if ((gameOver == false) && (frameCount % 100 == 0)) {
    Object ice = new Object();
    ices = (Object[]) append(ices, ice);
  }
 
  if ((gameOver == false) && (ices.length>10)) {
    ices = (Object[]) subset(ices, 1);
  }
 
  for (int i = 0; i<ices.length; i++) {
    ices[i].update();
  } 
  if (!gameOver) {
 
    for (int i = 0; i<ices.length; i++) {
      Object ice = ices[i];
 
      if ((ice.x >= 0) && (ice.x + ice.w <= width) && (ice.y == height)) {
        gameOver = true;
        ices = (Object[]) subset(ices, ices.length);
      }
    }
  }
  
  else if (gameOver == true) {
   
    // if it's game over then this message shows--------------------------------------
    image(cloud, 0, 0,600,600);
    textAlign(CENTER);
    textLeading(400);
    textSize(30);
    fill(255,255,255);
    text("SCORE:" + score, width/2, height/2-50);
 
    textSize(50);
    fill(90,24,134);
    text("GAME OVER", width/2, height/2-10);
 
    fill(255,255,255);
    textSize(30);
    fill (255,255,255);
    text("CLICK MOUSE TO PLAY AGAIN", width/2, height/2 +20);
  }
  //when falling pea hits the target, one piont is added and pea dissapears------------------------------------
for (int i = 0; i<ices.length; i++) {
    Object ice = ices[i];
 
    if ((ice.x >= butterflyX -300 && ice.x <=butterflyX + 300) && (ice.x + ice.w <= butterflyX + butterflyWidth) && (ice.y >= butterflyY - 300 && ice.y <= butterflyY +300)) {
      score++;

     // bonus.trigger();
      ices = (Object[]) subset(ices, 1);
    }
  }
 
 
  

}

//class for the falling objects-------------------------------------
class Object {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
 
  Object() {
    x = random(40, width - 80);
    y = -50;
    w = 40;
    h = 40;
    velX = 0;
    velY = 2;
  }
 
  void update() {
    x+=velX;
    y+=velY;
 
    image(ice, x, y, w, h );
  }
}

class Points {
  float x=0, y=0;
  void display(color c) {
    fill(255,142,28);
    noStroke();
    ellipse(x, y, 20, 20);
  }
  void move(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

// lets the user restart the game by calling setupGame()-----------------------------
 
void mousePressed() {
  //only lets the mouse click work once game is over
  if (gameOver) {
    //calls setup to restart the game
    setupGame();
   // go.trigger();
  }
}
//resets the game once mouse is pressed
void setupGame() {
  gameOver = false;
  score=0;
}
 
 


