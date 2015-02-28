
ArrayList birds;   
float t = 0;
int f = 0;
  
void setup() { 
  size(400,400,P2D);
  fill(255,0,0);
  noStroke();
  smooth();
  colorMode(RGB);
  frameRate(60); 
  birds = new ArrayList();
}
 
void draw(){
  t = t + .02;
  fill(255);
  rect(0, 0, width, height);
  updateBirds();
  drawBirds();
}
  
void updateBirds(){
   int maxBirds = 41;
   if (birds.size() < maxBirds) {
     int temp = int(random(0,3));
     if ((temp == 1) || (temp == 0)){
        birds.add(new Bird (random(-10, 0), random(0, height), random(1,8),random(1,8)));
     } 
     if ((temp == 2) || (temp == 3)){
        birds.add(new Bird (random(0, width), random(-10, 0), random(1,8),random(1,8)));
     }  
   }
}
     
void drawBirds(){      
  for (int i = birds.size() - 1; i >= 0; i--) {
    Bird bird = (Bird) birds.get(i);
    bird.update(); 
    if (bird.finished()) {
      birds.remove(i);
    } else {
      bird.display();
    }  
  } 
}

class Bird {
  float x, y;
  float factorx;
  float factory;
  boolean FINISHED = false;
  
  Bird(float x, float y, float f, float g) {
    this.x = x;
    this.y = y; 
    this.factorx = f;
    this.factory = g;   
  }
  
  void update() {
    this.x = this.x + factorx;
    this.y = this.y + factory;
    if (this.x > width + 10){
       FINISHED = true;
    } 
    if (this.y > height + 10){
       FINISHED = true;
    }
  }
  
  void display() { 
   fill(0);
   pushMatrix();
   translate(0,height);
   scale(1,-1);
    ellipse(this.x, this.y, 10, 10);
    popMatrix();
  }
  
 boolean finished() {
    return FINISHED;
  }
}
