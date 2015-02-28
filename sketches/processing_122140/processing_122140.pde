
int linelength = 5;
int angle = 0;
int wx = 100;
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
  
  frameRate(20);
  
  angle++ ;
  
  if(forwards){
    linelength++;
  }
  else {
    linelength--;
  }
  
    reverse(center_x+cx, center_y+cy);
  
   cx = linelength * cos(angle);
   cy = linelength * sin(angle);
  
  ellipse(center_x + cx, center_y + cy, wx, wx);
  line(center_x, center_y, center_x + cx, center_y + cy);
}

void reverse(float x_edge, float y_edge) {
  if(x_edge > 240 && y_edge > 240 && x_edge < 260 && y_edge < 260){
    stroke(0);
    fill(255,0,0);
     forwards = true; 
}
  else if (x_edge < -wx || y_edge < -wx || x_edge > width + 2 * wx || y_edge > height + 2 * wx) {
    stroke(204);
    fill(204);
    forwards = false;
  }
}


