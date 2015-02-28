
int x=0;
int y=15;
int dx=9;
int dy=5;

void setup() {  //setup function called initially, only once
  size(600,600);
  rectMode(CENTER);
}

void draw() {  //draw function loops 
    smooth(8);
    background(255,255,255);
    fill(255,255,255);
    ellipse(x,y,20,20);
    fill(50,50,255)
    rect(300,596,600,8);
    rect(596,300,8,600);
    rect(2,300,8,600);
    rect(300,2,600,8);
    x = x+dx;
    y = y+dy;
    
   if (x > 580) {
       dx = -9;
   }
   else if (x < 20) {
       dx = 9;
   }
   if (y > 580) {
       dy = -2;
   }
   else if (y < 20) {
       dy = 2;
   }
   if (mousePressed == true){
       x = mouseX
       y= mouseY
   }
}
