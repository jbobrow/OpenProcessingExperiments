
/* @ pjs = "Sintony-Bold.ttf";*/
int myState = 0 ;
PFont myFont ;

voide setup(){
  size(500,500);
  myFont = createFont("Sintony-Bold",200);
  frameRate(3);
  
}
void draw(){
  rectMode(CENTER);
  fill(100,0,0);
  fill(0,200,0);
  println("mouseX="+ mouseX + ",mouseY=" + mouseY);
  if((mouseX >150) && (mouseX<250)&& (mouseY>160) && (mouseY<250)) {
    fill(100,0,0);
  }
  else{
    fill(0,200,0);
}
rect(width/2,height/2,100,100);
rect(50,50,100,100);
}



