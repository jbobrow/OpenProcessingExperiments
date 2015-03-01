

float x = 10;


void setup(){
  size(500, 1000);
  smooth();
  background(255);
}

void draw(){
  background(255);
  fill(240, 19, 75);
  ellipse(250, 500, 50, 50);//中央の円
  noFill();
  stroke(240, 19, 75);
  strokeWeight(10);
  ellipse(250, 500, 100, 100);//中央外側の円
  ellipse(250, 310, x, x);//上部の円
  ellipse(100, 400, x, x);//左側の円
  ellipse(400, 400, x, x);//右側の円
  ellipse(125, 600, x, x);//左下部の円
  ellipse(375, 600, x, x);//右下部の円
  line(250, 450, 250, 385);//上
  line(200, 480, 160, 450);//左
  line(300, 480, 340, 450);//右
  line(210, 530, 180, 550);//左下
  line(290, 530, 320, 550);//右下
  x+=0.1;
  if( x >= 150){
     background(255);
  fill(245, 245, 0);
  ellipse(250, 500, 50, 50);//中央の円
  
  stroke(255);
  strokeWeight(10);
  ellipse(250, 500, 100, 100);//中央外側の円
   fill(240, 19, 75);
  ellipse(250, 310, x, x);//上部の円
  ellipse(100, 400, x, x);//左側の円
  ellipse(400, 400, x, x);//右側の円
  ellipse(125, 600, x, x);//左下部の円
  ellipse(375, 600, x, x);//右下部の円
  line(250, 450, 250, 385);//上
  line(200, 480, 160, 450);//左
  line(300, 480, 340, 450);//右
  line(210, 530, 180, 550);//左下
  line(290, 530, 320, 550);//右下
  x+=0.1;
  }
  if(x >= 250){
    Stop();
  }
}



