
int x = 250;
int y = 120;

int dx = 0;
int dy = 3;



void setup() {  //setup function called inially, only once
   size(300,400);
}



void draw()  {  //draw function loops
  
   background(0,0,0);
    fill(255,200,200);
    ellipse(x,y,20,20);
  
   if (y>400) {
       dy = -dy;
   }
   
   if (y<2) {
       dy = -dy;
   }
    
   y = y+dy;
   
   if (mousePressed) {
   
       x = mouseX;
       y = mouseY;
   }

}
