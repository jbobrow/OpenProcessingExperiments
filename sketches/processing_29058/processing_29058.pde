
private int x, y, a, b;
private boolean pressed = false;
private boolean released = false;


//must implement use of distance formula to resize bear
void drawBear(int x, int y, int a, int b) {  
    int midx = (x + a)/2;
    int midy = (y + b)/2; 
    int distance = (int)(dist(x, y, a, b));
//int head = 
  fill(160,73,19);
  //body
  noStroke();
  ellipse(midx, midy+35, 80, 85);                                                                                                                                     
  //head   
  ellipse(midx, midy-20, 65,70);
  //ears
  ellipse(midx+25, midy-48, 25,25);
  ellipse(midx-25, midy-48, 25,25);
  //arms  
  ellipse(midx-40, midy+20, 30, 15);
  ellipse(midx+40, midy+20, 30, 15);
  //legs
  ellipse(midx-30, midy+74, 30,15);
  ellipse(midx+30, midy+74, 30,15);
  //nose
  stroke(0);
  fill(0);
  ellipse(midx,midy-15,30,15);
  //left eye
  ellipse(midx-11, midy-29, 8,8);
  //right eye
  ellipse(midx+11, midy-29, 8,8); 
  // println(distance);
}  
  void mousePressed() {
    pressed = true;
    x = mouseX;
    y = mouseY;
  }
  //perhaps add line detailing to show size of bear upon release
  void mouseReleased() {
    released = true;
    a = mouseX;
    b = mouseY;
  }
  
void setup() {
  size(500, 500);
   background(0, 180, 30);
}            

void draw() {
  if (pressed == true && released == true) {
   drawBear(x,y,a,b);    
    pressed = false;
    released = false;    
 }
 
}                               
