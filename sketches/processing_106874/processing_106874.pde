
int x=20;
    y=20;
int dx=5;
    dy=5; 
 
void setup() {  //setup function called initially, only once
  size(300, 300);
   }
 
void draw()
 {  //draw function loops
   background(255,255,255,255);
   fill(255,255,0) ;
   ellipse(x, y, 20, 20);
   x=x+dx;
   y=y+dy;
   if(y>300||y<0) {dy=-dy;}
   if(x>300||x<0) {dx=-dx;}
   if(mousePressed) {x=mouseX;y=mouseY;}  
   }
