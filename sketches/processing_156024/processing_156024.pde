
PImage pizza;
float x=width;
float daxiao=50;


void setup(){
size(500,500);
pizza=loadImage("pizza.jpg");

}
void draw(){
  background(0);
image(pizza,mouseX,0,mouseY+500,height);
text("I am hungry!",mouseX-360,mouseY);
textSize(50);
daxiao = map(x,0,height,10,60);
x=x+3;
textSize(daxiao);
text("I need Pizza!",mouseX-500,100);
}


