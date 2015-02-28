
int counter;

void setup() {  //setup function called initially, only once
  size(250,250);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(250),10,120,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/4, height/3, 80*sin(counter), 80*sin(counter));
}
}
                                
