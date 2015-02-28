
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
  fill(random(2355),1300,2535,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 320, 320);
  }
  else {
    ellipse(width/2, height/2, 380*sin(counter), 80*sin(counter));
  }
}
