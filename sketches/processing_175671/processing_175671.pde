
int counter;
 
void setup() {  //setup function called initially, only once
  size(900, 900);
  background(240);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
 
void draw() {  //draw function loops
  counter++;
  noStroke();
  fill(random(240),240,184,225);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 200, 200);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

