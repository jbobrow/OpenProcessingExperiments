
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Youngji 
// ID: 201420069 

void setup(){ 
    size (1024, 768); 
    background(212,244,250); 
    rect(0,0,width,height); 
    smooth(); 
    noLoop(); 
} 
void draw(){ 
  println(mouseX + " : " + mouseY); 
  for (int a = 20; a < width; a = a + 100){ 
    for (int b = 20; b < height; b = b + 100){ 
      noStroke(); 
      fill(255,167,167,100); 
      ellipse(a,b,140,140); 
      fill(255,167,167,50); 
      rect(a+15,b+15,70,70); 
        } 
  } 
} 

