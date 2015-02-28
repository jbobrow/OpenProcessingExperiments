
class Circle //Create a new class called Circle
{
  int value = 0;
  color c;
  float circleX;
  float circleY;
  float sizeX;
  float sizeY;
  float speedX;
  float speedY;

  Circle(color temp_c,float temp_size, float temp_speedX, float temp_speedY) {
//starting position of circles
c = temp_c;
circleX = mouseX;
circleY = mouseY;
sizeX = temp_size;
sizeY = temp_size;
speedX = temp_speedX;
speedY = temp_speedY;

  }
  
  void drawCircle(){
   stroke(0);
   fill(c);
   ellipseMode(CENTER);
   ellipse(circleX, circleY,sizeX,sizeY); 
  }
  void speedChange(){
    
     if(circleX >= width)
     {
       speedX = speedX * -1;
     
     }
     if(circleX <= 0)
     {
       speedX = speedX * -1;
     }
     
  if(circleY >= height)
     {
       speedY = speedY * -1;
       
     }
     if(circleY <= 0)
     {
       speedY = speedY * -1;
    }
    circleX = circleX + speedX;
    circleY = circleY + speedY;
  }
}

Circle Circle1;

//Circle Circle2;

 //sets up everytime the applet starts running
void setup() {
  size(600, 600);
  background(color(255,170,85));
  smooth();
 // Circle1 = new Circle(color(255),random(20),random(20),random(50),random(50),random(50));
 // Circle2 = new Circle(color(255),random(20),random(20),random(50),random(50),random(50));
}
// returns no value from the draw function 
void draw() {
  
   
  if (mousePressed) {   //function that creates a new circle at the mouse's X and Y position 
   
   //background(250,166,40);
    Circle1 = new Circle(color(random(229),(23),random(149)),random(50),random(50),random(50));
    Circle1.drawCircle();
    stroke(255);
  } else {
    stroke(0);
  }
  
  
}
 
  


/*
 
  Circle1.CircleX += Circle1.XCircle1.speed;
  Circle2 += circleASpeedY;
   
  circleBX += circleBSpeedX;
  circleBY += circleBSpeedY;

//if circle hits boundaries then velocity is set to negative value and circle goes in reverse direction
  if (Circle1.CircleX>width-xCircle/2||circleAX<xCircle/2) {
    Circle1SpeedA=circleASpeedX*-1;
    
  }
  if (CircleAY>height-xCircle/2||circleAY<xCircle/2) {
    circleASpeedY=circleASpeedY*-1;
  }
  if (circleBX>width-xCircle/2||circleBX<xCircle/2) {
    circleBSpeedX=circleBSpeedX*-1;
  }
  if (circleBY>height-xCircle/2||circleBY<xCircle/2) {
    circleBSpeedY=circleBSpeedY*-1;
  
  }
}
  

*/




