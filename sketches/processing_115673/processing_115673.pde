
int X1 = 60;
int Y1 = 150;
boolean reverseX1 = false;
boolean reverseY1 = false;
 
int X2 = 350;
int Y2 = 100;
boolean reverseX2 = true;
boolean reverseY2 = false;
 
void setup() {
  size(500, 500);
}
 
void draw() {
  background(247, 157, 180);
  fill(250, 240, 242);
  noStroke();
  for(int i = 0; i < 50; i++ ) {
    for(int j = 0; j < 50; j++ ) {
      ellipse(i*10+5, j*10+5, 10, 10);
         }
      }

  noStroke();
  fill(21, 0, 5);
  ellipse(X1, Y1, 50, 50);
  
  //directions
  if(X1 >= 475) {
    reverseX1 = true;
  }
  if(X1 <= 25) {
    reverseX1 = false;
  }
  if(Y1 >= 475) {
    reverseY1 = true;
  }
  if(Y1 <= 25) {
    reverseY1 = false;
  }
  if(reverseX1) {
    X1-=1;
  }else{
    X1+=1;
  }
  if(reverseY1) {
    Y1-=1;
  }else{
    Y1+=1;
  }
  //The second object 
  fill(167, 27, 45);
  ellipse(X2, Y2, 40, 40);
  //directions
  if(X2 >= 480) {
    reverseX2 = true;
  }
  if(X2 <= 20) {
    reverseX2 = false;
  }
  if(Y2 >= 480) {
    reverseY2 = true;
  }
  if(Y2 <= 20) {
    reverseY2 = false;
  }
  if(reverseX2) {
    X2-=4;
  }else{
    X2+=4;
  }
  if(reverseY2) {
    Y2-=5;
  }else{
    Y2+=5;
  }
  
    
  
 }



