
int numPos = 50;
int [] x = new int [numPos];
int [] y = new int [numPos];
import processing.pdf.*;

void setup(){
  size(400, 400);
  noLoop();
  beginRecord(PDF, "filename.pdf");
  for (int i = 0; i < x.length; i++){
  x[i] =int(random(width/30));
  y[i] =int(random(height/30));
}
}
void draw() {
line(0,0, width/2,height);
   fill(random(200),random(200),random(200),random(200));
 
  for(int i = 0; i < numPos - 1; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
 x[numPos-1] = mouseX;
 y[numPos-1] = mouseY;
  for(int i = 0; i < numPos; i++){
    ellipse (x[i], y[i], random(50),random(50));
    for(int j = 0; j < numPos; j++){
    ellipse (x[j], y[j], random(50),random(50));
 
println("Finished.");
  exit();
    }
  }
}
    
