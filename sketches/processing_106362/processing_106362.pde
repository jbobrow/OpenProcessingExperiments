
int counter;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(255);
 
    fill(78,340,0);
 
    ellipse(mouseX+50,mouseY+50,200,200);
 
    // eyes
    fill(0,0,0);
    ellipse(mouseX+75,mouseY+40,20,20);
    ellipse(mouseX+25,mouseY+20,20,20);
 
 
}
