
int counter;

void setup() {  //setup function called initially, only once
  size(700, 700);
  background(255);  //set background white
  colorMode(RGB);   //set colors to RGB mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  stroke(random(255), random(255), random(255), random(255));
fill(random(255), random(255), random(255), random(255));
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, random(1,150), random(1,150)); //mouse coord, random radius size

  }
}

void keyPressed() {
  background(255);
}
