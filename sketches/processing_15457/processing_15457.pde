
int counter;

void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 40, 40);
  }
 
}

                
                
