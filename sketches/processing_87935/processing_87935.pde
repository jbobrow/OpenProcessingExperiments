
//Loris Uzan
//1 Feb 2013
//Ge44ing up in th3 m04n1ng

//font
PFont font;
//setup
void setup() {
  size (640, 1000);
  background (0);
  smooth ();
  font=loadFont("SegoeUI-30.vlw");
  textFont (font);
  }
//text
void draw(){
  fill(#1C1C1C);
  
  if (mousePressed == true) {
    fill(#FFAE17);
    background(#B7FAFF);
    textSize(200);
    text(";)", 270, 600);
    textSize(30);
    text("don't forget to set your alarm clock", mouseX-250, mouseY-20);
  } else {
      background(#484848);
    }
  int x;
  x=40;
  text("wake up",25 ,x);
  text("rotate (90) left shoulder ",25,2*x);
  text("click snooze button",25,3*x);
  text("sleep",25,4*x);
  text("wake up",25,5*x);
  text("rotate (90) knees",25,6*x);
  text("rotate(90) basin",25,7*x);
  text("you're up :)",25,8*x);
  
}


