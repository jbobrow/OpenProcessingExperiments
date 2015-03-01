
int x,y;
float xIntheBox;
float yIntheBox;

void setup(){ 
 size (640,480); 
}

void draw (){ //updated every frame
  background(255);
  fill (255,0,0);
  //map(value, start1,stop1, start2, stop2)
  x = mouseX;
  y = mouseY;
  xIntheBox = map(x, 0,639, 154,350);
  yIntheBox = map(y,0,479, 118, 108+140); 
  println(frameRate);
  ellipse(xIntheBox,yIntheBox, 20,20);
  noFill();
  rect(144,108,216,150);
}
