
int weight;

void setup() {  //setup function called initially, only once
  size(800, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  weight=0;
  smooth();
}

void draw() {  //draw function loops 
  stroke(mouseY/2,mouseX,mouseY);
   
  if(mousePressed == true) { //add some interaction
    weight += 0.5;
    strokeWeight(weight);
    line(mouseX, mouseY, pmouseX, pmouseY);
  } else {
    weight = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}
