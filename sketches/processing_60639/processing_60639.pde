
int x = 50;
int y = 50;
int w = 100;
int h = 75;
 
void setup() {
  size(400, 400);
  rectMode(CORNER);
  colorMode(HSB, 360,100,100,100);
}
 
void draw() {
  background(168,22,100, 2);
  stroke(255);
   
if (mouseX >= x && mouseX <= x+100 && mouseY >= y && mouseY <= y+h) {
    w += 1.5;
    h +=1;
    fill(0,23,100);
    
         
   
  } else {
    w = 100;
    h = 75;
    fill(0,0,100);
  }
 
  rect(x, y, w, h);
} 

