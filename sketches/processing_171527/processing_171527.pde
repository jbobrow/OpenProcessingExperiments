
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*cos(counter), 80*sin(counter));
    ellipse(width/4, height/4, 80*cos(counter), 80*sin(counter));
    ellipse(width/4, height/2, 80*cos(counter), 80*sin(counter));
    ellipse(width/2, height/4, 80*cos(counter), 80*sin(counter));
    ellipse(width*3/4, height*3/4, 80*cos(counter), 80*sin(counter));
    ellipse(width*3/4, height/4, 80*cos(counter), 80*sin(counter));
    ellipse(width/4, height*3/4, 80*cos(counter), 80*sin(counter));
    ellipse(width/2, height*3/4, 80*cos(counter), 80*sin(counter));
    ellipse(width*3/4, height/2, 80*cos(counter), 80*sin(counter));
  }
}
