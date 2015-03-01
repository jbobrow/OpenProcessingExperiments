
int firstNum;
int secondNum;

void setup(){
  firstNum = 0;
  secondNum = (int)random(0,10);
}

void draw(){
  background(0);
  fill(255);
  textAlign(CENTER,CENTER);
  text(firstNum + "+" + secondNum + "=",width/2,height/2);
}

void keyPressed(){
  firstNum += secondNum;
  secondNum = (int)random(0,10);
}
