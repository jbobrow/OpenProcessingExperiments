
int position = 0;

int pressedAt = 0;

void setup() {
  size(600,600);
  smooth();
  stroke(50,50,150);
}

void draw() {
fill(random(0, 255), random(0, 255), random(0, 255) );
  background(255);

  ellipse(position,300,100,100);  
  ellipse(position,100,150,150); 
  ellipse(position,435,50,50); 
  ellipse(position,520,10,10); 

  if ( keyPressed ) if (key == 's') {
    pressedAt = millis();
  }

  if ( millis() < pressedAt + 1000 ) {
    position = position + 1; 
  }
   
  else if (millis() > pressedAt - 500) {
  position = position - 1;  
 }
  }



