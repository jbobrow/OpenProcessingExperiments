
int possumX = 1;
int possumY = 1;
int bulldogX = 500;
void setup() {
  size(500,500);
  background(100,180,255);
}
void draw(){
  fill(possumX,possumY,bulldogX);
  rect(possumX,possumY,30,30);
  rect(bulldogX,possumX,30,30);
  possumX = possumX + 1;
  possumY = possumY + 1;
  bulldogX = bulldogX - 1;
}
