
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(10);  //set background white
  counter = 25;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(200),250,300);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
}
