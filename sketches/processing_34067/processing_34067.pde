
void setup() { 

size(500, 500); 

smooth();

}

void draw() { 
 if (mousePressed) {

   
fill(246,123,242); 

} else {
  
fill(22,173,179); 
}
ellipse(mouseX, mouseY, 250, 250);
triangle(mouseX, mouseY, 100,300,300,100);
}

