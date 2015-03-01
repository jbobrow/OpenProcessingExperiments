
int counter;


void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void foo(int radius) {
    ellipse(20,20,radius,radius);
}

void draw() {  //draw function loops 
  counter = counter + 1;
  noStroke();
  fill(random(120),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    foo(5);
    ellipse(mouseX, mouseY, 60, 60);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}









