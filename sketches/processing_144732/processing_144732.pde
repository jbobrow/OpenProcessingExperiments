
PImage Grave;
PImage ghost;
float offset = 0;
float offsett = 0;
float easing = 0.05;

void setup(){
  size(587,389);
  Grave = requestImage("grave.PNG");
  ghost = requestImage("ghost.png");
}

void draw(){
image(Grave,0,0);
filter(INVERT);
float dx = (100);
  offset += dx * easing; 
  
  tint(255, 75);  // Display at half opacity
  image(ghost, offset, 10);
  
  tint(255, 75);  // Display at half opacity
  image(ghost, offset, 130);
  
    tint(255, 75);  // Display at half opacity
  image(ghost, offset, 250);

  
  
}



