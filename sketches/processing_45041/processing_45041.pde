
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(500000000000000000000);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 10;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),10,225,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 250*sin(counter), 180*sin(counter));
  }
}

                
                
