
float w;
float h;
int x = 0;
float y;
float speed = 1.5;
  
void setup() {
  size(700, 700);
  y = height/random(200,500);
  frameRate(15);
  rectMode(CENTER);
  smooth();
}
  
void draw() {
  background(0);
  speed*=1.1; 
    
  for (int j=1; j<500; j++) { 
    w = random(40,80);
    h = random(50,90);
    fill(random(255), random(150), random(100),255);
    y = height/2 + random(-500,500);
    rect((-speed*random(-1.2,1.2)+(width-10)), y, w, h);
    fill(random(100), random(150), random(255),200);
    ellipse(speed*random(-1.2,1.2), y, w, h); 
  }
}

