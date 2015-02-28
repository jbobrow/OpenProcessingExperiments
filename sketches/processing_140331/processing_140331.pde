
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
  
 
  
  
    smooth();
    strokeWeight(10);
    stroke(0,130);
    ellipse(26, random(100), 100, random(100));
    ellipse(130, random(100), 100, random(100));
    ellipse(230, random(100), 100, random(100));
    ellipse(125, 220, 200, random(100));
    
}


