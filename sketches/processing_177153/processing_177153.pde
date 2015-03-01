
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
    ellipse(50,50,80,80);
    
    size(480,120)
    rect(180,60,220,40)
    
    size(600,400)
    rect(200,120,440,80)
  
  }
  else {
    ellipse(50,50,80,80);
    rect(200,120,440,80);
   
    
  }
}
