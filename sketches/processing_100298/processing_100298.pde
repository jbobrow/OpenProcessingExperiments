
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
  fill(random(20),255,250,205);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(50, 50, 80*sin(counter), 80*sin(counter));
  }
 
  }
