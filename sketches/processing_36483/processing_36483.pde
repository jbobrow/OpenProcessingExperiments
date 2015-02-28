
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  stroke(0);
  strokeWeight(5);
  noFill(100,0,25);
  beginShape();
vertex(100, 20);
vertex(140, 20);
vertex(225, 225);
vertex(170, 225);
vertex(150, 170);
vertex(95, 170);
vertex(75, 225);
vertex(20, 225);
vertex(100, 20);
endShape();
fill(255);
beginShape();
vertex(145,130);
vertex(100,130);
vertex(120,70);
vertex(145,130);
endShape();
  noStroke();
  fill(40,100,255);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
 //   ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
