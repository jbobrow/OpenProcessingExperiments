
int x;
int noHit1 = -20;
int firstHit1 = 100;
int secondHit1 = 200;
int thirdHit1 = 300;
int fourthHit1 = 400;

float ballSize = 100;
float ballSpeed = 5;

//background changes color when ball bounces
boolean firstHit = false;
boolean secondHit = false;
boolean thirdHit = false; 
boolean fourthHit = false; 

void setup() {
  size(500,500);
  int x = 20;
}
// changing background color
void draw() {
  background(255);
if (firstHit) {
  background(200,200,100);
}
 else if (secondHit) {
  background(150,0,150);
}
else if (thirdHit) {
  background(100,180,50);
}
 else if (fourthHit) {
  background(50,50,190);
 
}
//ball draw
fill(100,50,150); 
ellipse(firstHit1,firstHit1, ballSize, ballSize);
}
// background changes color when ball hits location
void mousePressed() {
  if (firstHit1 == 100) {
    firstHit = true;
  }
   if (secondHit1 == 200){ 
     secondHit= true;
   }
   if (thirdHit1 == 300){
     thirdHit= true;
   }
  if (fourthHit1 == 400){
   fourthHit = true; 
  }
}
//ball bounce
void mouseReleased() {
  if (firstHit) {
    firstHit1 += ballSpeed; 
  }
  if (secondHit) {
    secondHit1 += ballSpeed;
  }
  if (thirdHit) {
    thirdHit1 += ballSpeed;
  }
  if (fourthHit) {
    fourthHit1 += ballSpeed;
  }
}









  
  






