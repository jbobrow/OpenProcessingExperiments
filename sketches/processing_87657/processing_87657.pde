
int widt=1;
object square[];
float d;
void setup() {
  size(400, 400);

square = new object[width/widt];


  for(int i = 0; i < width/widt; i++) {
    square[i] = new object(i);
  }
}
void draw() {
  background(0);
  d+=0.12;
  for(int i = 0; i < width/widt; i++) {
    square[i].draw();
  }
}
class object {
  float xpos;
  float ypos;
  float xpos2;
  float ypos2;
  float ypos3;
  float xpos3;

  
  object(int num) {
  xpos=num*widt;
  xpos2=xpos;
  xpos3=xpos;
  }
  void draw() {
  stroke(xpos/2, ypos/2, xpos/2);
    ypos3 =200+sin(d-xpos/5)*10;
    rect(xpos3, ypos3, widt, 30);
        ypos2=100+sin(d-xpos/20)*10;
    rect(xpos2, ypos2, widt, 30);
    ypos=300+sin(d-xpos/3)*10;
    rect(xpos, ypos, widt, 30);
  }
}
