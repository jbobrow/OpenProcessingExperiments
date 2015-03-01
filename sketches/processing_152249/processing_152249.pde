
/*
 * Written for the FL Creative Coding Course of Monash University
 * by Luvi, June 20th 2014
 *
 * This sketch draws random beams that change direction 
 * randomly when they bounce off the sides of the window
 * and change colour based on their relative positions.
 *
 * Press 's' to save a frame as image.
 *
 */

// declare variables and arrays

float[] x; // position of centre ?
float[] y;
float[] dx; // change of position per frame
float[] dy;
int num; // number of circles
int rad; // radius of circles
float proximity; // threshold distance between elements

void setup () {
  
  // size of display window
  size(500,500);
  // clear screen
  background (random(100,200));
  
  num = 9;
  proximity = random(50,200); 
  rad = 20;
  
  // allocate arrays
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  
  // initialise
  for (int i=0; i<num; i++) {
    
    //random starting position and direction
    x[i] = random(width-50);
    y[i] = random(height-50);
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    
   }
  
  }
  
void draw () {
  
  for (int i=0; i<num; i++) {
    
    // change position
    x[i] += dx[i];
    y[i] += dy[i];
    
    // change direction when bouncing off margins
    if (x[i] >= width || x[i] <= 0) {
      dx[i] = dx[i] > 0 ? -random(1) : random(1);
      }
    if (y[i] >= height || y[i] <= 0) {
      dy[i] = dy[i] > 0 ? -random(1) : random(1);
      }
    
    // draw elements
    strokeWeight(20);
    stroke(255,255,0, 20);
    ellipse(x[i],y[i], rad,rad);
    
    for (int a=0; a<num; a++) {
        for (int b=0; b<a; b++) {
        
        float d = dist(x[a], y[a], x[b], y[b]);
        if (d < proximity && d > proximity/2) {
          stroke(50,10,255, 20);
          ellipse(x[a],y[a], rad,rad);
          }
        if (d < proximity/2) {
          stroke(255,0,0, 20);
          ellipse(x[a],y[a], rad,rad);
          }
        }
    }
    
    }
    
  if (keyPressed == true && key == 's') {
      saveFrame("Beams.jpg");
      }
  
  }
