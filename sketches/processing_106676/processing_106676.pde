
int x = 20;
int y = 20;
void setup () {
    size (300, 200);
    
}

void draw () {
   ellipse (x, y, 20, 20);
   y= y+1;
   if (y>200) {
       y = 0;
       x= x+50;
   }
   
   ellipse (mouseX, mouseY, 20, 20);
}
