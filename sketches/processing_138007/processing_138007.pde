
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
  fill(mouseX,mouseY,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
     fill(mouseY-1, mouseX, 45);
     
 stroke(mouseX-1, mouseY,25);
line(mouseX,mouseY,10,200);
line(400,200,mouseX,mouseY);
line(mouseX,mouseY,300,200);
  }
 
}
