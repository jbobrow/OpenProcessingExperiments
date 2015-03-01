
void setup() {  //setup function called initially, only once
  size(600,600);
}

void draw() { 
  background(255);
  fill(255,0,0);
  line(49,0,49,height-1)
  line(99,0,99,height-1)
  ellipse(mouseX,mouseY,50,50);
  fill(0,255,0);
  if(mouseX>50&&mouseX<100) {
     fill(255,0,0);
     }
   rect(499,49,50,50);
  }
  
  

