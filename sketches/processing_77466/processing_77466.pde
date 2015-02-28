
float pos = 0;

void setup() {
  size(600,600);
  frameRate(25);
  smooth();
  background(0);
}

void draw(){
 //background(0);
  
  translate(pos, pos);
    
  rotate( map(millis(), 0, 3500, 0, TWO_PI));
  translate (50, 50);

  noStroke();
  fill(random(255), random(255), random(255));
  
  ellipseMode(CENTER);
  ellipse(0, 0, 20, 20);
  //ellipse(xPos + sin(map(millis(), 0, 1500, 0, TWO_PI)) * 50 ,yPos + cos(map(millis(), 0, 1500, 0, TWO_PI)) * 50 , 20, 20);
  pos += 0.8;
}


