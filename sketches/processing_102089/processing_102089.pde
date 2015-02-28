
//Q8 Coded by Akihiko SHIRAI 2013/6/28
int xPos;   int yPos;
int speed;  int radius;
int ude;
int scene; //0:opening, 1:countdown...
PFont font;   
int cx, cy;
int alienTimer,startTime,userInput,alienResult;
//userInput = {0:non input, 1:left, 2: right}

void setup() {
  size(400,400);  smooth();
  cx = width/2;
  cy = height/2;
  xPos = cx;
  yPos = cy;
  speed = 1;
  radius = 20;
  ude = int(random(5));
  scene = 0;
  font = loadFont("Meiryo-48.vlw");
  textFont(font, 44);
  alienTimer = 0;
}
void draw() {
  switch(scene) {
    case 0: //zenkai no Q7
      background(255);
      move();
      if (doesCollide()) {
       bounce();
      }
      display();
      text("click to start", 50,height/2);
      if (mousePressed) {
        scene = 1;
        alienTimer = 0;
        startTime = millis();
        userInput = 0;
        ude = int(random(5));
      }
      break;
    case 1: //timer
      alienTimer = (int)(millis() - startTime)/1000;
      if (alienTimer>=10) {
        alienTimer=0;
        scene = 3;
      }
      background(map(alienTimer,0,10,0,255));
      text("push left or right", 10,height*2/3);
      if (alienTimer>5) {
        textFont(font, 32); fill(255,0,0);
        text("["+int(10-alienTimer)+"]", 175,height/5);
        textFont(font, 48);
      }
      if (keyPressed) {
        if (key == CODED) {
          if (keyCode == LEFT) {
            drawAlienEye(cx,cy, ude,1); 
            userInput = 1;
          } else if (keyCode == RIGHT) {
            drawAlienEye(cx,cy, ude,2); 
            userInput = 2;
          } 
        } else {
            text("something...",50,50);
        }
      } else {
         drawAlienEye(cx,cy, ude,0); 
      }
      showUserInput();
      break; // scene 2
    case 3: 
      //crazy animation and random
      background(255);
      alienResult = int(random(2)+1); // {1 or 2}
      aliens(alienResult);
      alienTimer++;
      showUserInput();
      if (alienTimer>100) {
        alienTimer=0;
        scene=4;
      }
     break;
    case 4:
      rectMode(CORNER); fill(255,alienTimer/10); noStroke();
      rect(0,0,width,height);
      alienTimer++;
      if (alienTimer>255) {
        alienTimer=0;
        scene=0;
      }
      if (alienResult==userInput) {
          fill(0,0,255);
          text("YOU WIN!",50,cy);
          fill(0,0,0);
     } else {
          fill(255,0,0);
          text("Lose... ",50,cy);
          fill(0,0,0);
     }
     break;
    
    default:
      background(255,0,0);
      text("undefined scene!",20,height/2);
      break;
  }
}

void showUserInput() {
      //show user input
      switch(userInput) {
        case 1:
          text("LEFT",50,150);
          break;
        case 2:
          text("RIGHT",250,150);
          break;
      }
}

void aliens(int eye) {
  stroke(color(255,0,0));
  fill(color(255,0,0));
  int y = height/2;
  for (int x=40; x<width-30; x+=60) {
    drawAlienEye(x,y, ude,eye);
  } 
}


void move() {
   xPos = xPos + speed;//(a)
}
boolean doesCollide() { //(b)
  if(0>xPos || xPos>width) {
    return true;
  } else {
    return false;
  }
}
void bounce() {
  speed = -speed;
  ude++;
  if (ude>3) {
    ude=1;
  }
}
void display() {
  stroke(color(255,0,0));
  fill(color(255,0,0));
//  ellipse(xPos,yPos,radius,radius);
  drawAlienEye(xPos,yPos, ude,0); 
}

void drawAlienEye(int X, int Y, int hands, int eye) {
 //  頭と胴体の表示
 rectMode(CENTER);  
 stroke(0);
 fill(150);
 rect(X,Y,20,100);
 stroke(0);
 fill(255);
 int y  =  Y-30;
 ellipse(X,y,60,60);
 fill(0);
 //medama
 switch (eye) {
   case 1:  //hidari close
    ellipse(X-19,y,16,8);
    ellipse(X+19,y,16,32);
    break;
   case 2:  //migi close
    ellipse(X+19,y,16,8);
    ellipse(X-19,y,16,32);
    break;
   case 0:   //ryoume open
   default:
    ellipse(X+19,y,16,32);
    ellipse(X-19,y,16,32);
    break;
   
 }
 //  足の表示
 stroke(150);
 int  x1 =  X+10;
 int  x2 =  X-10;
 int  y1 =  Y+50;
 int  y2 =  Y+60;
 line(x2,y1,X-20,y2);  //L1
 line(x1,y1,X+20,y2);  //L2
 //  手の表示
 y1 =  Y+20;
 y2 =  Y+15;
 line(x2,y1,X-25,y2);  //L3
 line(x1,y1,X+25,y2);  //L4
 //takusan no teni taiou saseru...
 for (int i=0; i<hands; i++) {
   //left hands
 line(x2,map(i,0,hands,y1,Y+50),
    X-25,map(i,0,hands,y2,Y+60) );   
   //right hands
 line(x1,map(i,0,hands,y1,Y+50),
    X+25,map(i,0,hands,y2,Y+60) );   
 }
}
