
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(1);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(811),255,255,700);
  
  if(mousePressed == false) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/0, height/0, 80*sin(counter), 80*sin(counter));
  }
}
