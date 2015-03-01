
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(50);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 25;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(200),75,25,250);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 200, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
