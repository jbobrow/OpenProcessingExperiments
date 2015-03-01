
int counter;
float r;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white

  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  float r = random(120);
  noStroke();
  fill(random(255),100,255,150);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, r,r);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
