
int counter;

void setup() {  //setup function called initially, only once
  size(550, 650);
  background(855);  //
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 7;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(295),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
