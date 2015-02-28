
import java.awt.*;

final static int BUTTON1=1;
final static int BUTTON2=2;
final static int BUTTON3=3;

int state=BUTTON1;

Rectangle bt1=new Rectangle(10,10,100,30);
Rectangle bt2=new Rectangle(10,50,100,30);
Rectangle bt3=new Rectangle(10,90,100,30);

void setup(){
  size(400,150);
}

void draw(){
  background(255);
  smooth();
  switch(state){
    case  BUTTON1: //Hier Status 1
    status1();
    break;
    case  BUTTON2: //Hier Status 2
    status2();
    break;
    case  BUTTON3: //Hier Status 3
    status3();
    break;
  }
  button(bt1,BUTTON1);
  button(bt2,BUTTON2);
  button(bt3,BUTTON3);
  fill(100);
  text("State:"+state,180,20);

}
void button(Rectangle btt,int num){
  if (btt.contains(mouseX,mouseY)) {
    if (mousePressed) {
      fill (255,0,0);
      state=num;
    } else {
      fill (255,0,255);
    }
  } else {
      fill(50*num);
  }
  rect(btt.x,btt.y,btt.width,btt.height);
}

