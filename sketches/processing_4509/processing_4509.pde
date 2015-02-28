
int vierkantX = 180;
int vierkantY = 380;
int circleX = 300;
int circleY = 200;
int dreieckX = 30;
int dreieckY = 75;

void setup()
{size (640,640);
 smooth();
 
 frameRate(30);

}

void draw()
{ 
  background(0,204,100);
  
  // weg 
  
  line(0,0, 700, 700);
  line(0,0,400,700);
  line(0,0,300,700);
  line(0,0,200,700);
  line(0,0,100,700);
  line(0,0,500,700);
  line(0,0,600,700);
  line(0,0,800,700);
  line(0,0,900,700);
  line(0,0,1000,700);
  line(0,0,1100,700);
  line(0,0,1200,700);
  
  
  // objects 
  
  
  fill(220, 75, 0);
  ellipse(circleX,circleY,200,200);
  
  fill(0, 126, 255);
  rect(vierkantX,vierkantY, 250, 250);
  
  fill(20,200,80);
  triangle(dreieckX,dreieckY, 58, 20, 86, 75);
}

