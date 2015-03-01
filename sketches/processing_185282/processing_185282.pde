
int x1, x2, y1, y2;
float xEye1;
float xEye2;
float yEye1;
float yEye2;
int c1,c2,c3;


void setup(){
  size (640, 480);
}

void draw(){
  background(255);
  fill(255,0,0);
  stroke(255,0,0);
  
  ellipse(200,200,100,100);
  ellipse(400,200,100,100);
  
  
  
  x1=0;
  y1=0;
  x2=0;
  y2=0;
  
  xEye1 = map(x1+mouseX, 0, 639, 175, 230);
  yEye1 = map(y1+mouseY, 0, 639, 160, 260);
   
  xEye2 = map(x2+mouseX, 0, 639, 375, 430); 
  yEye2 = map(y2+mouseY, 0, 639, 160, 260);
  
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(xEye1, yEye1, 20, 20);
  ellipse(xEye2, yEye2, 20, 20);
  
  c1=0;
  c2=0;
  c3=0;
  
  fill(c1,c2,c3);
  stroke(c1,c2,c3);
  ellipse(300, 375, 150, 50);
  strokeWeight(3);
  line(150,150,250, 100);
  line(350,100,450,150);
  
  
}




