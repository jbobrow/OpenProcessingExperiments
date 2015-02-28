
int counter;

void setup() {  //setup function called initially, only once
  size(450, 450);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(155),150,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 60, 60);
  }
  else {
    ellipse(width/2, height/2, 120*sin(counter), 120*sin(counter));
  }
}

                
                
