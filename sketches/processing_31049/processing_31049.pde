

void setup() {
  size(550, 400);
  smooth();
 
}

void draw() {
  background(255,255,50);

  pushMatrix();
  translate(width/2, height);
  branch(map(mouseX,0,width,20,150));
  popMatrix();
}

void branch(float len) {   
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.65;
  float theta = map(mouseY, 0, height, 0, PI);
  
  if (len > 10) {
    pushMatrix();
    rotate(theta);
    branch(len);       // call myself to draw new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
    
  }
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    saveFrame();
  }
}

