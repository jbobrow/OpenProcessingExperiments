
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
