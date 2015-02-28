
void setup() { 

  size(600, 300);

smooth();  

}  
void draw() {  

  if (mousePressed) {  

    fill(#58FA58);  
} else {  
  
  fill(#CC0000);   
}

ellipse(mouseX, mouseY, 80, 95);  

}




