
size(400,400);

//背景
background(0);
noStroke();
float color1,color2;

//四角のサイズ
int box_size = 2;

for(int i = box_size;i < 400 - box_size;i += box_size*2) {
  for(int j = box_size;j < 400- box_size; j += box_size*2) {
  //fill(random(155)+100,random(155)+100,random(155)+100);
  color1 = (float)i / 200 * 255;
  color2 = (float)j / 300 * 255;
  fill(color1,color2,255);
  rect(i,j,box_size,box_size);
  }
} 


