
//declare variable
float xPos1;
float yPos1;
int rad1;
float speed1;
Float speed2;

//setup function
void setup() {
  size(500, 500);
  colorMode(HSB, 255);
  background(random(0, 255), 255, 255); 
  xPos1=0.5;
  yPos1=1.5;
  rad1=width/10;
  speed1=3.5;
  speed2=5.1;
}

//draw fucntion
void draw() {
  background(255);
  stroke(random(0, 255), 255, 255);
  strokeWeight(15);
  fill(70, 255, 255);
  xPos1+=speed1;
  speed2=speed2+1;
  yPos1+=speed2;

  if (yPos1 > height) {
    speed2=-speed2;
    yPos1=height;
  }
  if (yPos1 < 0) {
    speed2=-speed2;
  }
  if (xPos1 > width) {
    speed1=-speed1;
  }
  if (xPos1 <0) {
    speed1=-speed1;
  }
  
  ellipse(xPos1, yPos1, rad1, rad1);
}



