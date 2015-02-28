
float colPral = random(50);
float diametro = random(40);

void setup(){
  size(300,300);
  background(255);
  noFill();
  smooth();
  colorMode(HSB, 200);
}

void draw(){
  frameRate(90);
  translate(width/2,height/2);
  stroke(colPral + random(65),200 + random(30),100 +random(65), random(20));
  strokeWeight(random(5));
  ellipse(0,0, diametro*random(80), diametro*random(80));
  
}

