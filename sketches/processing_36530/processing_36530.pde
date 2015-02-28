
int counter;

void setup() {  //setup function called initially, only once
  size(900, 170);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),255,255,100);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 1000*sin(counter), 1000*sin(counter));
  }
}

                
              // worlds most annoying banner                
