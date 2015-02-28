
void setup() {
  size(300,300);
  colorMode(HSB,width);
  rectMode(CENTER);
}

void draw() {
  background(150);
  noFill();

  for (int x=10; x<=290; x+=10) {  //limits variable between 10 to 290 in increments of 10 

      stroke(200, x, width); //changes line color from white to blue
      line(x, x, 10, 290);  //variable limits lines from diagonal to bottom left
      line(x, x, 290, 10);  //variable limits lines from diagonal to upper right
      stroke(200, 300-x, width);  //inverse color blue to white
      rect(x, x, 10, 10);  //center of rectangles along diagonal   
  }    
  
}

