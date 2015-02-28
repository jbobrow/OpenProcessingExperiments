
void setup() {  //setup function called initially, only once
  size(600, 450);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
if(mousePressed == true) { //add some interaction
    fill (random(255),20,20);
    ellipse(mouseX, mouseY, 20, 20);
    }
}

                
                                                                                                                                                
