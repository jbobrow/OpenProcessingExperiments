
//Louisa 31/03/11

int x = 50;
int y = 50;
int w = 100; 
int h = 75;

void setup() {
  size(200,200);
}
void draw() {
 background(0);
stroke(255);
if (mouseX > 50 && !(mouseX> 150) && mouseY>50 && !(mouseY> 125)) {
fill(40,54,191);
}else { 
 fill(232,12,245); 
} rect(x,y,w,h);
}



