
color c[] = {
  #FFB132, #FF4A29, #2049B2
};

float mx, my, rSize; 
float inc, div; 
boolean looping = true; 

void setup() {
  size(550, 550); 
  background(255); 
  rectMode(CENTER); 
  noStroke(); 
  smooth(); 

  mx = width/2; 
  my = height/2; 
  inc = 0;
}

void draw() {
  translate(mx, my); 

  rSize = 200 + 200 * sin(inc);    
  div = map(mouseX, 0, width, 1, 20);

  float angle = inc; 
  for (int i = 0; i < 3; i++) {
    pushMatrix(); 
    rotate(angle); 
    fill(c[i]); 
    rect(0, 0, rSize, rSize);
    popMatrix(); 
    angle += PI/div; 
  }

  inc += 0.005;
}

void mouseReleased() {
  looping = !looping; 
  if (looping) {
    loop();
  } else { 
    noLoop();
  }
}



