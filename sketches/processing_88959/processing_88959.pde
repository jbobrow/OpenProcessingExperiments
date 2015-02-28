
void setup(){
  size(500, 500);
  frameRate(10);
  smooth();
  noStroke();
}

void draw(){ 
  float R = random(180);
  float G = random(180);
  float B = random(180);

  background(R, G, B); //background has the foats R, G and B applied to generate random colours
  
  stroke(255);
  line(width/2, mouseY, mouseX, width/2); //creates a line that's position is altered by the cursor position
}


