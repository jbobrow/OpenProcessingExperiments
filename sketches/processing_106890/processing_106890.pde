
int x=20;
int y=20;
 
int dx=0;
int dy=0;
 
void setup() {  //setup function called initially, only once
size(300,200);
}
 
void draw() {  //draw function loops
background(255,255,255);
ellipse(x,y,20,20);
 
if(key == 'd'){
   dx  = 5;
   dy  = 0;
}
 
if(key == 's'){
    dy = 5;
    dx = 0;
}
 
if(key == 'a'){
    dx = -5;
    dy = 0;
} 
  
if(key == 'w'){
    dy = -5;
    dx = 0;
}
 
x = x+dx;
y = y+dy;
 
}
