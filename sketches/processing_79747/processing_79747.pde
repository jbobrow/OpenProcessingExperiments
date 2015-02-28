
int maxNumbers = 47; 
boids [] numbers;
int l =100;


void setup () { 
  size(800, 300);
  numbers= new boids [l];

  for (int i = 0; i <l;i=i+1) {
    float tempRadius = random(5);
    PVector tempPosition = new PVector ( random (800), random (300));
    PVector tempSpeed = new PVector ( random(-1, 2), random(-1, 2));

    numbers[i]=new boids (tempRadius, tempPosition, tempSpeed);
    numbers[i].showBoid();


  }
}
void draw () {
  background (#16F7D7);
  for (int i = 0; i <l;i=i+1) 
  {
    numbers[i].moveBoid();
    numbers[i].showBoid();
  }
  testDistance();
}


void testDistance() {
  for (int i=0;i<numbers.length; i=i+1) {
    boids   boid1 = numbers[i];
    
    for (int j=i+1;j<numbers.length; j=j+1) {
      boids   boid2 = numbers[j];
      float distance=PVector.dist (boid1.position, boid2.position ); 
      if (distance<2)
      {
        //boid1.speed.set(boid2.speed);
        //boid2.speed.set(0, 0, 0); //freeze
        boid1.radius=boid2.radius*2; //grow
        //numbers[i]=numbers[i+1];wtf
      
        
        
      }
    }
  }
}


