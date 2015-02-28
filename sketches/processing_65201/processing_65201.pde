
int counter;

void setup() {  
  size(640, 480);
  background(0); 
  noCursor();
 colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {   
  counter--;
  noStroke();
  fill(random(255));
  
  if(mousePressed == true) { //add some interaction
   background(0);
     }
  else {
    ellipse(width/2, height/2, 1000*sin(counter), 1000*sin(counter));
  }
}
