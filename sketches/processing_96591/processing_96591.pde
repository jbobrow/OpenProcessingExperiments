
class needle {
  float angle;
  PVector location;
  float speed=0;
  needle(float x, float y) {
    angle =45;
    location = new PVector(x, y);
  }
  void draw() {

    pushMatrix();

    translate(location.x, location.y);
    rotate(radians(angle));
    noStroke();
    stroke(0);
    noFill();
    strokeWeight(3);
    line(0, 0, 40, 0);
    strokeWeight(2);

    popMatrix();
  }
  void go(float ang) {
    float dir = (ang-angle)+2160;
    speed= dir/((60-second())*30);
  }
  void go2(float ang) {
    float dir = (ang-angle)+1080;
    speed= dir/((60-second())*30);
  }
  void move() {
    angle= angle+speed;
  }
}
int h;
int m;
int first;
int second;
int third;
int fourth;
PFont f;
needle[][] Needle= new needle[24][2];
void setup() {

  smooth();
  size(800, 300);
  for (int i=0; i<24;i++) {
    for (int j=0; j<2;j++) {
      Needle[i][j] = new needle ( 50+100*(i%8), 50+100*(i/8) );
    }
  }
  f = createFont("Arial", 16, true);
  frameRate(30);
  h=hour();
  m=minute();
  first =(int)(h/10);
  second=(int)(h%10);
  third=(int)((m+1)/10);
  fourth=(int)((m+1)%10);
  assign(first, 0);
  assign(second, 1);
  assign(third, 2);
  assign(fourth, 3);
}
void draw() {
  println(second());
  if (second()==30) {
    first =(int)(hour()/10);
    second=(int)(hour()%10);
    third=(int)((minute()+1)/10);
    fourth=(int)((minute()+1)%10);
    assign(first, 0);
    assign(second, 1);
    assign(third, 2);
    assign(fourth, 3);
  }
  background(255);
  for (int i=0; i<24;i++) {
    ellipse(50+100*(i%8), 50+100*(i/8), 100, 100);
    for (int j=0; j<2;j++) {
        Needle[i][j].move();
      Needle[i][j].draw();
    }
  }
}
void assign(int select, int numOrigin) {
  int num=numOrigin*2;
  switch(select) {
  case 0 :
    Needle[num][0].go(90);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(90);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(-90);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  case 1 :
    Needle[num][0].go(135);
    Needle[num][1].go2(135);
    Needle[num+1][0].go(90);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(135);
    Needle[num+8][1].go2(135);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(135);
    Needle[num+16][1].go2(135);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(-90);
    break;
  case 2 :
    Needle[num][0].go(0);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(0);
    Needle[num+8][1].go2(90);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(180);
    Needle[num+16][0].go(-90);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(180);
    Needle[num+17][1].go2(180);
    break;
  case 3 :
    Needle[num][0].go(0);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(0);
    Needle[num+8][1].go2(0);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(0);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  case 4 :
    Needle[num][0].go(90);
    Needle[num][1].go2(90);
    Needle[num+1][0].go(90);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(0);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(135);
    Needle[num+16][1].go2(135);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(-90);
    break;
  case 5 :
    Needle[num][0].go(0);
    Needle[num][1].go2(90);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(180);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(0);
    Needle[num+9][0].go(180);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(0);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  case 6 :
    Needle[num][0].go(90);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(180);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(90);
    Needle[num+9][0].go(180);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(-90);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  case 7 :
    Needle[num][0].go(90);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(-90);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(135);
    Needle[num+16][1].go2(135);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(-90);
    break;
  case 8 :
    Needle[num][0].go(90);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(0);
    Needle[num+8][1].go2(90);
    Needle[num+9][0].go(180);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(-90);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  case 9 :
    Needle[num][0].go(90);
    Needle[num][1].go2(0);
    Needle[num+1][0].go(180);
    Needle[num+1][1].go2(90);
    Needle[num+8][0].go(-90);
    Needle[num+8][1].go2(0);
    Needle[num+9][0].go(-90);
    Needle[num+9][1].go2(90);
    Needle[num+16][0].go(-45);
    Needle[num+16][1].go2(0);
    Needle[num+17][0].go(-90);
    Needle[num+17][1].go2(180);
    break;
  }
}














