
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
    size(180,60,220,40);
    rect(180,60,220,40);
    
    size(200,70,230,50);
    rect(200,70,230,50);

  }
  else {
    rect(180,60,220,40)
    rect(200,70,230,50)
    
  }
}
