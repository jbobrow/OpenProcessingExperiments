
int xpos1 = 30;
int ypos1 = 75;
int xpos2 = 58;
int ypos2 = 20;
int xpos3 = 86;
int ypos3 = 75;

void setup() {  //setup function called initially, only once
  size(1000, 1000);
  background(255, 0, 0)
}
void mouseClicked(){
fill(128, 128, 0);
triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
xpos1 += xpos1+10;
ypos1 += ypos1+10;
xpos2 += xpos2+10;
ypos2 += ypos2+10;
xpos3 += xpos3+10;
ypos3 += ypos3+10;
}
