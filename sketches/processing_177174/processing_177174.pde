
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
  fill(random(155),40,1005,100);
  
  if(mousePressed == true) { //add some interaction
    fill(random(155),90,1055,150);
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
    fill(random(255),95,1060,155);
    ellipse(width/6, height/6, 160*sin(counter), 160*sin(counter));
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
    ellipse(width/6, height/6, 160*sin(counter), 160*sin(counter));
    ellipse(width/18, height/18, 150*sin(counter), 150*sin(counter));
  }
}
