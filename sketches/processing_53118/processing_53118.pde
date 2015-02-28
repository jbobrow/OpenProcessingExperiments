
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;
float x6;
float y6;
float x7;
float y7;
float x8;
float y8;
float x;
float y;
float xx1 = 0;
int time1 = 1000; 
int time2 = 3000;

void setup(){
background(56, 55, 62, 200);
size(600,600);
frameRate(50);
  x1 = 300;
  y1 = 300;
  x2 = 300;
  y2 = 300;
  x3 = 300;
  y3 = 300;
  x4 = 300;
  y4 = 300;
  x5 = 300;
  y5 = 300;
  x6 = 300;
  y6 = 300;
  x7 = 300;
  y7 = 300;
  x8 = 300;
  y8 = 300;
  }
  
  
  
  void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void draw(){
  
  x1 = x1+ random(-10,10);
  y1 = y1 +random(-10, 10);
  x3 = x3+random(-10, 10);
  y3 = y3+random(-10,10);
  x5 = x5+random(-10,10);
  y5 = y5+random(-10,10);
  x7 = x7+random(-10,10);
  y7 = y7+random(-10,10);

  x1 = constrain(x1,0,width*2);
  y1 = constrain(y1, 0, height);
  x3=  constrain(x3, 0, width);
  y3 = constrain(y3,0,height);
  x5 = constrain(x5, 0, width);
  y5 = constrain(y5, 0, height);
  x7 = constrain(x7, 0, width);
  y7 = constrain(y7, 0, height);

  stroke(129, 35, 35, 200);
  strokeWeight(.5);
  strokeCap(SQUARE);
  line(x1, y1, x2, y2);
  
  stroke(0, 0, 0, 200);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(x3,y3,x4,y4);
  
  stroke(128);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(x5, y5, x6, y6);
  
  stroke(154, 243, 201,200);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(x7, y7, x8, y8);
  x2 = x1;
  y2 = y1;
  x4 = x3;
  y4 = y3;
  x6 = x5;
  y6 = y5;
  x8 = x7;
  y8 = y7;
  
  x = x + random(-10, 10);
  y = y + random(-10, 10);
  
  stroke(154, 243, 201,200);
  strokeWeight(7);
  ellipse(x, y, 12, 12);  
  
  stroke(51, 52, 59, 200);
  strokeWeight(1);
  triangle(30, 2, 60 ,2, x, y);
 
  noFill(); 
  //stroke(154, 243, 201,200);
  stroke(1, 12, 10, 200);
  strokeWeight(1);
  ellipse(x, y, 12, 12);

  
  triangle(x, y, 520, 20, 510, 60);
  ellipse(x, y, 12, 12);
  noFill();
  
  triangle(x, y, 300, 10, 290, 50);
  strokeWeight(2);
  noFill();
  stroke(91, 90, 100, 200);
  
  strokeWeight(2);
  triangle(300, 300, x, y, 300, 310);
  
  stroke(132, 160, 149, 200);
  ellipse(x, y, 8, 8);
  strokeWeight(1.5);
  
  ellipse(x, y, 20, 20);
  strokeWeight(1);
  
  stroke(255, 0, 0);
  ellipse(x+10, y+10, 10, 10);
  stroke(254, 255, 72);
 

  
  int currentTime = millis(); 
  if (currentTime < time2) {
    xx1 += 0.5;
  } 
  else if (currentTime > time1) {
    xx1 += 6; 
  }
  strokeWeight(1);
  stroke(147, 145, 160, 200);
  line(xx1, 10, 40, 40);
  line(30, 30, xx1, 70);
  line(10, 10, 30, xx1);
  line(30, xx1, 70, 70);
  line(30, 30, 80, xx1);
  line(xx1, 30, 100, 100);
  stroke(205, 211, 209, 200);
  line(xx1, 10, 30, 30);
  line(10, 10, xx1, 30);
  line(600,600,xx1, 70);
  line(600, 600, 40, xx1);
  
}
  

  
  
  





