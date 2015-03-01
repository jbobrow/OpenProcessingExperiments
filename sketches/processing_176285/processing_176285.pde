
int counter;

void setup() {  //setup function called initially, only once
  size(253, 860);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(275),130,955,50);
  
  if(mousePressed == false) { //add some interaction
    ellipse(mouseY, mouseX, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
