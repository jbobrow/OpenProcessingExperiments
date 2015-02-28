
int linelength = 5;
int angle  = 0;
int wx = 100;
int wy = 100;
int center_x;
int center_y;
boolean forwards = true;
float cx = 0;
float cy = 0;

void setup() {
  size(500,500);
  center_x = width/2;
  center_y = height/2;
}

void draw() {
  
//  background(204);
  
  angle++ ;
  
  if(forwards){
    linelength++;
    reverse(center_x+cx, center_y+cy);
  }
  else {
    linelength--;
    reverse(center_x+cx, center_y+cy);
  }
  
   cx = linelength * cos(angle);
   cy = linelength * sin(angle);
  
  ellipse(center_x + cx, center_y + cy, wx, wy);
  println(center_x + cx + " : " + center_y + cy);
}

void reverse(float x_edge, float y_edge) {
  if(x_edge > 240 && y_edge > 240 && x_edge < 260 && y_edge < 260){
    fill(255,0,0);
     forwards = true; 
}
  else if (x_edge < 0 || y_edge < 0 || x_edge > width || y_edge > height ) {
    fill(0,255,0);
    forwards = false;
  }
}


