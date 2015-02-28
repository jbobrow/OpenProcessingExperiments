
int counter;

void setup() {  //setup function called initially, only once
  size(550, 550);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(155),75,550,550);
    //fill(random(20),200,255,200);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 20, 20);
  }
  else {
    triangle(0,550,275,0,550,550);;
  }
}
