
float x;
float y;
float easing = 0.05; //each frame, it moves by 5% the remaining distance to the cursor

void setup() {
  size(600, 600); 
  noStroke();  
  x = width;
  y = height;
}

void draw() { 
  background(0);
  
  float targetX = mouseX; //setup our target position
  float dx = targetX - x; //find the distance between the target and the original position
  if(abs(dx) > 1) { //if the distance is greater than 1 pixel (negative or positive), keep easing x in
    x += dx * easing; //move x by 5%(easing) of the remaining distance
  }
  
  float targetY = mouseY; //repeat for Y
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  float diam = abs(dist(mouseX, mouseY, x, y)); //make the diameter representative of the distance
  diam = constrain(diam, 60, 180); //set a minimum and maximum size
  
  ellipse(x, y, diam, diam);
  
}
