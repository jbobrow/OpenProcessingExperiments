
int counter;

void setup() { 
  size(300, 300);
  background(0); 
}

void draw() {  
  
  if(mousePressed == true) { 
    ellipse(150,150,mouseX,mouseY);
  }
 else {
    ellipse(width/4, height/4, 25*sin(counter), 25*sin(counter));
  }
}                                   
