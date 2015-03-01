
void setup() {  //setup function called initially, only once
  size(300, 300);  
  background(0);    
  
}

void draw() {  //draw functio
background(0);
fill(255);
ellipse( 150, 100,140, 140);
rect(80,100,140,120);
fill(255,180,180);
ellipse( 100+mouseX/10, 100, 20, 20);
ellipse( 150+mouseX/10, 100, 20, 20);
}
