
void setup () {
  size(500,500);
  background(100);
 
}
  

int value = 0;


void draw() {
fill(value);



/*
if (mousePressed == true) {
  line(mouseX,mouseY,50,50);
 background(100);
  
    fill(0);
  } else {
    
    fill(255);
  }
  }

  */ 
}
void mouseClicked() {
 background(100);
line(mouseX,mouseY,50,50);

 
  if (value == 1) {
    value = 255;
  } else {
    
    value = 1;
  }
  
}







