
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  
  if(mousePressed == true) { //add some interaction
  fill(mouseX,mouseY,random(255));
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
   // ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
