
int x = 300;

void setup(){
  size(400,400);
  strokeWeight(2);
  smooth();
  background(0);
}

void draw(){
  drawCircle();
  drawCircleInside();
}
void drawCircle(){
  ellipse(width/2, height/2, 300,300);
  stroke(255);
}
void drawCircleInside(){
    for(int x = 300;x > 10; x+= -100){
      ellipse (width/2,height/2,x,x);
      stroke(x/3,x+10,x);
      fill(x,x*10,x);
      if (mouseButton == RIGHT){
        stroke(x/2, 200,x);
        fill(0,50,x);
      }else if (mouseButton == LEFT){
        stroke(100,2,x*3);
        fill(x, x/2, x*8);
      }else{
      }
    }
}

    


