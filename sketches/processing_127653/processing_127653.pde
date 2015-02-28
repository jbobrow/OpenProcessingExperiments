
int x = 20;
int y = 20;
//int dx = 1
//int dy = -1
 

void setup() {  //setup function called initially, only once
  size(500, 400);
  }
 
 
//SECTION 3
void draw() {  //draw function loops 
 
    background(255);    // makes it black
 
    fill(255,0,0);
 
    ellipse(mouseX,mouseY,20,20);
 
    fill(0,255,0);
 
    ellipse(x,y,20,20);    //20,20
// y + y = dy;
 //x+x = dx;
 //if  (key == 'a')
// dy = dy-1
 
 if  (key == 's')
 y = y+1;
 
    if (key == 'd'){
        x = x+1;
    }

 
}
