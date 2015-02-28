
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(128,128,128);  //set background white
  f = createFont("Arial",48,true);
}

void draw() {  //draw function loops 
    background(128,128,128)
    line(mouseX +50, mouseY +50, mouseX, mouseY)
    fill (0,0,0)
    ellipse(mouseX +50,mouseY +50,80,80);
    fill (255,0,0);
    ellipse (mouseX,mouseY,20,10);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 50);
    background (204,102,0);
    textFont(f,20);                 // STEP 4 Specify font to be used
    fill(0);                        // STEP 5 Specify font color 
    text("BOOM!",mouseX,mouseY,100,100);  // STEP 6 Display Text
    
    

  }
  
  
}
