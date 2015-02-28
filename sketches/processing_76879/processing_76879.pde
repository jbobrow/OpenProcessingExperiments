
int maxNumbers =47;// Programmierer beginnen bei 0, nicht erst bei 1
/*oder:float [] numbers = new float [100];*/
boids [] numbers;
int l = 1000;


void setup() {
  size(600, 400);
  numbers=new boids[l];
  //numbers [0]=random(maxNumbers);
  for (int i = 0; i < l; i = i+1) {
    float tempRadius=random(10);
    PVector tempPosition=new PVector(random(600), random(400));
    PVector tempSpeed=new PVector(random(-2, 2), random(-2, 2));
    numbers [i]=new boids (tempRadius, tempPosition, tempSpeed);
    numbers[i].showBoid();
    //ellipse(random(600), random (400), 5, 5);
    //println("Die Zahl " + i + " ist= " + numbers [i]);
  }
}
void draw () {
  background(255);
  for (int i = 0; i < l; i = i+1) {
    numbers[i].moveBoid();
    numbers[i].showBoid();
  }
}


class boids {
  float radius;
  PVector position;
  PVector speed;
  boids(float _radius, PVector _position, PVector _speed) {
    radius = _radius;
    position = _position;
    speed = _speed;
  }
  void showBoid() {
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  void moveBoid() {
    position.add(speed);
    //ellipse(position.x, position.y, radius*2, radius*2);
  }
}
/*numbers [0]=random(maxNumbers); 
 numbers [1]=random(maxNumbers);
 numbers [2]=random(maxNumbers);
 numbers [3]=random(maxNumbers);
 numbers [4]=random(maxNumbers);
 numbers [5]= numbers [0]+ numbers [1]+ numbers [2]+ numbers [3]+ numbers [4];*/
//println(numbers[5]); //zeigt ergebnis unten in der anzeigenzeile



