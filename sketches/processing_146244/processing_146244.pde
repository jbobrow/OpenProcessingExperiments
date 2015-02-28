

void setup() {  //setup function called initially, only once
  size(400, 400);
  
  stroke(255);
  background(192,64,0);  //set background white
}

void draw() {  //draw function loops 
  line(150,25, mousex, mousey);
}
