
int posicion=0;

void setup() {
  size(500,300);
  frameRate(50);
  smooth();
  background(255);
  stroke(255);
  noFill();
}

void draw() {
  posicion++;
  strokeWeight(random(20));
   
  stroke(random(0), random(206), random(255),random(30));
  ellipse(40,0,posicion,posicion);
  
  stroke(random(128), random(42), random(160),random(30));
  ellipse(40,300,posicion,posicion);
  
  stroke(random(0), random(206), random(255),random(30));
  ellipse(460,300,posicion,posicion);
  
  stroke(random(128), random(42), random(160),random(30));
  ellipse(460,0,posicion,posicion);
  
  stroke(random(227), random(217), random(27),random(30));
  ellipse(250,150,posicion,posicion);
   
   if (posicion > width) {
     
    posicion = 0;
    
  }
  }


