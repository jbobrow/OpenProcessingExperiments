
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 500;

int sec1 = 0;
int sec2 = 0;
int sec3 = 150;
int sec4 = 400;

int third1 = 0;
int third2 = 0;
int third3 = 300;
int third4 = 300;

int fourth1 = 0;
int fourth2 = 0;
int fourth3 = 450;
int fourth4 = 200;

int fifth1 = 0;
int fifth2 = 0;
int fifth3 = 600;
int fifth4 = 100;

void setup(){
  
  size(500,500);
  background(0);
  stroke(34,201,169,50);
  strokeWeight(2);
}

void draw(){
  
  line(x1,y1,x2,y2);
  y1 = y1 + 10;
  x2 = x2 + 10;
  
  line(sec1,sec2,sec3,sec4);
  sec2 = sec2 + 10;
  sec3 = sec3 + 10;
  
  line(third1,third2,third3,third4);
  third2 = third2 + 10;
  third3 = third3 + 10;
  
  line(fourth1,fourth2,fourth3,fourth4);
  fourth2 = fourth2 + 10;
  fourth3 = fourth3 + 10;
  
  line(fifth1,fifth2,fifth3,fifth4);
  fifth2 = fifth2 + 10;
  fifth3 = fifth3 + 10;
}

