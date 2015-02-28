
// THE PLAN
// inspired by van der rohe, plan: brick villa project 1923

void setup() {
  size(500, 500);
  background(255);
}

int rectCount=0;
int rectNum = 6; //limits the number of rectangles
int ellipseCount=0;
int ellipseNum = 3; //limits the number of ellipses

void draw() {
}  

void mousePressed() { //simply click the mouse until the designed concept for plan is obtained
  if (rectNum>rectCount) {
      fill(0);
      rect(random(width), random(height), random(height/50), 450); 
      //adds horizontal lines as walls, random thickness but controlled length
      rect(random(width), random(height), 450, random(width/50)); 
      //adds vertical lines as walls, random thickness but controlled length
      fill(255);
      rect(random(width), random(height), random(width/5), random(height/5)); //adds random boxes as cores
      rectNum--;
    }
    if (ellipseNum>ellipseCount) {
      strokeWeight(3);
      ellipse(random(width), random(height), random(width/5), random(height/5)); //adds the ellipses as cores
      ellipseNum--;
    }
  }


