
void setup (){
   size(500,500);
  background(255,0,255);
}
void draw(){
  strokeWeight(3);
  stroke(0);
  fill(255);
  rect(20,20,200,200);
  fill(#77E541);
  ellipse(180,180,50,50);
  ellipse(70,70,50,50);
  fill(255);
  rect(50,250,200,200);
  fill(#77E541);
  ellipse(100,300,50,50);
  ellipse(150,350,50,50);
  ellipse(200,400,50,50);
   ellipse(mouseX,mouseY,50,50);
}


int possumX = 1;
int possumY = 1;
int hazzaX = 450;
void setup (){
  size(500,500);
  background(#F56FD6);
}
  void draw(){
    fill(255,0,possumY);
    rect(possumX,possumY,50,50);
    rect(hazzaX,possumY,50,50);
    possumX = possumX + 1;
    hazzaX = hazzaX - 1;
    possumY = possumY +1;
  }
