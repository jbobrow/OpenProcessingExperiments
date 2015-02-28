
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(255,0,0);  //set background red
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255), random(255),255,50);
  
  if(mousePressed == true) { //add some interaction
    triangle(random(0, 300), random(0, 300), random(0, 300), random(0, 300), random(0, 300), random(0, 300));
  }
  else {
    triangle(202, 202, 202, 55, 87, 90);
  }
}
