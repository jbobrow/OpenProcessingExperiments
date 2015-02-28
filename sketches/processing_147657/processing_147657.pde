
String extension = ".png"; //change ".png" to "" if this is for processing.js
int physRate = 2; //number of times physics engine is calculated per frame
int MAXLEVEL = 20; //total number of levels
int level; //current level (or next level, during the victory screen)
int gameMode = 1; //0 for regular play; 1 for victory screen; -1 for defeat screen
PImage potential; //background image

float pongboost = 0.4f; //speed increase for when the ball bounces on the pong paddle.

boolean godMode = false;
boolean ballMode = false;

class ai{
  //The AI uses PD control (no I, since there can't possibly be a steady-state error)
  float vy, y, y_, kp, kd, g; //position, P control gain, and D control gain
  ai(){
    kp = 0.005; //initialize to default values
    kd = 0.00;
    vy = 0;
    y = height/2;
    y_ = 0;
    g = 0.97;
  }
  void calculate(ball a){
    vy=vy*g+(a.y-y)*kp + (a.y-y-y_)*kd; //Update the AI position with respect to the ball's position
    y_ = a.y-y;
    y+=vy*physRate*(1-a.x/width);
    if(y<0&&vy<0||y>height-1&&vy>0){
      vy=-vy;
    }
  }
}

class ball{
  float x, y, vx, vy, q, ax, ay; //x position; y position; velocities; and charge
  int r = 8;
  ball(){
    x = width/2;
    y = height/2;
    vx = 5;
    vy = 3;
    q = 1.5; //default charge
  }
  void physics(ai a, int playerY){
    //calculate acceleration due to V-field.
    ax = 0; ay = 0;
    int xmin, xmax, ymin, ymax;
    if((int)x<=0){xmin = 0; x = 0;}else{xmin = -1;}
    if((int)y<=0){ymin = 0; y = 0;}else{ymin = -1;}
    if((int)x>=width-1){xmax = 0; x = width-1;}else{xmax = 1;}
    if((int)y>=height-1){ymax = 0; y = height-1;}else{ymax = 1;}
    for(int i=xmin; i<=xmax; i++){
      for(int j=ymin; j<=ymax; j++){
        ax+=i*(colorToPotential(pixels[i+(int)x+width*(int)y]) - colorToPotential(pixels[(int)x+width*(int)y]));
        ay+=j*(colorToPotential(pixels[(int)x+width*(j+(int)y)]) - colorToPotential(pixels[(int)x+width*(int)y]));
      }
    }
    vx+=q*ax*physRate;
    vy+=q*ay*physRate;
    for(int k=0; k<physRate; k++){
      x+=vx;
      //Check for collision conditions
      if(x<35+r&&((x-vx)>=(35+r))&&vx<0&&abs(y-a.y)<25+r){ //collision with AI
        vx=-vx+pongboost; 
        x = 35+r;
        if((vy>0&&y>a.y)||(vy<0&&y<a.y)) vy+=0.05*(y-a.y);
      }else if(x<r){ //collision with left wall
        if(gameMode==0){
          levelPlus(1);
        }
        vx=-vx; x = r;
      }else if(x>width-35-r&&((x-vx)<=(width-35-r))&&vx>0&&abs(y-playerY)<30+r+abs(a.vy)){ //collision with player
        //notice it's <30+r and not <25+r; I'm giving a slight bonus to the human to avoid whiny people
        vx=-vx-pongboost; 
        x = width-35-r;
        if(abs(y-playerY)<30+r+abs(a.vy)){
          if((vy>0&&y>playerY)||(vy<0&&y<playerY)) vy+=0.05*(y-playerY);
        }
      }else if(x>width-r){ //collision with right wall
        if(gameMode==0) gameMode = -1;
        vx=-vx; x = width-r;
      }
      y+=vy;
      if(y<0+r){ //collision with ceiling
        vy=-vy; y = 0+r;
      }else if(y>height-r){ //collision with ground
        vy=-vy; y = height-r;
      }
    }
  }
}

