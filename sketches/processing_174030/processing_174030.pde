
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
   ellipse (110,100,100,100);
   ellipse (100,150,100,100);
   ellipse (100,100,160,100);
   ellipse (100,100,100,10);
  ellipse (100,100,100,100);
    
  }
}
