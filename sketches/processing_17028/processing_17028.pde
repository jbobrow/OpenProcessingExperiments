
       float t = 0.0;

void setup() {
  size(200,200);
  smooth();
  frameRate(60);
}


void draw() {

  background(random(0,255));
float xoff = t;
  for (int i = 0; i < width; i++) {
    float y = noise(xoff)*height;
    xoff += 0.01;
//noFill();

    stroke(random(0,255), random(0,255));
    
    color c1 = color(random(0,255), random(0,255), random(0,255));
fill(c1);
    line(i,height,i,height-y);
    //stroke(180, 180);
    
    
    
 line(i,height-40,i,height-40-y);
  }
  
  t+= 0.1;
}
    
