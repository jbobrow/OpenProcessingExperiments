
float time = 0;


void setup() {
frameRate(15);
  size (1920, 1080);
  background(0);
  smooth();
}

void draw() {
 fill(0,150);
  rect(0,0,width,height);
  
  float x = 0;
float y = 0;
  while (x <width) {
    strokeWeight(5);
    stroke(#815F40);
    point(x, height*noise(x/105, time));
   
    
    strokeWeight(5);
    stroke(#815F40);
    point(x, height*noise(x, time));
   
   y=y-1;
    x= x + 1;
  }
  time = time + 0.05;
}


