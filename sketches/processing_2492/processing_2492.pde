
/*

follow me
sean_velasco@hotmail.com
june 2009

*/

obstacle one = new obstacle();
obstacle two = new obstacle();
obstacle three = new obstacle();
obstacle four = new obstacle();



void setup(){
  
  size(600,600);
  fill(0,0,255);
  noStroke();

  frameRate(15);
  
  one.x = random(100,500);
  one.y = random(100,500);
  one.o = 15;
  
  two.x = random(100,500);
  two.y = random(100,500);
  two.o = 30;
  
  three.x = random(100,500);
  three.y = random(100,500);
  three.o = 20;
  
  four.x = random(100,500);
  four.y = random(100,500);
  four.o = 25;
  
  
};


void draw(){
  
  background(0,200,100);
  ellipse(mouseX,mouseY,20,20);
  one.drawObstacle();
  two.drawObstacle();
  three.drawObstacle();
  four.drawObstacle();
  fill(0,0,255);
  testRed();  

   
     
     
  
  
  
  
  
  
};

void testRed (){
  
     color theColor = get(mouseX, mouseY);
     float r =red(theColor);
     
     if (r < 255) {
       fill(0, 0, 255);
     } else {
         fill(255,0,0);}
  
  
};

