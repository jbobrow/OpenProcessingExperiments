
int counter;

void setup() {  //setup function called initially, only once
  size(800, 800);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 10
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255,100,255,50);
  text("Im the best in the world P.S. not really", 255);
  if(mousePressed == true) {
    ellipse( x + 3, mouseY, 20, 20);
    x = x + 2
    
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
