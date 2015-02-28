
class rct{
  int X1;
  int Y1;
  rct(int X,int Y) {
    X1 = X + 10;
    Y1 = Y + 10;
  }
  private 
  void sqr() {
    if(mouseX>X1&&mouseX<(X1+80)&&mouseY>Y1&&mouseY<(Y1+80)){
      fill((mouseX-X1)*3,(mouseY-Y1)*3,60);
      int a = X1;
      int b = Y1;
      rect (a,b,80,80);
    }
  }
}

void setup(){
  size (500,500);
}

void draw(){
  if (mousePressed && true){
    background(mouseX/2,mouseY/2,0);
  }
  rct one = new rct(0,0);
  one.sqr();
  rct two = new rct(100,0);
  two.sqr();
  rct three = new rct(200,0);
  three.sqr();
  rct four = new rct(300,0);
  four.sqr();
  rct five = new rct(400,0);
  five.sqr();
  rct one1 = new rct(0,100);
  one1.sqr();
  rct two1 = new rct(100,100);
  two1.sqr();
  rct three1 = new rct(200,100);
  three1.sqr();
  rct four1 = new rct(300,100);
  four1.sqr();
  rct five1 = new rct(400,100);
  five1.sqr();
  rct one2 = new rct(0,200);
  one2.sqr();
  rct two2 = new rct(100,200);
  two2.sqr();
  rct three2 = new rct(200,200);
  three2.sqr();
  rct four2 = new rct(300,200);
  four2.sqr();
  rct five2 = new rct(400,200);
  five2.sqr();
  rct one3 = new rct(0,300);
  one3.sqr();
  rct two3 = new rct(100,300);
  two3.sqr();
  rct three3 = new rct(200,300);
  three3.sqr();
  rct four3 = new rct(300,300);
  four3.sqr();
  rct five3 = new rct(400,300);
  five3.sqr();
  rct one4 = new rct(0,400);
  one4.sqr();
  rct two4 = new rct(100,400);
  two4.sqr();
  rct three4 = new rct(200,400);
  three4.sqr();
  rct four4 = new rct(300,400);
  four4.sqr();
  rct five4 = new rct(400,400);
  five4.sqr();
}


