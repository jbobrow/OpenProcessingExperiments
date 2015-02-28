
int x = 20;
int y = 20;
int dx = 0;
int dy = 0;
void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
   ellipse(x,y,20,20);
   fill(0,0,255);
   rect (100,100,20,200);
 
      if (key == 'd'){
      dx= 1;
      }
       if (key == 'a'){
      dx= -1;
      }
       if (key == 'w'){
     dy= -1;
     }
      if (key == 's'){
      dy= 1;
      }
      
      x = x+dx;
      y = y+dy;
      if (x>100 && x<120 && y>100 && y<300){
      dx=-0;
      dy=0;
      }   
   
   }
