
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 220, 220);
  }
  else {
    rect(80*sin(counter), 80*sin(counter), 80*sin(counter), 80*sin(counter));
  }
}

                
                
