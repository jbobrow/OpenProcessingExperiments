
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
   // ellipse(mouseX, mouseY, 20, 20);
   // ellipse(mouseX, mouseY,  80*sin(counter), 80*sin(counter));
    
   //rect(mouseX-15,mouseY-15,30,30);
  }
  else {
     rect(random(255),random(255),30,30)
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  
  
  
}
