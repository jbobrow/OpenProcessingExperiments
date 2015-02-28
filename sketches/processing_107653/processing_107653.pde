
//Drawing lines horizontal and vertical

int c;

void setup() {  //setup function called initially, only once
  size(800, 800);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw lines
  c++;
  
  if(mousePressed == true) { //add some interaction
      stroke(c % 200,100,255);
      line(mouseX,0,mouseY,800);  //vertical line
  }
  
  else { 
      stroke(c % 50,200,150);
      line(0,mouseY,800,mouseX);  //horizontal line
  }
  
  if(keyPressed == true){
      fill(0);
      rect(0,0,800,800);  // new layer
  } 
}
