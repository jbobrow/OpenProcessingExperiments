
int possumX = 1;
int possumY = 1;
int pitbullx = 480;
void setup(){
 size(500,500);
 background(0,0,255);
 
}
void draw(){
  fill(possumX,possumY/2,255);
  rect(possumX,possumY,50,50);
  rect(pitbullx,possumY,50,50);
  possumX = possumX + 2;
  possumY = possumY + 2;
  pitbullx = pitbullx - 2;
}

