
//Jenny Na
//DMS 11O
// EYEBALL MAP
//SOURCE: http://www.openprocessing.org/sketch/185500- created by Nick Kreuter
//source:http://www.openprocessing.org/sketch/185353-created by Tyler Ocwieja
// little bit hard to understood but I could understand through the classmates' work

int x,y;
float xIntheBox;
float yIntheBox;
int x_eye;
int y_eye;
int space;
  
void setup() {
  size(640,480);
}
 
void draw(){ 
  line(width/2,0,width/2,height);
  
  background(255);
  fill(0,0,0);

 x = mouseX;
 y = mouseY;
 x_eye = 250;
 y_eye= 250;
 space=125;
 //map(value,start1,stop1,start2,stop2)
  xIntheBox = map(x, 0, 639, x_eye-40+15, x_eye+40-15); //positions
  yIntheBox = map(y, 0, 479, y_eye-40+15, y_eye+40-15);
  ellipse(xIntheBox, yIntheBox, 30,30); // eye balls
  ellipse(xIntheBox+space,yIntheBox, 30,30);
  noFill();
  ellipse(x_eye+space,y_eye,90,90); 
  ellipse(x_eye,y_eye,90,90);
}
