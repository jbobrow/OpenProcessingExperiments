
int d = 20;
float x = random(d, width);
float y = random(d, height);
float vx = 2;
float vy = 2;
String state = "init";
PFont avant;
PFont yeo;
int b = 255;
float s = 8;
int buttonX;
int buttonY;
int buttonTextX;
int buttonTextY;
float p2Y;
color f;

void setup() {
  background(255);
  size(540, 500);
  f=color(0,0,0);
  buttonX = 200;
  buttonY = height-50;
  buttonTextX = buttonX+10;
  buttonTextY = buttonY+27;
  p2Y = height/2-100;
  smooth();
  yeo = loadFont("4YEOstamp-48.vlw");
  avant = loadFont("AvantGarde-Bold-160.vlw");
}

void draw() {
  if(state == "init"){
    if (b>0) {
      b-=5;
      fill(b);
      textFont(avant, 160); 
      text("PONG", 20, 300);
    }
    if (b==0) {
      if (s>1) {
        s -= .5;
        background(255);
        fill(b);
        textFont(avant, 160); 
        text("PONG", 20, 300);
        fill(200,0,0);
        translate(140, height-150); // Translate to the center
        scale(s);
        rotate(-.5);
        textFont(yeo, 100);
        text("EXTREME", 0, 0);
      } else {
        if (s==1) {
          fill(0);
          rect(buttonX, buttonY, 150, 40);
          fill(255);
          rotate(0);
          textFont(avant, 20);
          text("Click to Play", buttonTextX, buttonTextY);
          state = "start";
        }
      }
    }
  }
  if(state == "game"){
    drawEllipse();
    drawPaddles();
  }
  if(state == "game-over"){
    background(255);
    textFont(yeo, 60);
    fill(200);
    if(x>width+20){
      fill(245,220,81);
      text("Player 1", 140, 200);
    } else if (x<-20){
      fill(237,123,41);
      text("Player 2", 140, 200); 
    }
    fill(200,0,0);
    textFont(avant, 100);
    text("WINS", 160, 300);
    fill(0);
    rect(buttonX, buttonY, 150, 40);
    fill(200);
    rotate(0);
    fill(255);
    textFont(avant, 20);
    text("Play Again", buttonTextX+10, buttonTextY);
  }
}

void drawEllipse() {
  fill(f);
  background(255);
  x += vx;
  y += vy;
  if(x>=(width-(d/2)-20)){
    if(y>p2Y && y < p2Y+100){
      vx = -vx;
        f=color(205,0,0);
        if(vx>0){
          vx++;
        } else {
          vx--;
        }
    }
  }
  if(x<=d/2+20){
    if(y>mouseY-50 && y<mouseY+50){
      vx = -vx;
      f=color(0,185,0);
        if(vx>0){
          vx += .5;
        } else {
          vx -= .5;
        }
    }
  }
  if(y>=(height-d/2)){
    vy = -vy;
    f=color(0,0,180);
  }
  if(y<=d/2){
    vy = -vy;
    f=color(255,0,255);
  }
  ellipse(x,y,d,d);
  if(x>width+20 || x<-20){
    state = "game-over";
  }
}

void drawPaddles(){
  if(keyPressed){
    if(keyCode == 37){
      if(p2Y>0){
        p2Y -= 20;
      }
    }
    if(keyCode == 39){
      if(p2Y<height-100){
        p2Y += 20;
      }
    }
  }
  noStroke();
  fill(245,220,81);
  rect(0,mouseY-50,20,100);
  fill(237,123,41);
  rect(width-20,p2Y,20,100);
  stroke(1);
}

void mouseClicked(){
  if(state == "start" || state == "game-over"){
    if(mouseX > buttonX && mouseX < buttonX+150 && mouseY > buttonY && mouseY < buttonY+40){
      background(255);
      x = random(d, width);
      y = random(d, height);
      vx = 2;
      vy = 2;
      state = "game";
    }
  }
}

