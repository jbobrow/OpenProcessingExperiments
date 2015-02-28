
int [] [] points = {{1, 2}, {2, 0}, {3, 2}, {4, 0}, {5, 2}, {6, 0}, {7,2}, {8, 0}, {9, 2}, 
{8, 4}, {7, 2}, {6, 4}, {5, 2}, {4, 4}, {3,2}, {2, 4}, {1, 2}, {0, 4}, 
{1, 6}, {2, 4}, {3, 6}, {4, 4}, {5, 6}, {6, 4}, {7,6}, {8, 4}};

float [] rx = new float [points.length] ;
float [] ry = new float [points.length] ;
float scalelength = 40;
float rrange_x1 ;
float rrange_x2;
float rrange_y1;
float rrange_y2;


void setup() {
  size (500, 300);
//  frameRate(.1);
  strokeWeight(.5);
  smooth ();
}



void draw() {
  background (170);
  fill(125,100);
  stroke(255);  
  
  if (mouseX < width/9) {
    rrange_x1 = 0;
  } else if (mouseX < 2*width/9) {
    rrange_x1 = 5;
  } else if (mouseX < 3*width/9) {
    rrange_x1 = 10;
  } else if (mouseX < 4*width/9) {
    rrange_x1 = 15;
  } else if (mouseX < 5*width/9) {
    rrange_x1 = 20;
  } else if (mouseX < 6*width/9) {
    rrange_x1 = 25;
  } else if (mouseX < 7*width/9) {
    rrange_x1 = 30;
  } else if (mouseX < 8*width/9) {
    rrange_x1 = 35;
  } else {
    rrange_x1 = 40;
  }
  
  if (mouseY < width/9) {
    rrange_y1 = 0;
  } else if (mouseY < 2*width/9) {
    rrange_y1 = 5;
  } else if (mouseY < 3*width/9) {
    rrange_y1 = 10;
  } else if (mouseY < 4*width/9) {
    rrange_y1 = 15;
  } else if (mouseY < 5*width/9) {
    rrange_y1 = 20;
  } else if (mouseY < 6*width/9) {
    rrange_y1 = 25;
  } else if (mouseY < 7*width/9) {
    rrange_y1 = 30;
  } else if (mouseY < 8*width/9) {
    rrange_y1 = 35;
  } else {
    rrange_y1 = 30;
  }  
  
  rrange_x2 = -1*rrange_x1;
  rrange_y2 = -1*rrange_y1;
  
  
  pushMatrix() ;
  translate (70, 30);
    for (int i = 0; i < points.length ; i++) {
      rx [i] = random(rrange_x2, rrange_x1);
      ry [i] = random(rrange_y2, rrange_y1);
    }
  
    beginShape(TRIANGLE_STRIP);
      for (int i = 0 ; i < 9; i++) {
        vertex (points [i] [0]*scalelength + rx[i], points [i] [1]*scalelength + ry[i]);
      }
    endShape();
    beginShape(TRIANGLE_STRIP);
      for (int i = 8 ; i < 18; i++) {
        vertex (points [i] [0]*scalelength + rx[i], points [i] [1]*scalelength + ry[i]);
      }
    endShape();
    beginShape(TRIANGLE_STRIP);
      for (int i = 17 ; i < points.length; i++) {
        vertex (points [i] [0]*scalelength + rx[i], points [i] [1]*scalelength + ry[i]);
      }
    endShape();
    
    int s = int (random(1, points.length-3));
    int s2 = int (random(1, points.length-3));
    
    noStroke();
    fill(0);
    triangle( points[s][0]*scalelength + rx[s], points[s][1]*scalelength + ry[s], points[s+1][0]*scalelength + rx[s+1], points[s+1][1]*scalelength + ry[s+1], points[s+2][0]*scalelength + rx[s+2], points[s+2][1]*scalelength + ry[s+2]);
    fill(50);
    triangle( points[s][0]*scalelength + rx[s], points[s][1]*scalelength + ry[s], points[s-1][0]*scalelength + rx[s-1], points[s-1][1]*scalelength + ry[s-1], points[s+1][0]*scalelength + rx[s+1], points[s+1][1]*scalelength + ry[s+1]);
    fill(80);
    triangle( points[s+1][0]*scalelength + rx[s+1], points[s+1][1]*scalelength + ry[s+1], points[s+2][0]*scalelength + rx[s+2], points[s+2][1]*scalelength + ry[s+2], points[s+3][0]*scalelength + rx[s+3], points[s+3][1]*scalelength + ry[s+3]);
    fill(0);
    triangle( points[s2][0]*scalelength + rx[s2], points[s2][1]*scalelength + ry[s2], points[s2+1][0]*scalelength + rx[s2+1], points[s2+1][1]*scalelength + ry[s2+1], points[s2+2][0]*scalelength + rx[s2+2], points[s2+2][1]*scalelength + ry[s2+2]);
    fill(50);
    triangle( points[s2][0]*scalelength + rx[s2], points[s2][1]*scalelength + ry[s2], points[s2-1][0]*scalelength + rx[s2-1], points[s2-1][1]*scalelength + ry[s2-1], points[s2+1][0]*scalelength + rx[s2+1], points[s2+1][1]*scalelength + ry[s2+1]);

            
  popMatrix() ;
  noLoop ();
//  saveFrame();
}

void mousePressed() {
  redraw ();
}


