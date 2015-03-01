
int counter;

void setup() {  //setup function called initially, only once
  size(1000,1000);
  background(0);  
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),200,245,70);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/10, height/2, 80*sin(counter), 80*sin(counter));
  }
}

