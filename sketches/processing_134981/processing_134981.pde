
int counter;

void setup() {  //setup function called initially, only once
  size(1200, 800, P3D);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  if(mousePressed == true) { //add some interaction
   translate(mouseX, mouseY, 100);
    rotate(random(359));
    translate(80*sin(counter), 80*sin(counter),-100);
    fill(random(255),100,255,50);
    box(40);
  }
  else {
    
  }
}
