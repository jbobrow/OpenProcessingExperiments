
int counter;

void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  smooth();
  counter = 0;
  noStroke ();
  fill(255, 0 , 0);
  //rect(1, 30, 30,30);
}

void draw() {   
  counter++;
  if( mousePressed == true){
 
    
        strokeWeight(13);
        stroke(mouseX, 0, mouseY);
        line(mouseX, mouseY, pmouseX, pmouseY);
    
    

  }
  
}
