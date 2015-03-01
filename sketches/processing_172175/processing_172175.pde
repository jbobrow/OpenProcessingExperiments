
void setup() {  //setup function called initially, only once

  size(300,300);
  
  }
  
void draw() {  //draw function loops 
background(3,46,57);
   ellipse(150,50,100,100);
  rect(100,50,100,200);
 fill(162,30,32);
 ellipse(130+mouseX/100,26+mouseY/50,30,30);
 ellipse(170+mouseX/100,26+mouseY/50,30,30)
 fill(252,255,255); 
 triangle(100,250,150,250,125,300);
  triangle(150,250,200,250,175,300);
  
  }
