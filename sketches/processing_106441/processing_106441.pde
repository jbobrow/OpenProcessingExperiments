
int counter;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(220,180,140);
 
    fill(130,180,250);
 
    ellipse(mouseX+40,mouseY+60,180,180);
 
    // eyes
    fill(120,230,210);
    ellipse(mouseX+55,mouseY+50,20,20);
    ellipse(mouseX+25,mouseY+20,20,20);
 
 
}
