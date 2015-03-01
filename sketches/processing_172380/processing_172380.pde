
int counter;
int pizza;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(138,43,226);  //blue violet
  counter = 0;
}

void draw() {  //draw function loops
  pizza=pizza+3;
  noStroke();
  
  if(mousePressed == true) { //add some interaction
    fill(138,43,226, 75);
    rect(mouseX, mouseY, 30, 20, 55, 55);
  }
  else {
  fill(127,255,212); //aqua marine
  triangle(0, 0 +counter, 28, -55 +counter, 56, 0 +counter);
  counter=counter+7;
  
  fill(0,255,0); // lime
  triangle(56, 0 +counter, 84, -55 +counter, 112, 0 +counter);
  counter=counter+7;
  
  fill(255,0,255); //magenta
  triangle(30, 75 +counter, 58, 20 +counter, 86, 75 +counter);
  counter=counter+7;
  }
}
 
