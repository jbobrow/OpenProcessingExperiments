
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(160, 0, 255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
 
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter)); ellipse (200, 200, 155, 155);
  } 
}
            
                
