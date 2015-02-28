
int counter;

void setup() {  //setup function called initially, only once
  size(80, 550);
  background(2060);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 200;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(500),289,995,30);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 70);
  }
  else {
    ellipse(width/23, height/68, 200*sin(counter), 578*sin(counter));
  }
}



                
                
