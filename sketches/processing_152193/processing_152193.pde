
/*
 * Written for the FL Creative Coding Course of Monash University
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Luvi, June 19th 2014
 *
 * Press the mouse to change colours and shapes
 * Press 's' to save a frame as image
 */
 
// number of spinning tops
int num;

// declare array of spinning tops 
// drawing positions
float[] x;
float[] y;
// change in position at each frame
float[] dx;    
float[] dy;

// radius for the moving hand
float rad;  

void setup() {
  
  // choose display window size and background
  size(400, 400);
  background(0);
  
  // choose number of spinning tops
  num = 5;
  
  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  
  // setup initial positions for each item in the arrays
    for (int i=0; i<num; i++) {
      x[i] = width/(i+1);
      y[i] = height * i/(random(num));
      }
  // dx and dy are the small change in position each frame
    for (int j=0; j<num; j++) {
      dx[j] = random(-1,1);
      dy[j] = random(-1,1);
      }
    
}


void draw() {
  // blend the old frames into the background
  // blendMode(BLEND);
  // fill(0, random(5,15));
  // rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
    for (int i=0; i<num; i++) {
      x[i] += dx[i];
      y[i] += dy[i];
      }


  float max = 1.5;
  float min = 0.5;

  /* When the shape hits the edge of the window, 
   * it reverses its direction and changes velocity
   */
   
     for (int j=0; j<num; j++) {
          if (x[j] > width-100 || x[j] < 100) {
          dx[j] = dx[j] > 0 ? -random(min, max) : random(min, max);
          }
          if (y[j] > height-100 || y[j] < 100) {
          dy[j] = dy[j] > 0 ? -random(min, max) : random(min, max);
          }
  
  float bx = 0;
  float by = 0;
          
          if (j<num-1) {
           bx = x[j] + 100 * sin(rad);
           by = y[j] + 100 * cos(rad);
          }
          
  fill(random(255), random(255), random(255));

  float radius = 200 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*random(2));
  float handY = by + radius * cos(rad*random(2));
  
  stroke(255,255,0, 50);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 10, 10);
  
  if (mousePressed == true) {
    stroke(random(255),random(255),random(255), 50);
    line(bx, by, handX, handY);
    rect(handX, handY, 20, 20);
        }  
      }
  
  if (keyPressed == true && key == 's') {
    saveFrame("Spinning Tops.jpg");
  }
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}
