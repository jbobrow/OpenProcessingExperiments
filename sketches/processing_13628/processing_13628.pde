
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(20);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 5;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255,100);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX+200, mouseY+200);
  }
  else {
    ellipse(width/3, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
