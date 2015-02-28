
PImage ref; //A PImage to store our reference image
PImage colref;

void setup() {
  size(800, 700);
  smooth();
  background(255);

  ref = loadImage("SI large bw.jpg");
  colref = loadImage("text2.png");
}

void draw() {  
  fill(255, 3);
  noStroke();
  rect(0, 0, width, height);  

  int xpos = int( random( width )); 
  int ypos = int( random( height)); 

  color temp = ref.get(xpos, ypos);

  //Check the blue color channel to determine if it's mostly black or white...
  if ( blue(temp)  < 100 ) //100 is an arbitrary threshold between 0-255
  {
    fill(0, 200);
    float s = random(5, 30);
    ellipse(xpos, ypos, s, s);
  }
}


