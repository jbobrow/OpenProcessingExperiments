
//Created By Will Dimmick, Fernando Feliciano

PImage Tank1;   //Tank1
PImage Tank2;  //Tank2
PImage Sand;
PImage Tree;
PImage Tree2;
PImage Player1;
PImage Player2;

PFont typeface1;

boolean Tank1Visible=true;
boolean BulletVisible=false;
boolean Bullet2Visible=false;
boolean Tank2Visible=true;

float posX=0;  //Movement Tank1
float posY=0;  //Movement Tank1
float posX2=0; //Movement Tank2
float posY2=0; //Movement Tank2
float Velocity=0; //Movement of bullet Tank1
float Velocity2=0; //Movement of bullet Tank2
float bx=0;
float by=0;
float bx2=0;
float by2=0;


void setup() {
  size(1000, 700);
  frameRate(60); 
  Tank1=loadImage("Tank Blue.png");
  Tank2=loadImage("Tank Red.png");
  Sand=loadImage("Sand.png");
  Tree=loadImage("Tree.png");
  Tree2=loadImage("Tree2.png");
  Player1=loadImage("Player 1.png");
  Player2=loadImage("Player 2.png");
  typeface1=loadFont("BerlinSansFB-Bold-16.vlw");
  textFont(typeface1);
}

void draw() {
  //Background images (non interactive)
  background(Sand);
  //Trees around the map
  image(Tree, 60, 20, 40, 40);
  image(Tree2, 100, 40, 30, 30);
  image(Tree, 80, 60, 20, 20);
  image(Tree2, 500, 80, 40, 40);
  image(Tree, 700, 120, 30, 30);
  image(Tree2, 300, 600, 20, 20);
  image(Tree2, 550, 600, 40, 40);
  image(Tree, 600, 680, 30, 30);
  image(Tree2, 450, 700, 20, 20);

  text("i for Instructios/Pause", 0, 675);

  if (BulletVisible) {
    bullet();
  }
  if (Bullet2Visible) {
    bullet2();
  }
  if (Tank1Visible) {
    image(Tank1, posX, 350+posY, 50, 50);
  }
  if (Tank2Visible) {
    image(Tank2, 950+posX2, 350+posY2, 50, 50);
  }


  if (BulletcollideTank2(posX+40+Velocity, 369+posY, 10, 950+posX2, 350+posY2, 50, 50)) {
    Tank2Visible=false;
    Bullet2Visible=false;
    image(Player1,0,0,1000,700);
  }

  if (BulletcollideTank1(posX2+950+Velocity2, 369+posY2, 10, posX, 350+posY, 35, 50)) {
    Tank1Visible=false;
    BulletVisible=false;
    image(Player2,0,0,1000,700);
  }



  //Top boundary
  if (posY<-350) {   //Left Tank Top Boundary
    posY=-350;
  }
  if (posY2<-350) {  //Right Tank Top Boundary
    posY2=-350;
  }
  //Bottom boundary
  if (posY>300) {    //Left Tank Bottom Boundary
    posY=300;
  }
  if (posY2>300) {   //Right Tank Bottom Boundary
    posY2=300;
  }
  if (Velocity>950) {
    Velocity=-500;
    BulletVisible=false;
  }
  if (Velocity2<-950) {
    Velocity2=200;
    Bullet2Visible=false;
  }
}

void bullet() {
  rect(bx+Velocity, by, 10, 5);
  Velocity=Velocity+random(10, 20);
}
void bullet2() {
  rect(bx2+Velocity2, by2, 10, 5);
  Velocity2=Velocity2-random(10, 20);
}

boolean BulletcollideTank2(float ballX, float ballY, float
ballSize, float paddleX, float paddleY, float paddleWidth, 
float paddleHeight) {
  float paddleMaxX = paddleX + paddleWidth;
  if (ballX < paddleMaxX) {
    float ballMaxX = ballX + ballSize;
    if (paddleX < ballMaxX) {
      float paddleMaxY = paddleY + paddleHeight;
      if (ballY < paddleMaxY) {
        return (paddleY < (ballY + ballSize));
      }
    }
  }
  return false;
}

boolean BulletcollideTank1(float ballX, float ballY, float
ballSize, float paddleX, float paddleY, float paddleWidth, 
float paddleHeight) {
  float paddleMaxX = paddleX + paddleWidth;
  if (ballX < paddleMaxX) {
    float ballMaxX = ballX + ballSize;
    if (paddleX < ballMaxX) {
      float paddleMaxY = paddleY + paddleHeight;
      if (ballY < paddleMaxY) {
        return (paddleY < (ballY + ballSize));
      }
    }
  }
  return false;
}

void keyPressed() {
  if (key=='i') {
    noLoop();
    text("game paused, p to start again", 425, 20);
    //instructions left tank
    text("Controls:", 55, 275);
    text("Up-w", 55, 290);
    text("Down-s", 55, 305);
    text("SPACEBAR-Fire", 55, 320);
    //instructions right tank
    text("Controls:", 835, 275);
    text("Up-UPARROW", 835, 290);
    text("Down-DOWNARROW", 835, 305);
    text("LEFTARROW-Fire", 835, 320);
    //Middle text
    text("Objective:", 450, 250);
    text("Destroy other tank", 450, 265);
    text("Tank Reload=4-5seconds",450,280);
    text("Happy Hunting", 450, 295);
    //Credits
    text("Created By:", 830, 660);
    text("Will Dimmick", 830, 675);
    text("Fernando Feliciano", 830, 690);
  }
  if (key=='p') {
    loop();
  }

  //Fire Tank 1
  if (key==' ') { 
    bx=posX+40;
    by=posY+369;
    BulletVisible=true;
  }
  //Fire Tank 2
  if (keyCode==LEFT) {
    bx2=posX2+950; 
    by2=posY2+369;
    Bullet2Visible=true;
  }
  //Movement Tank 1
  if (key=='w') {
    posY=posY-10;
  }
  if (key=='s') {
    posY=posY+10;
  }

  //Movement+fire TANK 2
  if (keyCode==UP) {
    posY2=posY2-10;
  }
  if (keyCode==DOWN) {
    posY2=posY2+10;
  }
}



