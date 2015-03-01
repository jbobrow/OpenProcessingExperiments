
void setup() {  
  size(400, 400);
  background(255);
}

void draw() {  
    //easel 
fill(139,69,19);
rect(65,105,140,190);
fill(255);
rect(82,112,100,150);
if(mouseX=82) {
line(mouseX, mouseY, pmouseX, pmouseY);
 }

