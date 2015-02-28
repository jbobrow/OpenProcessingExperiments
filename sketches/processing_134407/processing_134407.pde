
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  // background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(243),100,400,230);
  
  if(mousePressed == false) { //add some interaction
    rect(mouseX, mouseY, 2, 2);
      }
  else {
    rect( width/100, height/100, 1000,1000);
    
  
  }
}
