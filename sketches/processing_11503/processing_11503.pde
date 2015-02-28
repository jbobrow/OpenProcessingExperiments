
int counter = 0;
int repeat = 10;
int x = -100;
int y = -100;
int rectWidth = 10;
int rectHeight = 10;

void setup(){
 size(600, 100);
 background(200,50,150);
frameRate(10);
}

void draw(){
 int multNumber = modulo(counter, repeat);
 moveRect(multNumber);
 noStroke();
 fill(10,80,130);
 ellipse(x, y, rectWidth, rectHeight);
 if (x > width){
 resetValues();
 }
 increaseCounter();
 }
int modulo(int ctr, int _repeat){
int m = ctr % _repeat;
return m;
}
 
void moveRect(int multNumber){
 y = rectHeight * multNumber;
 x += rectWidth;
}
 
void increaseCounter(){
 counter ++;
}
 
void resetValues(){
 background(220,10,150);
 x = 0;
 y = 0;
}