ai A;
ball B;
void levelPlus(int mode){
  gameMode = mode;
  level++;
  potential = loadImage("data2/level"+level+extension,"png");
  setLevel();
}
  
void setLevel(){
  A.kd+=0.001;
  A.kp=A.kp*1.23;
  A.g-=0.024;
  A.y = height/2;
  A.y_ = 0;
  B = new ball();
  //B.q+=0.06*(level-1);
}

float colorToPotential(color p){
  return -0.01*(p%256 - p/(1<<16));
}

void setup()
{
  size( 800, 400 );
  frameRate( 30 );
  smooth();
  ellipseMode( CENTER );
  noStroke();
  A = new ai();
  B = new ball();
  potential = loadImage("data2/level1"+extension,"png");
  level = 1;
}

void draw()
{
  fill( 255 );  
  image(potential,0,0);
  loadPixels();
  A.calculate(B);
  int playerPosition;
  if(!godMode){
    playerPosition = mouseY;
    B.physics(A, playerPosition);
  }else{
    playerPosition = (int)((B.y-height/2)*pow((B.x+B.r)/(width-36),3)+height/2);
    textSize(20);
    text("God mode enabled.", 100, 340);
    textSize(10);
    text("It is mildly unlikely for God Mode to lose.",100, 360);
    B.physics(A, (int)(B.y+random(50)-25));
  }
  
  if(ballMode){
    B.x = mouseX;
    B.y = mouseY;
    B.vx = 0;
    B.vy = 0;
    textSize(20);
    text("Ball cursor mode enabled. ", 500, 340);
    textSize(10);
    text("Ball energy no longer conserved :(", 500, 360);
  }
    
  
  noStroke();
  rect( width - 35, playerPosition-25, 5, 50 );
  rect( 30, A.y - 25, 5, 50 );
  ellipse( B.x, B.y, B.r*2, B.r*2 );
  switch(gameMode){
    case 0:
      noCursor();
      break;
    case 1:
      fill(0,0,0,180);
      rect(0,0,width,height);
      cursor();
      fill(255);
      if(level!=1){
        textSize(30);
        if(!ballMode && !godMode){
          text("You Win!", 100, 100);
        }else{
          text("You Win.", 100, 100);
        }
      }else{
        textSize(30);
        text("Jordyn's Terrible Rendition of Pong.", 100, 100);
      }
        
      textSize(20);
      if(level<=MAXLEVEL){
        text("Get ready for Level "+level+"!", 100, 200);
        text("Click to continue!", 100, 300);
      }else{
        if(!ballMode && !godMode){
          text("You have beaten all the levels! Congratulations!", 100, 200);
        }else{
          text("You have beaten all the levels. Now go study Maxwell's Equations.", 100, 200);
        }
      }
      break;
    case 2:
      fill(0,0,0,180);
      rect(0,0,width,height);
      cursor();
      fill(255);
      textSize(30);
      text("You cheated and skipped a level.", 100, 100);
        
      textSize(20);
      if(level<=MAXLEVEL){
        text("You should really study instead. Anyway, get ready for Level "+level+"!", 100, 200);
        text("Click to continue!", 100, 300);
      }else{
        if(!ballMode && !godMode){
          text("You have beaten all the levels! Congratulations!", 100, 200);
        }else{
          text("You have beaten all the levels. What a nerd.", 100, 200);
        }
      }
      break;
      
    case -1:
      fill(0,0,0,180);
      rect(0,0,width,height);
      cursor();
      fill(255);
      textSize(30);
      text("Oh no!", 100, 100);
      textSize(20);
      text("Looks like you lost! Shame.", 100, 200);
      text("Click to continue!", 100, 300);
      break;
  }
}

void mouseClicked(){
  switch(gameMode){
    case 1:
    case 2:
      if(level>MAXLEVEL) break;
    case -1:
      setLevel();
      gameMode = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    if(level<=MAXLEVEL) levelPlus(2);
  }
  if (key == 'b') {
    ballMode = !ballMode;
  }
  if (key == 'g') {
    godMode = !godMode;
  }
}
