
Bird [] bird = new Bird[10];

void setup() {
  size(800,245);
  smooth();
  
  for (int i = 0; i < bird.length; i++) {
    bird[i] = new Bird(random(width),200,random(10,70),random(255),random(255),random(255),random(8));
}
}

void draw() {
  
  backgroundColor();
  
  for (int j = 0; j < bird.length; j++) {
    bird[j].display();
    bird[j].move();
   }
  
}


void mousePressed() {
  Bird k = new Bird (mouseX,200,random(10,70),random(255),random(255),random(255),random(8));
  bird = (Bird[]) append(bird,k);
}


  






