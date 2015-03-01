
// Tyler Ocwieja
// DMS110: HW3
// 2-10-15

int x,y;
float xIntheBox;
float yIntheBox;
int x_cord;
int y_cord;
int spacing;
float cR;


void setup(){
  size(640,480);
}

void draw(){
  background(255);
  fill (255, 0, 0);
  x = mouseX; // dont even have to know the values this does it for you
  y = mouseY;
  x_cord = 250; // can change these values to move position of eyes
  y_cord = 200;
  spacing = 150; // changes spacing of eyes
  // map(value,start1,stop1,start2,stop2)
  xIntheBox = map(x, 0, 639, x_cord-35+16, x_cord+35-16);   // map(value,window size, window size,start value of rec,start value plus width)
  yIntheBox = map(y, 0, 479, y_cord-35+16, y_cord+35-16);
  ellipse(xIntheBox, yIntheBox, 20, 20); // Pupils
  ellipse(xIntheBox+spacing,yIntheBox, 20, 20);
  noFill();
  ellipse(x_cord,y_cord,70,70); // x-po,y-po, x-size, y-size
  ellipse(x_cord+spacing,y_cord, 70, 70);
}
