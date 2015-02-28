
float x = 0;
float y = 50;
float size = 20;
float timerX;
float timerY;
float timerX2;
float timerY2;
float timerX3;
float timerY3;
float timerX4;
float timerY4;


void setup() {
  frameRate (1);
  size(900,900);       
  
  timerX = 0;     
  timerY = 50; 
  timerX2 = 0;
  timerY2 = 200;
  timerX3 = 0;
  timerY3 = 350;
  timerX4 = 0;
  timerY4 = 500;
  
  background (255);
      for(int y = 50; y <= 500; y += 150){
    for(int x = 0; x <=900; x += 60){
      y = constrain (y, 0, 500);
      stroke(255,255,255);
      fill(150, 200, y/4);
      rect(x, y, size, 150);
   }
 }
  }


void draw() {

  
  stroke(255);
  fill(255);
  rect(timerX,timerY,20,150);
  
   timerY = timerY;
   timerX = timerX + 60;
  
  if (timerX > width){
    rect(timerX2, timerY2, 20, 150);
    
    timerX2= timerX2+60;
    timerY2 = timerY2;
  }

  if (timerX2 > width){
    rect(timerX3, timerY3, 20, 150);
    
    timerX3= timerX3+60;
    timerY3 = timerY3;
  }
    if (timerX3 > width){
    rect(timerX4, timerY4, 20, 150);
    
    timerX4= timerX4+60;
    timerY4 = timerY4;
    }
     }



