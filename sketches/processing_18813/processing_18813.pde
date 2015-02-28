
int counter;

void setup() {  //setup function called initially, only once
  size(120, 120);
  background(100);  //set background white
  colorMode(hueB);   //set colors to Hue, Saturation, Brightness mode
  counter = 43;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/23, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
