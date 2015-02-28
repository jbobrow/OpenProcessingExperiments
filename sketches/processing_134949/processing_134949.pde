
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134853*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(10, 0, 0, 5);
  
  if(mousePressed == true) { //add some interaction
    quad(mouseX, mouseY, 25, 50, mouseY, 63, mouseY, mouseX);
    
  }
  else {
  
    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(113, 500, 500, 200, 26, 25);
    float value = blue(c);
    fill(value);

    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(213, 400, 400, 400, 326, 125);
    float value = blue(c);
    fill(value);
    
    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(313, 400, 400, 400, 426, 125);
    float value = blue(c);
    fill(value);
    
    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(313, 100, 100, 400, 426, 125);
    float value = blue(c);
    fill(value);

    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(13, 100, 100, 200, 226, 125);
    float value = blue(c);
    fill(value);

    noStroke();
    color c = color(random(250), 126, 255);
    fill(c);
    triangle(113, 500, 100, 200, 226, 125);
    float value = blue(c);
    fill(value);
 

  if (frameCount % 10 == 0) {
    fill(random(255));
    pushMatrix();
    translate(random(100), random(100));
    rotate(radians(frameCount * 2  % 360));
    rect(200, -100, 100, 100);
    popMatrix();
  }
}
}
