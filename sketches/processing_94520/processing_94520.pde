
void setup () {
   size (500,500);
   background(255); 
   noStroke();
   
}

void draw() {
  

 // set fill color to be partly transparent:
    fill(0,1);
    // draw a rect over everything:
    rect(0, 0, width, height);
    // set the fill color to be opaque again:
    fill(250);
    // draw brush from perspective of mouse:
    translate(mouseX, mouseY); 
    
  //mouse clicked
  if(mousePressed) {
    Microsoft();
  }
 
  //w pressed, background turns white
  if(keyPressed) {
    if(key == 'w'){
      background(255);}
  }
}
//Microsoft is this
void Microsoft(){

  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  splitter();
  
  
}

//splitter is this
void splitter(){
  pushMatrix();
  translate(random(-8,8), random(-8,8));
  ellipse(10, 10, 2, 6);
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    popMatrix();

    fill(255, 94, 0);    
    pushMatrix();
    translate(random(-8, 8), random(-8, 8));
    ellipse(-10, -10, 2, 6);

    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    
    popMatrix();

    fill(71,200,62);
    pushMatrix();
    translate(random(-8, 8), random(-8, 8));
    ellipse(10, -10, 2, 6);

    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();

    popMatrix();
    
    fill(36,120,255);
    pushMatrix();
    translate(random(-8, 8), random(-8, 8));
    ellipse(-10, 10, 2, 6);
   
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();
    splatter();

    popMatrix();
    
    fill(255,228,0);

}

//splatter is this
void splatter() {

    pushMatrix();
    translate(random(-2, 2), random(-2, 2));
    ellipse(0, 0, 0, 0);
    popMatrix();

}
