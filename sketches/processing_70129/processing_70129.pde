
import processing.pdf.*;
void setup()
{	
  //size(1024, 768, PDF, "wallpaper.pdf");
  size(700, 700); 
  smooth();
  background(0);
  stroke(255);
  stroke(random(255), random(255), random(255));
  for(int i = 40; i < width; i += 80) {
    for(int j = 40; j < height; j+= 80) {
    //  stroke(random(255), random(255), random(255));
      int ssize = round(random(20, 160));
      drawSphere(i, j, ssize);
    }
  }
 // exit();
}

void drawSphere(int x, int y, int ssize) {
  noFill();
  
  if(round(random(1)) == 1) { stroke(random(255), random(255), random(255));
    for (int i = 0; i <= ssize; i+=10) {
      arc(x, y, i, ssize, radians(90), radians(270));//x,y,width,height, angle start, angle end
    } 
  }
  if(round(random(1)) == 1) { 
    for (int i = 0; i <= ssize; i+=10) {
      arc(x, y, i, ssize, radians(270), radians(450));
    }
  }
  if(round(random(1)) == 1) {stroke(random(255), random(255), random(255));
    for (int i = 0; i <= ssize; i+=10) {
       arc(x, y, ssize, i, radians(0), radians(180));//x,y,width,height, angle start, angle end
     }
  }
  if(round(random(1)) == 1) {
     for (int i = 0; i <= ssize; i+=10) {
       arc(x, y, ssize, i, radians(180), radians(360));
     }
  }
}

