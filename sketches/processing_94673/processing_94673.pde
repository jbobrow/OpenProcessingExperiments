
int w4 = 800/4;
int h4 = 800/4;
int x = 200;
int y = 200;
//-----------------------RightUp
int xx = 600;
int yy = 200;
//-----------------------LeftDown
int xpos = 200;
int ypos = 600;
//-----------------------RightDown
int xxxx = 600;
int yyyy = 600;
int speed = 1;
int speed2 = 1;
int speed3 = 1;
int speed4 = 1;
void setup() {
  //println("xxxpos = " + xpos);
  //println("yyypos = " + ypos);

  size(800, 800);





  /* ellipse((width/4)+(2*w4), (height/4)+(2*w4), 100, 100);
   ellipse((width/4), (height/4)+(2*w4), 100, 100);*/
}
void draw() {
  background(0);
  frameRate(25);
 // println("  neuer Draw -------------------- ");
noStroke();

  /*if (x >= w4) {
   x -= speed;*/
  fill(255, 2, 255);
  //fill(255);
  arc(x, y, 110, 110, radians(90), radians(360));//UpLeft
  //ellipse(x, y, 100, 100);//UpLeft
  LeftUp();
  arc(xx, yy, 100, 100, radians(180), radians(450));//UpRight
  //ellipse(xx, yy, 100, 100);//UpRigth
  move2();
  arc(xpos, ypos, 100, 100, 0, PI+HALF_PI);//DownLeft
  //ellipse(xpos, ypos, 100, 100);//left Down
  LeftDown();
  arc(xxxx, yyyy, 100, 100, radians(270), radians(540));//Down Right
  //ellipse(xxxx, yyyy, 100, 100);//Right Down
  RightDown();
}

void LeftDown(){
  //println("      LeftDown x = "+ xpos);
  //println("      LeftDown y = "+ ypos);
  //println("speed4 y = "+ speed4);
  //x=200
  //y=600
  if ( xpos >=200 && xpos <width/2){
  xpos += speed4;}
  
  if ( ypos >=height/2 && ypos <601){

  ypos -= speed4;
  }
  
  if (xpos >= width/2) {
    xpos =(200);
  }
 if (ypos <= width/2) {
    ypos =600;
  }
}
  
void LeftUp(){
  //x=200
  //y=600
  //println("(Leftup x = "+ x);
  //println("Leftup y = "+ y);
  if ( x >=200){
  x += speed;}
  if ( y >=200){

  y += speed;
  }
  if (x == (width/2)) {
    x =w4;
  }
  if (y >= width/2) {
    y =w4;
  }
  }
void move2(){
  //x=600
  //y=200
  if ( xx <=600){
  xx -= speed2;}
  if ( yy >=200){

  yy += speed2;
  }
  if (xx <= width/2) {
    xx =(w4*3);
  }
  if (yy >= width/2) {
    yy =w4;
  }
  }
void RightDown(){
  //println("RightDown x = "+ xxxx);
  //println("RightDown y = "+ yyyy);
  //x=600
  //y=600
  if ( xxxx >400 && xxxx <=600){
  xxxx -= speed3;}
  
  if ( yyyy >height/2 && yyyy <601){

  yyyy -= speed3;
  }
  
 if (xxxx <= width/2) {
    xxxx =(600);
  }
  if (yyyy <= width/2) {
    yyyy =600;
  }
}


