
int x,y;
int dx=1,dy=1;
int screenHeight=500;
int screenWidth=500;
int sz = 10;
int barX1=10, barY=screenHeight/2;
int barX2=50;
int score=0;

void setup(){
  size(screenWidth,screenHeight);
  fill(255);
  stroke(255);
  frameRate(100);
  smooth();
  x=int(random(0,screenWidth));
  y=int(random(0,screenHeight));
}

void draw(){
  
 background(0);
 line(barX1,barY,barX2,barY);
 ellipse(x,y,sz,sz);

 //detect if ball hit left and right side
 if(x<=sz/2 || x>=screenWidth-sz/2)
   dx=-dx;
   
 //detect if ball hit top and bottom 
 if(y<=sz/2 || y>=screenHeight-sz/2)
   dy=-dy;
 
 //detect if bar hits ball
 if((y==barY-sz/2 || y==barY+sz/2 ) && (x>barX1 && x<barX2))
   {
      dx=-dx;
      dy=-dy;
      println(++score);
   }
 
 x+=dx;
 y+=dy;
}


void keyPressed() {  
  if (key == CODED) {
    if (keyCode == LEFT) {
      barX1-=10;
      barX2-=10; 
    } else if (keyCode == RIGHT) {
      barX1+=10;
      barX2+=10; 
    } else if (keyCode == UP) {
      barY-=10;
    } else if (keyCode == DOWN) {
      barY+=10;
    }    
  }
}

                
                
