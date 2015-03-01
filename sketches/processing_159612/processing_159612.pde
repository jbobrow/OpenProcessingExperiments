
float x=250;
float y=250;
float xj=0;
float yj=0;
float speed=1;
float e1x=random(50,450);
float e1y=random(50,450);
float e2x=random(50,450);
float e2y=random(50,450);
float e3x=random(50,450);
float e3y=random(50,450);
float score=0;
float hiscore=0;

void setup() {
  size(500,500);
}

void draw() {
  background(255,255,255);
  fill(#000000);
  textSize(20);
  text("score:",10,20);
  text("hiscore:",10,43);
  text(score,100,20);
  text(hiscore,100,43);
  fill(0,255,0);
  rect((x-25),(y-25),50,50);
  fill(255,255,0);
  rect(e1x,e1y,10,10);
  rect(e2x,e2y,10,10);
  rect(e3x,e3y,10,10);
  
  if(mouseX > x){
    xj=1;
  }
  if(mouseY > y){
    yj=1;
  }
  if(mouseX < x){
    xj=0;
  }
  if(mouseY < y){
    yj=0;
  }
  
  if(xj==0){
    x=x+speed;
  }
  if(yj==0){
    y=y+speed;
  }
  if(xj==1){
    x=x-speed;
  }
  if(yj==1){
    y=y-speed;
  }
  
  if(e1x > (x-25) && e1x < (x+25) && e1y > (y-25) && e1y < (y+25)){
    speed=speed+0.3;
    e1x=random(50,450);
    e1y=random(50,450);
    score=score+speed;
    if(score > hiscore){
      hiscore=score;
    }
  }
  if(e2x > (x-25) && e2x < (x+25) && e2y > (y-25) && e2y < (y+25)){
    speed=speed+0.3;
    e2x=random(50,450);
    e2y=random(50,450);
    score=score+speed;
    if(score > hiscore){
      hiscore=score;
    }
  }
  if(e3x > (x-25) && e3x < (x+25) && e3y > (y-25) && e3y < (y+25)){
    speed=speed+0.3;
    e3x=random(50,450);
    e3y=random(50,450);
    score=score+speed;
    if(score > hiscore){
      hiscore=score;
    }
  }
  
  if(x < 0 || x > 500 || y < 0 || y > 500){
    x=250;
    y=250;
    score=0;
    speed=1;
  }

}


