
 int xMouth = 100;
 int xBall = 15;
 int yBall = 15;
 int state = 0;
 int speed1 = 5;
 int speed = 10;

  float g = 0;
  float r = 0;
  float b = random(255);
  float a = random(255);

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  

}

void draw() {
  background(mouseY,mouseX,mouseX);
  int x = width/2;
  int y = height/2;
  int w1 = width/2;
  
   //draw moving ball
 noStroke();
 fill(r,g,b,a);
 ellipse(xBall,yBall,30,30);
 
 g = g + 2;
 r = r + 1;
 
 if (state == 0) {
   xBall = xBall + speed;
   if (xBall > width-15) {
   xBall = width-15;
   state = 1;
 }
} else if (state == 1) {
  yBall = yBall + speed;
  if (yBall > height - 15) {
    yBall = height - 15;
    state = 2;
  }
  } else if (state == 2) {
    xBall = xBall - speed;
    if (xBall < 15) {
      xBall = 15;
      state = 3;
    }
   } else if (state == 3) {
      yBall = yBall - speed;
      if (yBall < 15) {
        yBall = 15;
        state = 0;
      }
   }
 
   //draw TV's ears
  stroke(160);
  strokeWeight(3);
  line(x-40,y/2,pmouseX,pmouseY);
  line(x+40,y/2,pmouseX+80,pmouseY);
  
  //TV's body
  rectMode(CENTER);
  fill(255,150,50);
  rect(x,y,w1,w1);

 //draw TV's eyes
  float w2 = 80;
  while (w2 <= 80 && w2 > 0) {
    
  stroke(0);
  fill(w2);
  ellipse(x-50,y-30,w2,w2);
  ellipse(x+50,y-30,w2,w2);
  w2 = w2 - 10;
}
  
  //draw TV's nose
  stroke(255);
  fill(150);
  ellipse(width/2,height/2+20,25,40);
  
  //draw TV's mouth
  rectMode(CORNER);
  xMouth = xMouth + speed1;
  
  if ((xMouth > 3*width/4-50) || (xMouth < width/4)) {
    speed1 = speed1* -1;
  }
  
  stroke(0);
  fill(255,0,0);
  rect(xMouth,y+55,50,20);
  line(xMouth,y+65,100,y+65);
}
 

                
                
