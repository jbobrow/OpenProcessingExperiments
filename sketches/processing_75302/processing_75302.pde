
int d = 30;
int xPos = 15;
int yPos = 15;
int counter = 1;
int a=100;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

  void draw(){
    //shape;
  fill(255, 0, 0);
  rect(10, 10, 20, 20);
  fill(16, 0, 255);
  rect(370, 370, 20, 20);
  //change background
    
    if (mouseY>10 && mouseY<50 && mouseX<a) {
    rect(10, 10, 20, 20);{
      background (255, 0, 0);
    }
    }else{
    if (mousePressed) {
    rect(370, 370, 20, 20);{
      background (16, 0, 255);
    }
    }
  }
  }
