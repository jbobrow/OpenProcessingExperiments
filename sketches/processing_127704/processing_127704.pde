
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
 
}

void draw() {  //draw function loops 
background(255)
fill (250,0,0)
rect (mouseX,mouseY,100,100) ;

  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX +50, mouseY +50, 50, 50);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
