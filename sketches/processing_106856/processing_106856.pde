
int x=90;
int y=90;

int dx=20;
int dy=10;

void setup() {  //setup function called initially, only once
  size(250, 250);
 
}

void draw() {
background(1,255,255);  
    ellipse(x,y,20,20);
    y=y+dy;
    x=x+dx;
    if (x>250){
        dx=-dx;
    }
    if (x<0){
        dx=-dx;
        }   

    if (y>250){
        dy=-dy;
    }
    if (y<0){
        dy=-dy;
        } 
    if(mousePressed){
        x=mouseX;
        y=mouseY;  
        }
}
