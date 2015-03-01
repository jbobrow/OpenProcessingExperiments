
// Jake Meth
// Lesson 2 Homework
// Part 2: Drawing a Shape with a Function

void setup(){
  size(400, 400);
  background(255);
  noFill();
  
  
}

void draw(){
  drawStrangeshape(50, 50, 120, 120,
  100, 160, 120, 120, 160, 160,
  20, 20, 50, 50, 75, 20,
  203, 214, 105,
  10, 230, 10);
  
  drawStrangeshape(200, 100, 320, 310,
  280, 370, 320, 310, 340, 360,
  350, 240, 200, 100, 275, 200,
  120, 120, 250,
  250, 10, 40);
  
  drawStrangeshape(200, 250, 75, 300,
  20, 380, 75, 300, 150, 390,
  60, 190, 200, 250, 215, 200,
  0, 0, 0,
  240, 200, 240);
  
  
}
// X1, Y1, etc for line coordinates
// tx1, tx2, etc for triangle 1 coordinates
// rx1, rx2, etc for triangle 2 coordinates
// f1, f2, etc for triangle fill
void drawStrangeshape(int X1, int Y1, int X2, int Y2,
int tx1, int ty1, int tx2, int ty2, int tx3, int ty3,
int rx1, int ry1, int rx2, int ry2, int rx3, int ry3,
int f1, int f2, int f3,
int f4, int f5, int f6){
    
line(X1, Y1, X2, Y2);
fill(f1, f2, f3);
triangle(tx1, ty1, tx2, ty2, tx3, ty3);
fill (f4, f5, f6);
triangle(rx1, ry1, rx2, ry2, rx3, ry3);
}


