
int x = 25; 
int y = 25;  
int speed = 3; 
int state = 0;  

  
void setup(){  
  size(640,640);  
  
}  
  
void draw() {  
  background (33,150,123);  
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0,255));
  
  
 
noStroke();  
fill(r,g,b);  
ellipse(x,y,50,50);  
if(state == 0 ) {  
  x = x + speed;  
  if (x > width-25) {  
    x = width-25;  
    state = 1;  
    }  
} else if (state == 1) {  
  y = y + speed - 2;  
  x = x - speed + 1;  
  if (x < 25) {  
   y = 320;  
   x = 25;  
   state = 2;  
  }   
} else if (state == 2) {  
    x = x + speed;  
  if (x > width-50) {  
   y = 320;  
   x = 615;  
   state = 3;  
}  
} else if (state == 3) {  
  y = y + speed - 2;  
  x = x - speed + 1;  
  if (x < 25) {  
   y = 615;  
   x = 25;  
   state = 4;  
}  
} else if (state == 4) {  
    x = x + speed;  
  if (x > width-50) {  
   y = 615;  
   x = 615;  
   state = 5;  
}  
} else if (state == 5) {  
  x = 25;  
  y = 25;  
  state = 0;  
}  
}
void mousePressed() {
  background (33,150,123); 
if (mouseButton == LEFT)   {
  background(0);
}
}  
 

