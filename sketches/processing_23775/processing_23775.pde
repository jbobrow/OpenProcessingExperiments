
void setup () {

size (300,300);
smooth();


}



void draw() {
  //Draw background
  background(10+mouseX,20+mouseX,110+mouseX-50);
  
  
  // Set sun colour and position to mouse
   ellipseMode(CENTER); 
   stroke (255,255,130);
   fill(255,255,130);
   ellipse (mouseX,mouseY,50,50);
  
  
  //draw ocean
  stroke (130,255,230); 
  fill(130,255,230,150);  
  rect(0,150,height,width);
  
  
   
  
}


