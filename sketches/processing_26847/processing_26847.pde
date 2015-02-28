
// The only difference between this example and the previous chapter (Example 8-3) 
// is the use of an array for multiple Zoog objects.
Head[] headies = new Head[200];

void setup() {
  size(400,400);
  smooth();
  for (int i = 0; i < headies.length; i ++ ) {
    headies[i] = new Head(random(width),random(height),30,30,8);
  }
}

void draw() {
  background(0); // Draw a black background
  for (int i = 0; i < headies.length; i ++ ) {
    headies[i].display();
    headies[i].jiggle();
  }
}

class Head {
  // Zoog's variables
  float x,y,w,h,eyeSize;
  
  // Zoog constructor
  Head(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
  }
  
  // Move Zoog
  void jiggle() {
    // Change the location of Zoog randomly
    x = x + random(-1,1);
    y = y + random(-1,1);
    // Constrain Zoog to window
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  // Display Zoog
  void display() {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);
    // Draw Zoog's arms with a for loop
    for (float i = y - h/3; i < y + h/2; i += 50) {
      stroke(0);
      line(x-w/4,i,x + w/4,i);
    }
    // Draw Zoog's body
    stroke(0);
    fill(mouseX,0,mouseY);
    rect(x,y,w+7,h);
    // Draw Zoog's head
    stroke(0);
    fill(mouseX,157,mouseY);
    ellipse(x,y-h,w-7,h);
    // Draw Zoog's eyes
    fill(mouseX,20,mouseY);
    ellipse(x-w/3+1,y-h,eyeSize,eyeSize*2);
    ellipse(x + w/3-1,y - h,eyeSize,eyeSize*2);
    // Draw Zoog's legs
    stroke(0);
    line(x - w/12,y + h/2,x - w/4,y + h/2 + 10);
    line(x + w/12,y + h/2,x + w/4,y + h/2 + 10);
  }
}

                
                
