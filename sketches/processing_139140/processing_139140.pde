
int counter, cursize;

void setup() {  //setup function called initially, only once
  size(700, 300);
  background(#333333);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  cursize = random(10,100);
  fill(random(255),100,255,20);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, cursize, cursize);
  }
}
