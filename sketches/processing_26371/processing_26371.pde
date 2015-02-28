
color fil;
color r = color(88,117,135);
color g = color(142,198,203);
color b = color(235,228,199);
 
void setup() {
   
  noStroke();
  size (700,700);
  background(236,109,73);
 
 
 
  fill(88,117,135);
  rect (150,500,100,100);
  
  fill(142,198,203);
 rect (300,500,100,100);
  
  fill(235,228,199);
  rect (450,500,100,100);

   
   
}
 
void draw() {
   
 
  if (mousePressed == true) {
    fill(fil);
 
    ellipse(mouseX,mouseY, 20,20);
  }
 
 
  if (mouseX>150 && mouseX<250 && mouseY>500 &&mouseY<600 &&(mousePressed == true)) {
    fil = color(r);
  }
 
  if (mouseX>300 && mouseX<400 && mouseY>500 &&mouseY<600 &&(mousePressed == true)) {
    fil =  color(g);
  }
 
  if (mouseX>450 && mouseX<5500 && mouseY>500 &&mouseY<600 &&(mousePressed == true)) {
    fil = color(b);
  }
   
   
}


                
                                
