
//dan 04:34 10/10/2011

int matrix=24;
int canvasSize=400;
int x=0;
int y=0;

void setup(){
  size(canvasSize,canvasSize);
  background(220);
  stroke(100);
  for(int i=0;i<=matrix;i++) {
    line(canvasSize/matrix*i,0,canvasSize/matrix*i,canvasSize);
    line(0,canvasSize/matrix*i,canvasSize,canvasSize/matrix*i);
  }
}

void draw() {

}

void mouseDragged() {
 if (mouseButton == LEFT) { fill(255,0,0,80); }
 if (mouseButton == RIGHT) { fill(0,0,0,80); } 
   x=int(mouseX/(canvasSize/matrix));
   y=int(mouseY/(canvasSize/matrix));
  //println("mouseX: "+mouseX + "x: "+x+" y: "+y);
   rect(canvasSize/matrix*x,canvasSize/matrix*y,canvasSize/matrix,canvasSize/matrix);  
 
}

void mouseClicked() {
 if (mouseButton == LEFT) { fill(255,0,0,80); }
 if (mouseButton == RIGHT) { fill(0,0,0,80); } 
   x=int(mouseX/(canvasSize/matrix));
   y=int(mouseY/(canvasSize/matrix));
  //println("mouseX: "+mouseX + "x: "+x+" y: "+y);
   rect(canvasSize/matrix*x,canvasSize/matrix*y,canvasSize/matrix,canvasSize/matrix);  
 
 
}
