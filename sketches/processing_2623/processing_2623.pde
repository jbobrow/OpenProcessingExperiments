
void setup(){
  size(400, 400);
  background(0);
  noStroke();
}
float y = 200;
float ballx = 200;
float bally = 100;
float my = 1;
float mx = -2;
void draw(){

  background(0);
  rect(20, mouseY-25, 10, 50);
  ellipse(ballx, bally, 15, 15);
  rect(400-30, y-25, 10, 50);
  ballx+=mx;
  bally+=my;
  if(bally >  400-16 || bally < 16){
    my *= -1;
  }
    if(ballx < 31 && abs(bally - mouseY) < 35){
      mx *= -1;
      my = (bally - mouseY)/4;
    }
    if(ballx > 400 - 31 && abs(bally - y) < 35){
      mx *= -1;
      my = (bally - y)/4;
    }

    if(bally > y){
      y += 3;
    }
    if(bally < y){
      y -= 3;
    }
    if(ballx < 0 || ballx > 400){
      ballx = 200;
      bally = 100;
    }
  }


