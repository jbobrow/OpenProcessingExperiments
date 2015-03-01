
int counter;

void setup() {  //setup function called initially, only once
  size(000, 256);
  background(0);  //set background red
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 55;
}
rect(355, 245, 111, 57);
void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
