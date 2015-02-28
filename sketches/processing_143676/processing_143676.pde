
void setup(){
  size (300,300);
}  

void drawRect(int x, int y) {
  fill(250, 102, 20);
  rect(x, y, 50, 60);
}
void drawTri(int x1, int y1, int angle){
  pushStyle();
  fill(150, 102, 20);
  rotate(PI/angle);
  triangle(x1,y1,x1-20,y1-40,x1+20,y1);
  popStyle();
  //rotate(-1*PI/angle);
  //triangle(x1, y1, x2, y2, x3, y3);
}

void draw(){
  background(240, 190, 0);
  
  stroke(234,64,20);
  strokeWeight(1);
  int start_x = 10;
  int start_y = 100;
  int end_x = 240;
  int end_y = 270;
  for (int j = 0; j < 30; j++) {
    line(start_x, start_y, end_x,end_y);
    start_x = start_x + 10;
    start_y = start_y - 5;
    end_x = end_x - 10;
    end_y = end_y - 5;
  }
  pushStyle();
  strokeWeight(random(10));
  for (int k = 0; k < 10; k++) {
    point(random(50), random(50));
  }
  popStyle();
  
  noStroke();
  fill(234,64,20);
  ellipse(300,300,200,200);
  fill(150, 100, 30);
  ellipse(300,300,random(200),random(200));
  
  drawRect(220, 30);
  drawRect(230, 100);
  drawRect(250, 170);
  
  //tri
  int x = 250;
  int y = 15;
  int angle = 30;
  //int increment = 1;
  for (int i = 0; i < 10; i++) {
    drawTri(++x,--y, ++angle);
    
  }
}

  


