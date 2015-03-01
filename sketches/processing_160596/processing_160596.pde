
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 21;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(10),110,10,200);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 30*sin(counter), 30*sin(counter));
    rect(30, 20, 55, 55);
    rect(160, 170, 55, 55);
  }
}
