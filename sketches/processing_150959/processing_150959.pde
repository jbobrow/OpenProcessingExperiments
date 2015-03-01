
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(2005);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 10;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(2550),1000,25500,500);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 800*sin(counter), 800*sin(counter));
  }
}
