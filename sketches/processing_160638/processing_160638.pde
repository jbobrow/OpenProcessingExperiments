
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(700);  //set background blue
  colorMode(30,40,70);   //set colors to Hue, Saturation, Brightness mode
  counter = 2;
}

void draw() {  //draw function loops 
  counter++;
  noStroke(8);
  fill(random(300),600,500,40);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 60, 60);
  }
  else {
    ellipse(width/2, height/2, 400*sin(counter), 500*sin(counter));
  }
}
