
float angle1, angle2; 
float factor; 

void setup() {
  size(400, 400); 
  background(255); 
  smooth(); 
  noStroke(); 
  rectMode(CENTER); 
  frameRate(7);

  angle1 = 0; 
  angle2 = 0;
  factor = 0.05; 
}

void draw() {
  background(255);

  if(mousePressed){
    factor = map(mouseX, 0, width, 0.01, 0.5); 
  }
  float size = width; 

  pushMatrix();
  translate(width/2, height/2); 
  for (int i = 0; i < 26; i++) {
       if (i%2 == 0) {
         stroke(#830404);
      fill(#830404, 80 + i*10);
      rotate(radians(angle1)); 
      angle1 += i*factor;
    } else {
      noStroke();
      fill(255);
      rotate(radians(angle2));
      angle2 -= i*factor;
    }

    rect(0, 0, size, size);

    size -= 15;
  }
  popMatrix();
}



