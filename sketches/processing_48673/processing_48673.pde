
color c = color(0);
float x = 0;
float y = 100;
float speed = 0.5;
int direction=1;
float score=0;
float y1=0;
float x1=0;
int Score=0;
void setup() {
  size(200,200);
}

void draw() {
  background(255,0,0);
  move();
  display();
}

void move() {
  if(direction==1){
  x = x + speed;
  }
  if(direction==2){
    y=y-speed;
  }
  if(direction==3){
    x=x-speed;
  }
  if(direction==4){
    y=y+speed;
  }
  if(x<0||x>190||y<0||y>190){
    background(255,0,0);
    speed=0;
  }
  if(speed<0.5){
    text("game over",width/2,height/2);
    text("score:",50,50);
    text(Score,90,50);
    noLoop();
  }
}
void display() {
  fill(c);
  if(score==0){
    y1=random(50,150);
    x1=random(50,150);
    score=1;
  }
    if(x1<x&&x1>x-10&&y1<y&&y1>y-10){
    background(255,0,0);
    speed=speed+0.1;
    score=0;
    Score=Score+1;
    }
  if(x1>x&&x1<x+10&&y1>y&&y1<y+10){
    background(255,0,0);
    speed=speed+0.1;
    score=0;
    Score=Score+1;
  }
  fill(0,0,255);
  rect(x,y,10,10);
  fill(0);
  rect(x1,y1,10,10);
}
void keyPressed(){
  if(key=='w'){
    direction=2;
  }
  if(key=='a'){
    direction=3;
  }
  if(key=='s'){
    direction=4;
  }
  if(key=='d'){
    direction=1;
  }
}
