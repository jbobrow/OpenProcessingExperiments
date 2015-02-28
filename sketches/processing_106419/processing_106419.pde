
int x = 20;
int y = 20;

int dx = 0;
int dy = 8;

void setup() {
       size(300,400);
}       
      
void draw() {
       background(0,0,0)
       fill(30,80,190);
       ellipse(x,y,20,20);
       
       if (y>400) {
           dy = -dy
       }
       if (y<0) {
           dy = -dy
       }
       y = y + dy;
         
       if (mousePressed){
           x = mouseX;
           y = mouseY; 
       }
    
       
}
