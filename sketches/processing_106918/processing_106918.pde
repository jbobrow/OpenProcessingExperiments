
int counter;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(255);
 
    fill(255,255,0);
 
    ellipse(mouseX+50,mouseY+50,150,200);
 
    // eyes
    fill(0,0,255);
    ellipse(mouseX+125,mouseY+250,150,70);
    ellipse(mouseX+50,mouseY+70,70,70);
 
 
}
