
boolean isDone;
 
void setup() {
  size(500,400);
  background(0);
  isDone = false;
}
 
void draw() {
  stroke(0, 100, 200);
  strokeWeight(1);
  if (isDone == false){
  // here we are drawing a new line every 4th pixel until we reach the right side of the canvas
  

  for (int i = 0; i < 25; i++) {  // just draw 25 lines instead of 100 here
    float x1 = random(0, width);
    float x2 = random(0, width);
    float y1 = random(0, height);
    float y2 = random(0, height);
    line(x1, y1, x2, y2);
  }
    
    stroke(255, 100, 200);  // change the color
    
    for (int i = 0; i < 25; i++) {  // draw 25 more lines
    float x1 = random(0, width);
    float x2 = random(0, width);
    float y1 = random(0, height);
    float y2 = random(0, height);
    line(x1, y1, x2, y2);
    }
  
  stroke(255, 255, 0); // change the color
      for (int i = 0; i < 25; i++) {  // draw 25 more lines
    float x1 = random(0, width);
    float x2 = random(0, width);
    float y1 = random(0, height);
    float y2 = random(0, height);
    line(x1, y1, x2, y2);
      }
  
  stroke(0, 255, 0); // change the color one last time
      for (int i = 0; i < 25; i++) {  // draw the last 25 lines
    float x1 = random(0, width);
    float x2 = random(0, width);
    float y1 = random(0, height);
    float y2 = random(0, height);
    line(x1, y1, x2, y2);
      }

  }
  isDone = true;
  }
   


