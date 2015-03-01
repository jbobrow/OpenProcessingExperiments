
int counter;

void setup() {  //setup function called initially, only once
  size(450, 450);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 500;
  

 }

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    fill(random(255), 200, 355, 150);
    rect (75, 20, 60, 450);
    rect (195, 20, 60, 450);
    rect (315, 20, 60, 450);
    
    
  }
  else {
    rect (25, 40, 40, 400);
    rect (75, 20, 60, 450);
    rect (145, 40, 40, 400);
    rect (195, 20, 60, 450);
    rect (265, 40, 40, 400);
    rect (315, 20, 60, 450);
    rect (385, 40, 40, 400);
  }
}
