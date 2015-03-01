
// Make position array
float[] xRay = new float [20];
float[] yRay = new float [20];
float xoff = 0.0;
int timer = 0;

void setup() {
  size(800, 800);
  noiseSeed(0);
  noStroke();
  smooth();
}

void draw() {



  // Intialize position arrays
  for (int i = 0; i <20; i++) {
    xRay[i] = random(1, 40);
    yRay[i] = random(1, 40);
  }


  fill(255,255,255,30);

  // Create 20 rectangles around the canvas randomly
  for (int i =0; i < 20; i++) { 
    rect(xRay[i]*19, yRay[i]*19, random(25), random(1, 3),xRay[i]*19, yRay[i]*19, random(25), random(1, 3));
  }

  noFill();
  switch (timer) {   // my brother tried showing me this code to put color into the bottom idk how effictive it is?
  case 100:
    stroke(0, 0, random(255), 100); 
    break;
  case 200:
    stroke(0, random(255), 0, 100); 
    break;
  case 300:  
    stroke(random(255), 0, 0, 100); 
    break;
  case 400:  
    stroke(0, random(255), random(255), 100); 
    break;
  case 500:  
    stroke(random(255), 0, random(255), 100); 
    break;
  case 600:  
    stroke(random(255), random(255), 0, 100); 
    break;
  case 700:  
    stroke(random(255), 0, 0, 100); 
    break;
  case 800:  
    stroke(0, 0, random(255), 100); 
    break;
  case 900:  
    stroke(0, random(255), 0, 100); 
    break;
  case 1000: 
    stroke(0, 0, random(255), 100); 
    break;
  }
  drawCircle(2);
  timer++;
}

void drawCircle(int numCir) {
  for (int i =0; i < 17; i ++) {
    rect(i * 50, height/2, random(50), mouseX);
  }

  stroke(0, 10);

  xoff = xoff + .01;    // wanted to play with noise function modified from noiseSeed example on processing.org
  float n = noise(xoff) * width;
  rect(n, 0, n, height);
}

