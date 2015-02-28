
int x=20;
int y=20;

int dx=1;
int dy=1;
  void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

void draw() {  //draw function loops 
    background(2,100,255);
    ellipse(x,y,20,20)
    y=y+dy;
    if (y>250){
        dy=-dy;
    }
    if (y < 0) {
        dy = -dy;
    }
    
    if(mousePressed){
    x=mouseX
    y=mouseY
    }
}
