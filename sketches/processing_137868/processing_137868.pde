
class Fish{
  
 float x,y;
 
 Fish(float _x,float _y){
   x = _x;
   y = _y;
 }
 
 void display(){
   drawFish(x+0, y+0);
 }
 
 void race(){
   x = x + (random(0,10));
   drawFish(x,y);
 }
 
 void drawFish(float x, float y){
   noStroke();
   beginShape();
  vertex(x,y);
   vertex(x + 20, y);
   vertex(x + 2, y - 10);
   vertex(x + 23, y - 3);
   vertex(x + 6, y - 16);
   vertex(x + 30, y - 6);
   vertex(x + 18, y - 20);
   vertex(x + 40, y - 4);
   vertex(x + 60, y + 20);
   vertex(x + 70, y + 25);
   vertex(x + 90, y + 15);
   vertex(x + 110, y + 9);
   vertex(x + 130, y + 15);
   vertex(x + 160, y + 40);
   vertex(x + 170, y + 60);
   vertex(x + 120, y + 60);
   vertex(x + 170, y + 80);
  vertex(x + 150, y + 90);
  vertex(x + 120, y + 95);
  vertex(x + 90, y + 79);
  vertex(x + 40, y + 30);
  vertex(x+ 30, y + 10);
   endShape(CLOSE);
 }
}

Fish myFish;
Fish otherFish;
Fish lastFish;

void setup(){
  size ( 600, 600);

  myFish = new Fish(100,50);
  otherFish = new Fish(100, 170);
  lastFish = new Fish(100, 300);
}

void draw(){
    background(20, 25, 150);
    fill(255, 0, 0, 110);
    rect(550, 0, 25, 600);
    fill(0, 150, 100);
  myFish.display();
  otherFish.display();
  lastFish.display();
  if (keyPressed){
    myFish.race();
    otherFish.race();
    lastFish.race();
  }
}
  
