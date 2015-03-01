
int counter;

void setup() {  //setup function called initially, only once
  size(450, 350);
  background(888);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/200, height/222, 1000*sin(counter), 1050*sin(counter));
  }
}
