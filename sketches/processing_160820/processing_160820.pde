
int counter;

void setup() {  //setup function called initially, only once
  size(150, 150);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),180,255,150);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 20, 20);
  }
  else {
    triangle(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
