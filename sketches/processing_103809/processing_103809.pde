
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(37);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  //noStroke();
  fill(random(255),random(150),255, random(25)+50);
  
  if(mousePressed == true) { //add some interaction
    line(mouseX, mouseY, random(250), random(250));
  }
  else {
    rect(80*tan(counter), height/2, 80*sin(counter), 80*sin(counter),7);
    triangle(50*sin(counter), 50*cos(counter), 50*tan(counter), 70, 70, 70)
  }
}
