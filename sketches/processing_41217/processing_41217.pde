
float distance;
int x1, y1, x2, y2;
int mouseCount = 0;

void setup() {
  size(600, 400);
  background(0);
}
void draw() {

  
}
void mousePressed() {
  if (mouseCount== 0) {
    background(0);
    x1 = mouseX;
    y1 = mouseY;
    smooth();
    noStroke();
    fill(225);
    ellipse (x1, y1, 5, 5);
    textAlign(CENTER);
    text("point 1 ("+x1+", "+y1+")",x1, y1+20);
    mouseCount++;
  } 
  else if (mouseCount!= 0) {
    x2 = mouseX;
    y2 = mouseY;
    smooth();
    fill(225);
    noStroke();
    ellipse (x2, y2, 5, 5);
    mouseCount=0;
    
    //additional information 
    textAlign(CENTER);
    text("point 2 ("+x2+", "+y2+")",x2, y2+20);
    stroke(255,0,0);
    line(x1,y1,x2,y2);
    distance = calculateDist(x1, y1, x2, y2);
    textAlign(CENTER);
    text("distance: "+distance, width/2, height/2);
  }
  //println(abs(x2-x1)+", "+abs(y2-y1));
  //println(mouseCount);
}

float calculateDist(int x1, int y1, int x2, int y2) {
  float b = sq(x2-x1) + sq(y2-y1);
  float a = floor(sqrt(b));
  return a;
}

                
                
