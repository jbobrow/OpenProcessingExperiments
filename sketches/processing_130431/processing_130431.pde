
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 5;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(150),50,255,100);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 30, 30);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
