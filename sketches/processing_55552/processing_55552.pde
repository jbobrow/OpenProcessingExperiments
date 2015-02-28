
float x = 0.0;
float y = 0.0;

void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  //click mouse to clear
  if (mousePressed) {
    background(255);
  }
  frameRate(100);
  x += 5;
  y = -x + 300;
  //changed colour and put white square around using y

//pink

  fill(204, 102, 100);
  alpha (40);
  ellipse(100, 100, x, x);
  //changes the size
  if (x >100) {
    x = 0;
  }
  
  //lime green
  
    fill(204, 303, 10);
  alpha (40);
  ellipse(200, 200, x, x);
  if (x >100) {
    x = 0;
  }
  
  //dark green
  
      fill(104, 102, 10);
  alpha (40);
  ellipse(300, 300, x, x);
  if (x >100) {
    x = 0;
  }
  
  //peach
 
  
    fill(204, 102, 50);
  alpha (40);
  ellipse(100, 300, x, x);
  if (x >100) {
    x = 0;
  }
  
 //purple
 
      fill(204, 102, 200);
  alpha (40);
  ellipse(300, 100, x, x);
  if (x >100) {
    x = 0;
  }
}

