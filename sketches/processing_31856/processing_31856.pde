
//Fish
Fish f1;
s1 s1;
s2 s2;
s3 s3;
s4 s4;
int xx=300;
int x1;
int x2;
int x3;
float y1=random(300);
float y2=random(300);
float y3=random(300);
float y4=random(300);
int c1=0;
int d = 0;
int speed=1;
int p=0;

void setup(){
  size(300,300);
  background(0,0,255);
  f1= new Fish();
  s1= new s1();
  s2= new s2();
  s3= new s3();
  s4= new s4();
  rectMode(CENTER);
}

void draw(){
  x1=xx+30;
  println(c1);
  loop();
  noStroke();
  background(0,0,255);
  fill(255,128,0);
  f1.fdisplay();
  fill(128);
  s1.s1();
  s2.s2();
  s3.s3();
  s4.s4();
  xx-=speed;
  fill(0);
  text("Score:",5,15);
  text(c1*100,40,15);
  if(xx<=-25){
    xx=300;
    c1+=1;
    y1=(y1*3)+1;
    y2=(y2*3)+1;
    y3=(y3*3)+1;
    y4=(y4*3)+1;
    if(y1>300){
      y1=y1%300;
    }
    if(y2>300){
      y2=y2%300;
    }
    if(y3>300){
      y3=y3%300;
    }
    if(y4>300){
      y4=y4%300;
    }
  }
  if (((y1-15<=mouseY)&&(y1+15>=mouseY))&&(xx-27<=25)){
    noLoop();
    d=1;
  }
    if (((y2-15<=mouseY)&&(y2+15>=mouseY))&&(xx-27<=25)){
    noLoop();
    d=1;
  }
    if (((y3-15<=mouseY)&&(y3+15>=mouseY))&&(xx-27<=25)){
    noLoop();
    d=1;
  }
    if (((y4-15<=mouseY)&&(y4+15>=mouseY))&&(xx-27<=25)){
    noLoop();
    d=1;
  }
  if(d==1){
      background(128);
      fill(0,255,0);
      text("Game Over",115,130);
      text("Your score was:",90,140);
      text(c1*100,180,140);
      text("Click to Retry",108,150);
  }
  if(c1>=5){
    speed=(c1/5)+1;
  }
}

class Fish{
  void fdisplay(){
    ellipse(25,mouseY,20,15);
    triangle(25,mouseY,15,mouseY-7.5,15,mouseY+7.5);
  }
}
class s1{
  void s1(){
    ellipse(xx,y1,40,30);
    triangle(xx,y1,xx+25,y1-15,xx+25,y1+15);
    triangle(xx-20,y1,xx+3,y1,xx+3,y1-25);
  }
}
class s2{
  void s2(){
    ellipse(xx,y2,40,30);
    triangle(xx,y2,xx+25,y2-15,xx+25,y2+15);
    triangle(xx-20,y2,xx+3,y2,xx+3,y2-25);
  }
}
class s3{
  void s3(){
    ellipse(xx,y3,40,30);
    triangle(xx,y3,xx+25,y3-15,xx+25,y3+15);
    triangle(xx-20,y3,xx+3,y3,xx+3,y3-25);
  }
}

class s4{
  void s4(){
    ellipse(xx,y4,40,30);
    triangle(xx,y4,xx+25,y4-15,xx+25,y4+15);
    triangle(xx-20,y4,xx+3,y4,xx+3,y4-25);
  }
}
void mousePressed(){
  if (d==1){
    redraw();
    c1=0;
    speed=1;
    d=0;
    xx=300;
  }
  if((d==0)&&(p==0)){
    noLoop();
    background(110);
    fill(255);
    text("PAUSED",130,140);
    text("Click to Resume",108,150);
    p=1;
  }
  if((d==0)&&(p==1)){
    redraw();
    p=0;
  }
}

