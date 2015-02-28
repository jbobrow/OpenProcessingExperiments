
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white

}

void draw() {  //draw function loops 
 triangle(mouseX,mouseY,10,0,0,10);
}
