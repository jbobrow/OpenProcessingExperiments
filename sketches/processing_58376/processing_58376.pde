
float circleSize = 0;

void setup() {
  size (600, 500);
}

void draw () {
  
  drawRect (0,0, 15, 500, color(253, 235, 89) );
  drawRect (15,0, 5, 500, color(212 , 68, 33) );
  drawRect (20,0, 15, 500, color(253, 235, 89) );
  drawRect (25,0, 15, 500, color(212 , 68, 33) );
  drawRect (30,0, 10, 500, color(252 , 127, 1) );
  drawRect (40,0, 15, 500, color(212 , 68, 33) );
  drawRect (50,0, 15, 500, color(192 , 0, 0) );
  drawRect (60,0, 15, 500, color(253, 235, 89) );
  drawRect (75,0, 15, 500, color(204, 102, 0) );
  drawRect (85,0, 15, 500, color(192 , 0, 0) );
  drawRect (90,0, 10, 500, color(212 , 68, 33) );
  
  drawRect (100,0, 15, 500, color(253, 235, 89) );
  drawRect (115,0, 5, 500, color(204, 102, 0) );
  drawRect (120,0, 15, 500, color(253, 235, 89) );
  drawRect (125,0, 15, 500, color(212 , 68, 33) );
  drawRect (130,0, 10, 500, color(252 , 127, 1) );
  drawRect (140,0, 15, 500, color(204, 102, 0) );
  drawRect (150,0, 15, 500, color(192 , 0, 0) );
  drawRect (160,0, 15, 500, color(253, 235, 89) );
  drawRect (175,0, 15, 500, color(204, 102, 03) );
  drawRect (185,0, 15, 500, color(192 , 0, 0) );
  drawRect (190,0, 10, 500, color(252 , 127, 1) );
  
  drawRect (200,0, 15, 500, color(253, 235, 89) );
  drawRect (215,0, 5, 500, color(252 , 127, 1) );
  drawRect (220,0, 15, 500, color(253, 235, 89) );
  drawRect (225,0, 15, 500, color(212 , 68, 33) );
  drawRect (230,0, 10, 500, color(252 , 127, 1) );
  drawRect (240,0, 15, 500, color(212 , 68, 33) );
  drawRect (250,0, 15, 500, color(192, 0, 0) );
  drawRect (260,0, 15, 500, color(253, 235, 89) );
  drawRect (275,0, 15, 500, color(212 , 68, 33) );
  drawRect (285,0, 15, 500, color(192 , 0, 0) );
  drawRect (290,0, 10, 500, color(212 , 68, 33) );
  
  drawRect (300,0, 15, 500, color(204, 102, 0) );
  drawRect (315,0, 5, 500, color(212 , 68, 33) );
  drawRect (320,0, 15, 500, color(253, 235, 89) );
  drawRect (325,0, 15, 500, color(212 , 68, 33) );
  drawRect (330,0, 10, 500, color(253, 235, 89) );
  drawRect (340,0, 15, 500, color(212 , 68, 33) );
  drawRect (350,0, 15, 500, color(192 , 0, 0) );
  drawRect (360,0, 15, 500, color(253, 235, 89) );
  drawRect (375,0, 15, 500, color(212 , 68, 33) );
  drawRect (385,0, 15, 500, color(192 , 0, 0) );
  drawRect (390,0, 10, 500, color(212 , 68, 33) );
  
  drawRect (400,0, 15, 500, color(253, 235, 89) );
  drawRect (415,0, 5, 500, color(212 , 68, 33) );
  drawRect (420,0, 15, 500, color(253, 235, 89) );
  drawRect (425,0, 15, 500, color(212 , 68, 33) );
  drawRect (430,0, 10, 500, color(252 , 127, 1) );
  drawRect (440,0, 15, 500, color(212 , 68, 33) );
  drawRect (450,0, 15, 500, color(192 , 0, 0) );
  drawRect (460,0, 15, 500, color(253, 235, 89) );
  drawRect (475,0, 15, 500, color(212 , 68, 33) );
  drawRect (485,0, 15, 500, color(192 , 0, 0) );
  drawRect (490,0, 10, 500, color(252 , 127, 1) );
  
  drawRect (500,0, 15, 500, color(253, 235, 89) );
  drawRect (515,0, 5, 500, color(252 , 127, 1) );
  drawRect (520,0, 15, 500, color(252 , 127, 1) );
  drawRect (525,0, 15, 500, color(212 , 68, 33) );
  drawRect (530,0, 10, 500, color(204, 102, 0) );
  drawRect (540,0, 15, 500, color(212 , 68, 33) );
  drawRect (550,0, 15, 500, color(192 , 0, 0) );
  drawRect (560,0, 15, 500, color(252 , 127, 1) );
  drawRect (575,0, 15, 500, color(253, 235, 89) );
  drawRect (585,0, 15, 500, color(204, 102, 0) );
  drawRect (590,0, 10, 500, color(252 , 127, 1) );
  
  
  fill(252 , 127, 1);
  ellipse(20,120,circleSize,circleSize);
  circleDraw (20,120,30,color (192 , 0, 0));
  circleDraw (20,120,10,color (255));
  
  fill(192 , 0, 0);
  ellipse(145,400,circleSize,circleSize);
  circleDraw (145,400,130,color (253, 235, 89));
  circleDraw (145,400,110,color (252 , 127, 1));
  circleDraw (145,400,25,color (255));
  
  fill(192 , 0, 0);
  ellipse(350,100,circleSize,circleSize);
  circleDraw (350,100,100,color (252 , 127, 1));
  circleDraw (350,100,90,color (253, 235, 89));
  
  fill(204, 102, 0);
  ellipse(250,250,circleSize,circleSize);
  circleDraw (250,250,50,color (192 , 0, 0));
  
  fill(255);
  ellipse(200,20,circleSize,circleSize);
  circleDraw (200,20,65,color (253, 235, 89));
  circleDraw (200,20,25,color (252 , 127, 1));
  
  fill(253, 235, 89);
  ellipse(160,140,circleSize,circleSize);
  circleDraw (160,140,50,color (252 , 127, 1));
  
  fill(204, 102, 0);
  ellipse(400,140,circleSize,circleSize);
  circleDraw (400,140,50,color (192 , 0, 0));
  
  fill(255);
  ellipse(500,440,circleSize,circleSize);
  circleDraw (500,440,95,color (204, 102, 0));
  
  fill(204, 102, 0);
  ellipse(520,300,circleSize,circleSize);
  circleDraw (520,300,135,color (253, 235, 89));
  circleDraw (520,300,35,color (192 , 0, 0));
  
  fill(255);
  ellipse(320,300,circleSize,circleSize);
  circleDraw (320,300,90,color (252 , 127, 1));
  circleDraw (320,300,40,color (253, 235, 89));
  
  if (circleSize>700)
  circleSize=0;
  
 circleSize = circleSize + 1;
 }


void drawRect (int xpos, int ypos, int width, int height, color c) {
  noStroke();
  fill (c);
  rect (xpos, ypos, width, height);
}

void circleDraw (int xpos,int ypos,int circle, color c) {
fill (c);
ellipse(xpos,ypos,circle,circle);
 
}

