
/*
Author: Anita Chen
Purpose: class exercises
concept: try to reproduce lines illustrated in Dehlinger’s paper
*/

void setup() {
  size(300, 500);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  int num=500;
  float []x5=new float [num];
  float []y5=new float [num];
  float step1=5;
  float step2=step1/3;
  float border=50;
  float x=50;
  float y1=50;
  float y2=y1*2;
  float y3=y1*3;
  float y4=y3*1.8;

  //draw grass positions
  stroke(0);
  for (x=border;x<=width-border;x+=step2) {
    point(x, y1);
    point(x, y4);
  }
  for (x=border;x<=width-border;x+=step1) {
    point(x, y2);
    point(x, y3);
  }
  //draw grasses
  stroke(0, 100);
  strokeWeight(1);

  for (x=border;x<=width-border;x+=step2) {
    float tipy1=y1-8-random(20);
    float tipy4=y4-25-random(20);
    float tipx=x+random(30)-15;
    float y4m=y4-random(20);
    line(x, y1, tipx, tipy1);//第一列草
    line(x, y4, x, y4m);//第四列草下半部(直)
    line(x, y4m, tipx, tipy4);//第四列草上半部(斜)
  }
  for (x=border;x<=width-border;x+=step1) {
    float tipy2=y2-8-random(20);
    float tipy3=y3-random(-30, 30);
    float tipx=x+random(30)-15;
    float tipx2=x+random(-30, 30);
    line(x, y2, tipx, tipy2);//第二列草
    line(x, y3, tipx2, tipy3);//第三列草
  }
  for (int i=0;i<num;i++){//第五列草
    x5[i]=random(border,width-border);
    y5[i]=random(y4+y2,height-border);
    point(x5[i],y5[i]);
    float tipx5=x5[i]+random(30)-15;
    float tipy5=y5[i]-random(40);
    line(x5[i],y5[i],tipx5,tipy5);
  }
}
void keyPressed() {
 saveFrame("grass exercise.jpg");
 }


