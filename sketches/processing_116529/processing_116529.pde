
int x; 
void setup(){
  size(1200, 800);
 frameRate(20);
}

 
void draw() {
background(mouseY,random(90));
if (x == 0){
textSize(32);
fill(130, mouseX);
text("S_L_E_A_Z_Y", mouseY,30,5);// Default depth, no z-value specified
text("S_L_E_A_Z_Y", 32,mouseX);
text("S_L_E_A_Z_Y", mouseY,33,5);
text("S_L_E_A_Z_Y", 34,mouseX,5);
text("S_L_E_A_Z_Y", mouseY,35,5);
text("S_L_E_A_Z_Y", 36,mouseX,5);
text("S_L_E_A_Z_Y", mouseY,36,5);
text("S_L_E_A_Z_Y", 37,mouseX,5);
text("S_L_E_A_Z_Y", mouseY,37,5);
text("S_L_E_A_Z_Y", 38,mouseX,5);
text("S_L_E_A_Z_Y", mouseY,37,5);
text("S_L_E_A_Z_Y", 38,mouseX,5);
  for (int i=50;i<width;i=i+25) {
    for (int j=50; j<height-25; j=j+25){
      line(i+100,mouseY,mouseX,j+80);
    }}

 }
 }


