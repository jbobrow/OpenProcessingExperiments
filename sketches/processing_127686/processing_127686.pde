
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white

}

void draw() {  //draw function loops 
fill (250, 0, 250) ;
ellipse (mouseX,mouseY,80,80);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
