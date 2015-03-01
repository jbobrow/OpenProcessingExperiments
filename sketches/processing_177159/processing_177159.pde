
void setup() { 
  size(1000, 700);
  background(255);  
  colorMode(RGB);   
}

void draw() {  
if(mousePressed){
fill(255,100,255,50);
}else{
fill(120);
}
ellipse(mouseX,mouseY,80,80);
}

