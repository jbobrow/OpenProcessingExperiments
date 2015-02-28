
//Giovanna Marrone
void setup(){
size(200,200);
background(#2D0EE3);
noStroke();
rect(10,100, 100, 100); //as 3 formas a seguir representam a casa
fill(#FAFAF2);//pinturas diferenciadas em cada parte da casa
rect(100, 150, 50, 100);
fill(#E5E8E8);
rect(50, 100, 100, 50);
}
void draw(){
  for(int x=20; x<140; x=x+25){
  fill(#87DEF7);
    rect(x,120,20,20);//janelas
if(mouseX > 10){
  background(0);//escurecer + janelas piscando
  
}
  }
}
