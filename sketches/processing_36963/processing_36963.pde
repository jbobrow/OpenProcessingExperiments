
int counter;
 
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  smooth();
}
 
void draw() {  //draw function loops
  counter++;
  noFill();
    strokeWeight(10);
    arc(125, 125, 200, 200, PI/6, TWO_PI-PI/6);
    arc(125, 125, 100, 100, PI/6, TWO_PI-PI/6);
    line(170, 150, 210,175);
    line(170, 100, 213,78);
  rectMode(CENTER);
    strokeWeight(2);
//  rect(125,125,100,100); 
  noStroke();
 fill(mouseX,mouseY,150,50);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
//    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

