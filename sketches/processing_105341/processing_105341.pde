
float vx=random(0,3);
float vy=random(0,3);
float x0=100;
float x=100;
float y0=100;
float y=100;

void setup() {
    size (200,200);
}


void draw() {
  background(0);
  noStroke();
  ellipse(x, y, 30, 30);
  
 //x=x0+vx;
 //x0=x;

  if (x>x0 && x<185) {x0=x;
                      x=x0+vx;                   
  }  else  {x0=x;
            x=x0-vx;    
       }
       
   if(x<x0 && x<15) {x0=x;
                     x=x0+vx;
   }
   
   
   if (y>y0 && y<185) {y0=y;
                      y=y0+vy;                    
   }  else  {y0=y;
            y=y0-vy;    
       }
       
   if(y<y0 && y<15) {y0=y;
                     y=y0+vy;
   }

  
  println (x);
  println (y);
}




