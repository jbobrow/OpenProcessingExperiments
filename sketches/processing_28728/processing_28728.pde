

// by animatek 18/03/2011
/////////////////////////////



///////////////////////////////


// inicializa variables
int y = 80;
int d = 80;

float angle = 0.10;
float angleDirection = 12;
float speed = 0.0005;




//setup

void setup() {
  smooth();
  size (300,300);// tamaño de salida
  background ( 0 ); //Color de fondo

  
}







void draw () {
stroke(0, 0, 0);

 
  if (mousePressed) {
    fill(0, 0, 0);  
  } else {
    fill(random(255), random(255), random(255));
    stroke(0, 0, 0);  
  }
  ellipse(random(HALF_PI), random(-HALF_PI), y, d);
  translate(random(HALF_PI), 20);
  rotate(random(-HALF_PI));
  ellipse(mouseY, mouseX, random(25), random(25 ));
  rect(mouseY, mouseX, random(100), random(100 ));
  triangle(mouseY, mouseX, mouseX, mouseY, mouseY, -mouseX);
  translate(-25, random(-HALF_PI));
  rotate(120);
  ellipse(mouseX, mouseY, random(5), random(5 ));
  ellipse(mouseY, mouseX, random(20), random(20));
  rotate(random(360));
  ellipse(random(-HALF_PI), mouseY, random(30), random(30 ));
  ellipse(mouseY, random(HALF_PI), d/2, y);
  ellipse(mouseX, random(-HALF_PI), y/4, d);
  ellipse(random(HALF_PI), random(-HALF_PI), random(80), random(80));
  triangle(-mouseY, mouseX, -mouseX, mouseY, -mouseY, -mouseX);
  ellipse(mouseX, mouseY, random(100), random(100));
  rect(random(HALF_PI), random(-HALF_PI), 55, 55);
  translate(mouseX, mouseY, 0);
  sphere(28);

  
  angle += speed * angleDirection;
  if ((angle > random(360)) || (angle == random(180))) {
    angleDirection *= 1;
  

  
}


}
        
                
