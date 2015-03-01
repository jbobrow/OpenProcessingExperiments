
int counter;

void setup() {  //setup function called initially, only once
  size(3000, 300);
  background(75);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(35),340,150,100);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 200, 1);
  }
  else {
    ellipse(width/3, height/5, 80*sin(counter), 80*sin(counter));
  }
}
