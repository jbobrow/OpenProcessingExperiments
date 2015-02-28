
//setup program
void setup() {
  size(640 , 480);
  frameRate(30);
  background(#eeeeee);
  smooth();
}

void draw(){
  milliParticles();
  secParticles();  
  minParticles();
}

//time based particles
void milliParticles(){
 for(int i = int(millis()); i >= 0; i--) {
      fill(255);
      stroke(0);          
      ellipse(random(800), random(600), 5, 5 );
  }
}

void secParticles() {
  for(int i = int(second()); i >= 0; i--) {
      fill(0);
      noStroke();
      ellipse(random(800), random(600), 10, 10 );
  }
}

void minParticles(){
  for(int i = int(minute()); i >= 0; i--) {
      fill(100);
      noStroke();
      ellipse(random(800), random(600), 20, 20 );
  }
}

