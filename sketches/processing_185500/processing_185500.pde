
//Nick Kreuter
//DMS110
//HW 3
// make eyes sing map

int x,y;
float xIntheBox;
float yIntheBox;
float cR,cG,cB;
int x_EyePosition;
int y_EyePosition;


void setup() {
  size(640,480);
}

void draw(){
  background(255);
  fill(0,0,255);
 x = mouseX;
 y = mouseY;
 x_EyePosition = 200;
 y_EyePosition = 200;

  xIntheBox = map(x,0,639,x_EyePosition-50+18,x_EyePosition+50-18); //value, start1, stop1, start2, stop2
  yIntheBox = map(y,0,479,y_EyePosition-50+18,y_EyePosition+50-18);
  println(frameRate);
  ellipse(xIntheBox+111,yIntheBox,20,20);
  ellipse(xIntheBox,yIntheBox,20,20);
  noFill();

  ellipse(x_EyePosition+111,y_EyePosition,100,100);
  ellipse(x_EyePosition,y_EyePosition,100,100);
}
