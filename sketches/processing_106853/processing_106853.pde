
int x=20;
int y=20;

int dx=2;
int dy=1;
void setup() {  //setup function called initially, only once
  size(250, 250);
 
}

void draw() {  //draw function loops 
    fill(255,255,0);
    ellipse(x,y,20,20);
 
 fill(255,25,0);
    ellipse(y,x,20,20);
    
   y=y+dy;
   
   if(y>250){
      dy=-dy;
   }
   if(mousePressed){
   x = mouseX;
   y = mouseY;
   }
   
}
