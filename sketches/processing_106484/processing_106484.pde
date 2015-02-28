
int counter;
 
 
 
 
//SECTION 2
void setup() {  //setup function called initially, only once
  size(500, 400);
  }
 
 
//SECTION 3
void draw() {  //draw function loops 
 
    background(0);    // makes it black
 
    fill(255,0,0);
 
    ellipse(mouseX,mouseY,20,20);
 
    fill(0,255,0);
 
    ellipse(40,40,20,20);
 
 
}
