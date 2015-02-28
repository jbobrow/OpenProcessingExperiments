
int x = 0;
int speed = 1;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  dolas();
  geridon();
  ciz();

}
  
  void dolas() {
   x = x + speed; 
  }
  
  
  void geridon() {
     if ((x > width) || (x < 0)) {
    
     speed = speed * -1;
  }
  }
  
  void ciz() {
  stroke(255);
  fill(170,45,67);
  ellipse(x,100,32,32);
  
}
  


