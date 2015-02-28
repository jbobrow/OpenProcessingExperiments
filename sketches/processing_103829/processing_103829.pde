
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
    quad(mouseX, mouseY, mouseX + 50, mouseY + 50, 69, 63, 30, 76);
  }
  else {
    triangle(30, 75, 58, 20, 86, 75);
  }
}
