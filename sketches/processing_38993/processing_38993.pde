

Word myWord;

PFont myfont;

void setup() {
 size(600, 600);
 smooth();
 fill(0);  
 myfont = loadFont("CooperBlack-48.vlw");
 textFont (myfont, 48);
 textAlign(CENTER);
 background(255);
 myWord = new Word(200,200);
}
 
void draw() 
{
  background(255);
 
 
 myWord.run();
}

class Word {
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;
 
 Word(float _x, float _y){
   
   x = _x;
   y = _y;
   
 }
 
 void run(){
   display();
   move();
   bounce();
   gravity();
 }
 
 void gravity(){
   speedY+= 0.2;
 }
 
 void bounce(){
   if(x > width){
     speedX = speedX * -1;
   }
   if(x < 0){
     speedX = speedX * -1;
   }
   if(y > height){
     speedY = speedY * -1;
   }
   if(y < 0){
     speedY = speedY * -1;
   }
 }
 
 void move(){
   
   x += speedX;
   y += speedY;
 }
 
 void display(){
  
 text("Bounce", x, y);

 } 
}

