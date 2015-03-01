
void setup() {
  size(500, 500);
  background(0);
}
int ySpeed=1;
int xSpeed=2;
boolean ySwitch=true;
boolean xSwitch=true;
int x=15;
int y=15;
int score=0;
int px0=100, py0=height-20, px1=100, py1=10;
int highScore=0;

void draw() {
  background(0);
  fill(255);
  ellipse(x, y, 30, 30);
  rect(px0, py0, px1, py1);
  py0=height-20;
  py1=10;
  if (keyPressed && (key=='a' || key=='A')){
    px0-=5;
  }
  if (keyPressed && (key=='d' || key=='d')){
    px0+=5;
  }

  if (ySwitch) {
    y+=ySpeed;
  } else {
    y-=ySpeed;
  }
  if (y-15<=0)
    ySwitch=!ySwitch;
   
  if ((y+15>=py0 && y-15<=py0+py1) && (x-15<px0+px1 && x+15>px0)) {
    ySwitch=!ySwitch;
    score+=1;
    xSpeed+=1;
    ySpeed+=1;
  }
  
  if (y+15>=height){
    x=50;
    y=50;
    xSpeed=1;
    ySpeed=1;
    if (score>highScore){
     highScore=score; 
    }
    score=0;
  }
  if (xSwitch) {
    x+=xSpeed;
  } else {
    x-=xSpeed;
  }
  if (x+15>=width || x-15<=0)
    xSwitch=!xSwitch;
  
  text ("High Score: "+ str(highScore), width-100, 50);
  text(str(score), 50, 50);
}



