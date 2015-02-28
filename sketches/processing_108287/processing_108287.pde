
int counter;

void setup() {  //setup function called initially, only once
  size(550, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter=counter+1;
  noStroke();
  fill(random(255),200,255,10);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 90, 190);
  }
  else {
    ellipse(width/2, height/2, 300*cos(counter), 100*sin(counter));
  }
  if (counter > 10) {
    text("Hi Dad!", 50, 50);
  }
}
