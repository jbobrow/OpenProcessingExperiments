
/*
 
Pinak Saha
HW04
Visual Foundation Studio
Fall2013
(0408908)
 
Positions Drawn at random on a grid & grid is generated
through looping
 
*/


Timer timer;
Ball aBall;
 
void setup()
{
  size(800,800);
  background(000000);
  frameRate(10);
 
  aBall = new Ball();
  timer = new Timer(5000);
  timer.start();
}
 
void draw()
{
  background(000000);
  Compass aCompass = new Compass();
  textSize(36);
  fill(#1ABC9C);
  text("X: "+ aBall.posX,500,100);
  text("Y: "+ aBall.posY,650,100);
  
  textSize(16);
  text("Toggle X: "+ mouseX,500,150);
  text("Toggle Y: "+ mouseY,650,150);
  aBall.update();
 if (timer.isFinished())
 {
   aCompass.drawPos();
   
 }
  
    

  if(keyPressed == true)
  {
    aCompass.drawPos();
  }
  
  
  
}

class Ball
{
  
  float posX;
  float posY;
  float speedCounterX;
  float speedCounterY;
  void gridCollision()
  {
    if(this.posX >= 300)
    {
      this.speedCounterX = this.speedCounterX * -1;

    }
    if(this.posX <= 100)
    {
      this.speedCounterX = this.speedCounterX * -1;
      
    }
    
    if(this.posY <= 100)
    {
      this.speedCounterY = this.speedCounterY * -1;
      
    }
    if(this.posY >= 300)
    {
      this.speedCounterY = this.speedCounterY * -1;
    }
  }
  
  void update()
  {
    this.posX = posX + speedCounterX ;
    this.posY = posY + speedCounterY ;
    fill(#3498DB);
    stroke(#3498DB);
    ellipse(this.posX,this.posY,10,10);
    gridCollision();
  }
  Ball()
  {
    posX = (400/2);
    posY = (400/2);
    fill(#3498DB);
    stroke(#3498DB);
    ellipse(posX,posY,10,10);
    speedCounterX = 25;
    speedCounterY = 15;
  }
}
class Compass
{

  void drawOutter()
  {
    stroke(#00ffff);
    fill(000000);
    strokeWeight(5);
    ellipse(200,200,400,400);
  }
  void drawInner()
  {
     //iner circle
      fill(000000);
      if(mousePressed == true)
      {
        fill(random(0,255));
      }
      stroke(#00ffff);
      strokeWeight(5);
      ellipse(200,200,300,300);

  }
  
  void drawAxis()
  {
    stroke(#00ffff);
    strokeWeight(5);
    line(200,350,200,50);
     
    stroke(#00ffff);
    strokeWeight(5);
    line(50,200,350,200);
     
    stroke(#00ffff);
    strokeWeight(5);
    fill(#00ffff);
    //(x1,y1,x2,y2)
    line(100,300,300,100);

  }
  
  void drawAxisPosition()
  {
      PFont HelveticaNeue;
      HelveticaNeue = loadFont("HelveticaNeue-Light-36.vlw");
      textSize(36);
      textFont(HelveticaNeue);
      fill(#00ffff);
      textSize(36);
      text('N',185,40);
      text('E',360,215);
      text('S',190,385); 
      text('W',10,215);
  }
  
  void drawGrid()
  {
      for(int x=100; x < 300; x = x+10)
      {
        for(int y =100; y < 300; y = y+10)
       
        {       
           stroke(#00ffff);
           strokeWeight(1);
           line(x,y,300,y);
           line(x,y,x,300);
        }
      }

  }
  
  void drawTrueNorth()
  {
     stroke(#ff0000);
     strokeWeight(3);
     fill(#ff0000);
     
      line(300,250,100,150);
      //rotate(PI/2);  
  
  }
  
  
  void drawPos()
  {
          fill( random(200,255), random(200,255), random(200,255), random(200,255));
          textSize(random(24,36));
          float [] positions = new float[10];
          for(int i =0; i<10;i++)
          {
            positions[i] = random(100,300);
          }
          String temp = "";
            for(int i = 0; i<10;i++)
            {
              temp = temp + positions[i] + ",";
            }
            
         
            text('X',positions[int(random(0,10))],positions[int(random(0,10))]);
             textSize(16);
             fill(#E67E22);
             text(temp,0,500);       
  } 
  
  void drawMCurrentPos()
  {
    fill( random(200,255), random(200,255), random(200,255), random(200,255));
    mouseX = constrain(mouseX,100,150);
    mouseY = constrain(mouseY,100,150);
    rect(mouseX,mouseY,mouseX,mouseY);
    
  }
  
    Compass()
  {
    
    //outer circle
     drawOutter();
     
    //inner circle
     drawInner();
     //axis
     drawAxis();
     drawAxisPosition();
      drawMCurrentPos();
     
      //Grid
      drawGrid();
      //draw redline
      drawTrueNorth();
  
  } 
}


class Timer {
 
  int startTime; 
  int totalTime; 
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  
  void start() {
    startTime = millis(); 
  }
  
 
  boolean isFinished() { 
    
    int passedTime = millis()- startTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


