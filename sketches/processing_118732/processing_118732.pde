
void setup() {
  size(900,900);
  
  smooth();
  
 background(0);
  
  colorMode(HSB);
  
}

void draw() {
  noStroke();
  
  
  fill(100,200,0,15);
  
 

  

  fill(random(100,255), random(150,255), random(100,255));
  
  ellipse(random(0,width), random(0, height), 10, 10);
   ellipse(random(0,width), random(0, height), 10, 10);
    ellipse(random(0,width), random(0, height), 20, 20);
     ellipse(random(0,width), random(0, height), 30, 30);
      ellipse(random(0,width), random(0, height), 25, 25);
       ellipse(random(0,width), random(0, height), 10, 10);
        ellipse(random(0,width), random(0, height), 10, 10);
         ellipse(random(0,width), random(0, height), 10, 10);
          ellipse(random(0,width), random(0, height), 10, 10);
           ellipse(random(0,width), random(0, height), 10, 10);
           ellipse(random(0,width), random(0, height), 15, 15);
           ellipse(random(0,width), random(0, height), 10, 10);
           ellipse(random(0,width), random(0, height), 20, 20);
           ellipse(random(0,width), random(0, height), 20, 20);
           ellipse(random(0,width), random(0, height), 15, 15);
           ellipse(random(0,width), random(0, height), 15, 15);
           
  
  frameRate(25);
  smooth();
}
