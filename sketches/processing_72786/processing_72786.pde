
float w;
float h;
int x = 0;
float y;
float speed = 0.5;
 
void setup() {
  size(500, 500);
  y = height/random(2,4);
  frameRate(30);
  rectMode(CENTER);
  smooth();
}
 
void draw() {
  background(255);
  speed*=1.05;  
   
  for (int j=1; j<500; j++) {  
    w = random(10,40);
    h = random(10,40);
    fill(random(255), random(10), random(10),200);
    y = height/2 + random(-300,300);
    rect((-speed*random(-1.2,1.2)+(width-10)), y, w, h); 
    fill(random(10), random(10), random(255),200);
    ellipse(speed*random(-1.2,1.2), y, w, h);  
  }
}



