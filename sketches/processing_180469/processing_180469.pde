
int counter;

void setup() {  //setup function called initially, only once
  size(400, 250);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  frameRate(25);
}

void draw() {  //draw function loops 
  background(255);  //set background white
  counter=counter+1;
  noStroke();
  fill(random(255),100,255,255);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
    //println(80*sin(counter));
  }
}
