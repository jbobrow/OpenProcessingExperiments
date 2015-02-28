
// black square
int x = 10;
int y = height/2;

// elements speed
int v = 6;

// black ellipse
int t = height;
int u = 420;

// black ellipse and square dimensions
int a = 40;

void setup() { 
  size (600, 600);
  }

void draw() {
  background(255, 0, 0);
  fill(255);

  if (x <= width) {
    noStroke();
    fill(0);
    rect(x, y, a, a);
    fill(0, 0, 255);
    ellipse(y/2, x/2, 90, 90);
    x += v;
  } 
  
  if (x > width) {
    x = 0;
  }
  
  // with "z" key, move the black square downward
  if (keyPressed && key == 'z' && a != 20) { 
    y += 20;
    if (y > height) {
      y = 0;
    }
  } 
  
  // with "x" key, move the black square upward
  if (keyPressed && key == 'x' && a != 20) { 
    y -= 20; 
    if (y < 0) {
      y = height;
    }
  }


  if (t <= height) {
    noStroke();
    fill(0);
    ellipse(u, t, a, a);
    t += v;
  } 
  
  if (t > height) {
    t = 0;
  }
  
  // with "u" key, move the black ellipse right
  if (keyPressed && key == 'i' && a != 10) { 
    u += 20;
    if (u > height) {
      u = 0;
    }
  } 
  
  // with "i" key, move the black ellipse left
  if (keyPressed && key == 'u' && a != 30) { 
    u -= 20; 
    if (u < 0) {
      u = height;
    }
  }
  
  if ( t > 300 || t < height) {
    fill(0, 255, 0);
    rect(t-v-2, u, 40, 40);
  }
  
  // when black square & ellipse meet,
  // turn background white
  if(x < u && x + a + 10 > u && y < t && y + a + 10 > t){
    background(255, 0, 255);
    x=0;
    a -= 10;
    v++;
    
    if(a < 1) {
    noLoop();
    background(255);
    smooth();
    fill(0);
    triangle(width/2, 30, 30, 2*height/3, width-30, 2*height/3);
    }
  }
}


