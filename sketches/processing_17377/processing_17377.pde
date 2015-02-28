
int counter;

void setup() {  //setup function called initially, only once
  size(450, 250);
  background(655);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 5;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(55),170,275,30);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 29, 90);
  }
  else {
    ellipse(width/2, height/2, 7720*sin(counter), 180*sin(counter));
  }
}

                
                                
