
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(9, 230,100);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  stroke (20, 50, 80);
  fill (90, 255, 255);
  rect (200, 200, 100, 100);
  fill (0)
  rect (225, 225, 50, 50);
 
 
}

void draw() {  //draw function loops 

   fill (100, random (100), 100);
   

    rect (230, 230, 40, 40);
   fill (240, 221, 67);
  rect (240, 240, 20, 20);
    noFill ();
  if(mousePressed == true) { //add some interaction
  stroke (0);
    ellipse(mouseY, mouseX, random (50), random(50));
  }
  else {
  stroke (0);
 rect (mouseX, mouseY, 10, 10);
  }
}
