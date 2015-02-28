
PFont font;
boolean cpu;
float rate=60;
int col=255;
int col2=0;
int i=3;
boolean multi;
int p1;
int p2;
int frame;
Paddle[] paddles = new Paddle[2];
Button[] buttons = new Button[2];
Ball ball;
void setup() {
  size(500,500);
  font=loadFont("Arial-Black-48.vlw");
  textFont(font);
  buttons[0]=new Button(0);
  buttons[1]=new Button(1);
  paddles[0]=new Paddle(1);
  paddles[1]=new Paddle(0);
  ball=new Ball();
}
void draw() {
  background(col);
  frameRate(rate);
  if(!multi&&!cpu){
  decision();
  }
  else{
  if(frameCount<120+frame){
  intro();
  }
  else
  {
    fill(0);
    col=255;
    drawPaddles();
    ball.draw();
    score();
    if(frameCount%60==0){
    rate+=5;
    }
  }
}
while(key=='p'&&keyPressed){}
if(key=='r'&&keyPressed){
  restart();
}
}
void decision() {
      background(frameCount%255);
      fill(255-frameCount%255);
      textSize(40);
      text("Choose one...", width/6+30, height/3); 
      textSize(20);
      text("W/S or UP/DOWN to move", width/5+10, height/5);
      buttons[0].drawButton();
      buttons[1].drawButton();
}
void intro() {
  col=255-2*(frameCount-frame);
  col2=2*(frameCount-frame);
  fill(col2);
    textSize(30);
    text("Game will begin in...", width/6, height/3);
      if((frameCount-frame)==40){
        i=2;
      }
      if((frameCount-frame)==80){
        i=1;
      }
      text(i, width/2, height/2);
  }
  void drawPaddles() {
    for(int i=0; i<2; i++){
      paddles[i].draw(i);
    }
  }
  void score() {
    text(p1+"|"+p2, width/2-10, height-20);
    if(ball.xpos>width){
      ball=new Ball();
      p1++;
      rate=60;
    }
    else if(ball.xpos<0){
      ball=new Ball();
      p2++;
      rate=60;
    }
  }
  void restart() {
    loop();
    redraw();
    frame=frameCount;
    p1=0;
    p2=0;
    ball=new Ball();
  }
 
class Ball {
  float xpos, ypos, direction, ydirection, xdirection;
  Ball () {
    xpos=width/2;
    ypos=height/2;
    if(random(1)>0.5){
    direction=random(0.5,1);
    }
    else{
      direction=random(-1, -0.5);
    }
    ydirection=3;
    xdirection=3;
    paddles[0].ypos=width/2-50;
    paddles[1].ypos=width/2-50;
  }
  void draw() {
    ellipse(xpos, ypos, 10, 10);
    ypos+=ydirection*sin(direction);
    xpos+=xdirection*cos(direction);
    if(ypos>height||ypos<0){
      ydirection*=-1;
    }
    if(xpos>25){
      if(ypos>paddles[0].ypos&&ypos<paddles[0].ypos+100){
        if(xpos>width-10){
          ball.xdirection*=-1;
        }
      }
    }
    else{
      if(ypos>paddles[1].ypos&&ypos<paddles[1].ypos+100){
        if(xpos<10){
          ball.xdirection*=-1;
        }
    }
  }
}
}
class Button {
  int xpos, ypos, dist, num, size;
  String text;
  Button(int bnumber) {
    size=15;
    num=bnumber;
    dist=100;
    xpos=bnumber*width/2+width/5;
    ypos=height/2;
    if(bnumber==0) {
      text="CPU";
    }
    else {
      text="2 Player";
    }
  }
  void hover() {
    if(mouseX>xpos&&mouseY>ypos-size&&dist(mouseX, mouseY, xpos, ypos)<dist){
      size=20;
      if(num==0&&mousePressed) {
        cpu=true;
        frame=frameCount;
      }
      else if(num==1&&mousePressed){
        multi=true;
        frame=frameCount;
      }
    }
    else{
      size=15;
    }
  }
  void drawButton() {
    textSize(size);
    text(text, xpos, ypos);
    hover();
}
}
class Paddle {
  float xpos, ypos, speed;
  Paddle (int playerNum) {
    xpos=playerNum*(width-10);
    ypos=height/2;
    speed=3;
  }
  void draw(int playerNum) {
    rect(xpos, ypos, 10, 100);
    if(playerNum==0&&ball.xdirection>0&&multi&&keyPressed){
    if(keyCode==UP&&paddles[0].ypos>0){
      ypos-=speed;
    }
    if(keyCode==DOWN&&paddles[0].ypos<400){
      ypos+=speed;
    }
    }
    else if(cpu&&playerNum==0&&ball.xdirection>0&&ball.xpos>width/2){
      if(ypos+50>ball.ypos){
        ypos-=speed-1.15-0.02*(p2-p1);
      }
      if(ypos+50<ball.ypos){
        ypos+=speed-1.15-0.02*(p2-p1);
      }
    }
    else if(playerNum==1&&ball.xdirection<0&&keyPressed)
    {
    if(key=='w'&&paddles[1].ypos>0){
      ypos-=speed;
    }
    if(key=='s'&&paddles[1].ypos<400){
      ypos+=speed;
    } 
  }
}
}

      


