
int counter;
 
void setup() {  //setup function called initially, only once
  size(300, 300);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(255);
 
    fill(255,255,0);
 
    ellipse(mouseX+50,mouseY+50,200,200);
 
    // eyes
    fill(0,0,255);
    ellipse(20+mouseX,20+mouseY,20,20);
    ellipse(20+mouseX,20+mouseY,20,20);
 
 
}
