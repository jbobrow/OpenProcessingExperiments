
class Ball {
 
  float x, y, radius, vx, vy;
  int a, b, c, d;
  
  Ball(float xpos, float ypos, float r) {
   
   x = xpos;
   y = ypos;
   radius = r; 
    
  }
  
  void display(int a, int b, int c, int d) {
    fill(a, b, c, d);
    noStroke();
   ellipse(x, y, radius, radius);
    
  }

void checkL1() {
  if(tom.x > 150) {
  
         float angle = atan2(450-400, 350-150);
          float cosa = cos(angle);
          float sina = sin(angle);
          
          float x1 = tom.x - l1.x;
          float y1 = tom.y - l1.y;
          
          float xr = cosa * x1 + sina * y1;
          float yr = cosa * y1 - sina * x1;
          
          float vxr = cosa * tom.vx + sina * tom.vy;
          float vyr = cosa * tom.vy - sina * tom.vx;
          
          if(yr > 0) {
           yr = 0;
          vyr *= -0.7; 
          }
          
          x1 = cosa * xr - sina * yr;
          y1 = cosa * yr + sina * xr;
          tom.vx = cosa * vxr - sina * vyr;
          tom.vy = cosa * vyr + sina * vxr;
          
          tom.x = l1.x + x1;
          tom.y = l1.y + y1;
          
  }
  
  
}

void checkL2() {
  
  if(tom.x < 555) {
  
             float angle = atan2(400-450, 550-350);
            float cosa = cos(angle);
            float sina = sin(angle);
            
            float x1 = tom.x - l2.x;
            float y1 = tom.y - l2.y;
            
            float xr = cosa * x1 + sina * y1;
            float yr = cosa * y1 - sina * x1;
            
            float vxr = cosa * tom.vx + sina * tom.vy;
            float vyr = cosa * tom.vy - sina * tom.vx;
            
            if(yr > 0) {
             yr = 0;
            vyr *= -0.7; 
            }
            
            x1 = cosa * xr - sina * yr;
            y1 = cosa * yr + sina * xr;
            tom.vx = cosa * vxr - sina * vyr;
            tom.vy = cosa * vyr + sina * vxr;
            
            tom.x = l2.x + x1;
            tom.y = l2.y + y1;
            

            
  }
}


void checkBounds() {
              if(tom.y > 550) {
              tom.y = -10;
             tom.x = random(150, 540);
            tom.vy = 2;
           tom.vx = 0; 
           reBall++;
            }else if (tom.x < 0) {
              tom.y = -10;
             tom.x = random(150, 540);
            tom.vy = 2;
           tom.vx = 0; 
           reBall++;
            }else if (tom.x > 700) {
             tom.y = -10;
             tom.x = random(150, 540);
            tom.vy = 2;
           tom.vx = 0; 
           reBall++;
            } 
}


}

