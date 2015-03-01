
//
// click canvas to stop/restart sketch
//

float mx, my;
float angleStep = 10; 
float counter = 0; 
float diagonal; 
boolean looping = true; 

void setup() {
  size(500, 500); 
  background(0); 
  smooth(); 
  strokeWeight(3); 
  frameRate(10);

  colorMode(HSB, 360, 100, 100); 

  diagonal = dist(0, 0, width, height); 
  mx = width/2; 
  my = height/2;
}

void draw() {
  background(0); 

  float radius = 5;
  float angle = 0; 
  float x, y;  
  float eSize = 15;
  int farbe = 0;
  
  color c; 
  float alpha; 

  c = color(map(mouseX, 0, width, 0, 360), 100, 100); 

  while (radius <= diagonal/2) {         
    alpha = map(radius, 5, diagonal/2, 220, 0);
    if (farbe%2 == 0) { 
      fill(c, alpha);    
      stroke(360, 100);
    } else {
      fill(0, 100);
      stroke(c, alpha);
    }

    x = mx + radius * cos(radians(angle)); 
    y = my + radius * sin(radians(angle));

    ellipse(x, y, eSize, eSize);
    
    angle += angleStep;  
    radius += 1;
    eSize += 0.25;    
    farbe++; 
  }

  angleStep += sin(radians(counter)) * 360;
  counter += 0.0001;
}

void mouseReleased() {
  looping = !looping; 
  if (looping) {
    loop();
  } else {
    noLoop();
  }
}



