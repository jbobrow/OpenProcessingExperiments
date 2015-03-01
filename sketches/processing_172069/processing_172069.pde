
int counter;

void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  smooth();
  counter = 0;
  noStroke ();
  fill(255, 0 , 0);
  smooth();
}

void draw() {   
  counter++;
  if( mousePressed == true){
 
    
        strokeWeight(50);
        stroke(mouseX, 0, mouseY);
        line(mouseX, mouseY, pmouseX, pmouseY);
    
    

  }
  
}
