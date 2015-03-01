
int counter;

void setup() {  
  size(500, 250);
  background(255);  
  colorMode(HSB);   
  counter = 0;
}

void draw() {   
  noStroke();
  fill(random(255),100,255,50);
  
  ellipse(150, 46, 55, 55);
  ellipse(300, 46, 55, 55);
  
  noFill();
  noStroke();
  fill(random(255),100,255,50);
  arc(225, 125, 160, 160, 0, PI);


}
