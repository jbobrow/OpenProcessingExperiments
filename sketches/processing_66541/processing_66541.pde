
float ballX;
float ballY;
float speed;

PFont testFont;


boolean mouseOnRight;
 
void setup(){
  size(400, 400);
  noStroke();
  smooth();
   
  ballX=random(0, 385);
  ballY=random(0, 385);
   
  speed = 3;
  
   mouseOnRight = false;

}
 
void draw(){
  
  background(144,133,222);
  fill(248,239,98);
  ellipse(ballX, ballY, 30, 30);
  ballX += speed;
   
       
  if(ballX >= 385 || ballX <= 15) {
    speed*= -1;
  }
   
    if(ballX >= 385) {
      background(105,203,140);
      fill(0);
      testFont = loadFont("Monospaced-90.vlw");
      text("sad.", 40, 40);
  }
  
      if(ballX <= 15) {background(243,171,252)
    ;
  }
   
   
   
   
   
   
   
}


