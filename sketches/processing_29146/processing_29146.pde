
void setup(){
  size(400,400);
  background(255);
}

void draw(){
  //枠線のない青い正方形
  noStroke();
  fill(0,0,255);
  rect(50,50,100,100);
  
  //赤い枠線の長方形
  stroke(255,0,0);
  strokeWeight(1);
  noFill();
  rect(200,50,100,50);
  
  //緑色で太い枠線のだ円
  stroke(0,255,0);
  strokeWeight(7);
  noFill();
  ellipse(100,250,150,100);
  
  //黄色い線をつないで三角形を描く
  stroke(255,255,0);
  line(250,350,350,350);
  line(250,350,300,250);
  line(350,350,300,250);
}

