

void setup() {  //setup function called initially, only once
  size(600, 90);
  background(0);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  noStroke();
   
  fill(mouseX,mouseY,random(70));
  ellipse(mouseX, mouseY, 10, 10);
  
}

                
                
