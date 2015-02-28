
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  }

void draw() {  //draw function loops 
  
  background (255,255,255,255);
  ellipse(x,y,20,20);
 
 
 rect (50,50,20,100);
 
     if (x > 50&& x < 100);
     dx= 0;
     dy= 0;
     
    if (keyPressed) {
    fill(0,255,0);
    
        if (key == 'd'|| key == 'D') { 
        dx = 3;
        dy= 0;
        }
        
        else if (key == 'a') {
        dx= -3;
        dy = 0;
        }
    }
    else if (key == 'w') {
    dy= -3 ;
    dx = 0;
    }
      else if (key == 's') {
    dy= 3 ;
    dx = 0;
    }
    else {
        fill(255,0,0);
  }
  
  x= x+ dx;
  y= y +dy;
  }
