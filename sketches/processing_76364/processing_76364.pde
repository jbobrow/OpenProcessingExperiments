
//David Kim
//Creative Programming
//Assignment 3 (MOD of 2)
//10-15-12

//corner variables
int xChange = 1;
int yChange = 1;
int opacity = 20; //opacity of shapes
int centerRotation = 0; //rotation speed of center shapes
int outerRotation = 0; //rotation speed of outer shapes

void setup() {
  size(800, 800);
  background (0, 0, 0);
  smooth();
}

void draw() {
  noStroke();
  smooth();

  fill(0, 0, 0, 20); //black
  rect(0, 0, width, height); //covers previous iteration
  int xChange = 1+mouseX/5;
  int yChange = xChange;

  if (mousePressed == true) { //starts rotation
    centerRotation = 2+(mouseY/100);
    outerRotation = 1+(mouseY/100);
  }
    else {
      centerRotation = 0; //stops rotation
      outerRotation = 0;
  }


//OUTER SHAPE CLOCKWISE 
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*outerRotation);

    //top right corner shape 
    fill(100, 0, 200, opacity); //purple
    beginShape();
    for(int i=0; i<(width/xChange+1); i+=1) {
      vertex(width/2-(i*xChange), -height/2);
      vertex((width/2-(xChange/2))-(i*xChange), -height/2);
      vertex(width/2, height/2-(i*yChange));
      vertex(width/2, (height/2-(yChange/2))-(i*yChange));
    }
    endShape();
    //top left corner shape 
    fill(0, 200, 100, opacity); //green
    beginShape();
    for (int i=0; i<(width/xChange+1); i+=1) {
      vertex(-width/2+(i*xChange), -height/2);
      vertex((-width/2+(xChange/2))+(i*xChange), -height/2);
      vertex(-width/2, height/2-(i*yChange));
      vertex(-width/2, (height/2-(yChange/2))-(i*yChange));
    }
    endShape();
    //bottom left corner shape 
    fill(0, 100, 200, opacity); //blue
    beginShape();
    for (int i=0; i<(width/xChange+1); i+=1) {
      vertex(-width/2+(i*xChange), height/2);
      vertex((-width/2+(xChange/2))+(i*xChange), height/2);
      vertex(-width/2, -height/2+(i*yChange));
      vertex(-width/2, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
    //bottom right corner shape
    fill(200, 200, 0, opacity); //yellow
    beginShape();
    for(int i=0; i<(width/xChange+1); i+=1) {
      vertex(width/2-(i*xChange), height/2);
      vertex((width/2-(xChange/2))-(i*xChange), height/2);
      vertex(width/2, -height/2+(i*yChange));
      vertex(width/2, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
  popMatrix();
  
  //OUTER SHAPE COUTER CLOCKWISE
  pushMatrix();
    translate(width/2, height/2);
    rotate(-radians(frameCount)*outerRotation);

    //top right corner shape 
    fill(200, 100, 0, opacity); //red
    beginShape();
    for(int i=0; i<(width/xChange+1); i+=1) {
      vertex(width/2-(i*xChange), -height/2);
      vertex((width/2-(xChange/2))-(i*xChange), -height/2);
      vertex(width/2, height/2-(i*yChange));
      vertex(width/2, (height/2-(yChange/2))-(i*yChange));
    }
    endShape();
    //top left corner shape 
    fill(100, 200, 0, opacity); //green
    beginShape();
    for (int i=0; i<(width/xChange+1); i+=1) {
      vertex(-width/2+(i*xChange), -height/2);
      vertex((-width/2+(xChange/2))+(i*xChange), -height/2);
      vertex(-width/2, height/2-(i*yChange));
      vertex(-width/2, (height/2-(yChange/2))-(i*yChange));
    }
    endShape();
    //bottom left corner shape 
    fill(0, 100, 200, opacity); //blue
    beginShape();
    for (int i=0; i<(width/xChange+1); i+=1) {
      vertex(-width/2+(i*xChange), height/2);
      vertex((-width/2+(xChange/2))+(i*xChange), height/2);
      vertex(-width/2, -height/2+(i*yChange));
      vertex(-width/2, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
    //bottom right corner shape
    fill(200, 200, 100, opacity); //yellow
    beginShape();
    for(int i=0; i<(width/xChange+1); i+=1) {
      vertex(width/2-(i*xChange), height/2);
      vertex((width/2-(xChange/2))-(i*xChange), height/2);
      vertex(width/2, -height/2+(i*yChange));
      vertex(width/2, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
  popMatrix();

  //CENTER SHAPE CLOCKWISE
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount)*centerRotation); 
    //bottom left center shape 
    fill(200, 100, 0, opacity); //red
    beginShape();
    for(int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0-(i*xChange), 0);
      vertex((0-(xChange/2))-(i*xChange), 0);
      vertex(0, height/2-(i*yChange));
      vertex(0, (height/2-(yChange/2))-(i*yChange));
    }
    endShape(); 
    //bottom right center shape 
    fill(100, 200, 0, opacity); //green
    beginShape();
    for (int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0+(i*xChange), 0);
      vertex((0+(xChange/2))+(i*xChange), 0);
      vertex(0, height/2-(i*yChange));
      vertex(0, (height/2-(yChange/2))-(i*yChange));
    }
    endShape(); 
    //top right center shape 
    fill(100, 100, 200, opacity); //blue
    beginShape();
    for (int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0+(i*xChange), 0);
      vertex((0+(xChange/2))+(i*xChange), 0);
      vertex(0, -height/2+(i*yChange));
      vertex(0, (-height/2+(yChange/2))+(i*yChange));
  }
    endShape();
    //top left center shape
    fill(200, 200, 100, opacity); //yellow
    beginShape();
    for(int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0-(i*xChange), 0);
      vertex((0-(xChange/2))-(i*xChange), 0);
      vertex(0, -height/2+(i*yChange));
      vertex(0, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
  popMatrix();
  
  //CENTER SHAPE COUTERCLOCKWISE
  pushMatrix();
    translate(width/2, height/2);
    rotate(-radians(frameCount)*centerRotation); 
    //bottom left center shape 
    fill(200, 0, 100, opacity); //red
    beginShape();
    for(int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0-(i*xChange), 0);
      vertex((0-(xChange/2))-(i*xChange), 0);
      vertex(0, height/2-(i*yChange));
      vertex(0, (height/2-(yChange/2))-(i*yChange));
    }
    endShape(); 
    //bottom right center shape 
    fill(0, 200, 100, opacity); //green
    beginShape();
    for (int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0+(i*xChange), 0);
      vertex((0+(xChange/2))+(i*xChange), 0);
      vertex(0, height/2-(i*yChange));
      vertex(0, (height/2-(yChange/2))-(i*yChange));
    }
    endShape(); 
    //top right center shape 
    fill(100, 0, 200, opacity); //blue
    beginShape();
    for (int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0+(i*xChange), 0);
      vertex((0+(xChange/2))+(i*xChange), 0);
      vertex(0, -height/2+(i*yChange));
      vertex(0, (-height/2+(yChange/2))+(i*yChange));
  }
    endShape();
    //top left center shape
    fill(200, 200, 100, opacity); //yellow
    beginShape();
    for(int i=0; i<(width/(2*xChange)+1); i+=1) {
      vertex(0-(i*xChange), 0);
      vertex((0-(xChange/2))-(i*xChange), 0);
      vertex(0, -height/2+(i*yChange));
      vertex(0, (-height/2+(yChange/2))+(i*yChange));
    }
    endShape();
  popMatrix();
}
