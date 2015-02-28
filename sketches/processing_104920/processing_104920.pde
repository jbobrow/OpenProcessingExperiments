
void setup() {
  size(763,758);
  background(255);
  stroke(0);
  strokeWeight(11);
  colorMode(RGB);
}

void draw() {
  int x1,x2,x3,x4,x5,x6;
  int y1,y2,y3,y4,y5,y6;
  
  x1=85;
  x2=183;
  x3=282;
  x4=476;
  x5=599;
  x6=722;
  
  y1=85;
  y2=281;
  y3=475;
  y4=573;
  y5=667;
  y6=723;
  
  noStroke();
  fill(255,220,0);
  rect(x4,0,x6-x4,y2);
  rect(0,y4,x1,height);
  fill(255,0,0);
  rect(x1,y1,x4-x1,y3-y1);
  rect(x6,y4,width-x6,height-y4);
  fill(0,0,30);
  rect(x1,y3,x3-x1,y5-y3);
  rect(x3,y5,x4-x3,y6-y5);
  fill(0,0,255);
  rect(x4,y4,x6-x4,y6-y4);
  stroke(0);
  
  //Make Grids
  line(0,y1,x6,y1);
  line(0,y2,x1,y2);
  line(x4,y2,x6,y2);
  line(0,y4,x1,y4);
  line(x3,y4,width,y4);
  line(x6,0,x6,height);
  line(x1,y1,x1,height);
  line(x2,0,x2,y1);
  line(x4,0,x4,y6);
  line(x1,y3,x6,y3);
  line(x1,y5,x4,y5);
  line(x3,y3,x3,height);
  line(x5,y2,x5,y3);
  line(x3,y6,x6,y6);
  
}




