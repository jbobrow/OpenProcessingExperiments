
int counter= 0;
void setup() {  //setup function called initially, only once
  size(550, 450); //defines the size of the box
  background(0);  //set background white
  colorMode(HSB);   //set color to hue, saturation and brightness
  counter = 0;

}

void draw() {  //draw function loops 
  counter++;
  noStroke(); //makes it no stroke
  fill(random(255),75,225,150); //the color of the rectangles and ellipse
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 30, 30); //draws rectangles if the mouse is pressed
  }
  else {
    ellipse(width/2, height/2, 190*sin(counter), 180*sin(counter)); //draws a ellipse if the mouse is not pressed
    
  }


  }


