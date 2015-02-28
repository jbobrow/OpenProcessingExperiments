
int maxNumbers = 47;

//float [] numbers = new float [100];
//int[] numbers = new int[3]; 
boids [] numbers;
int l = 10000;



void setup (){
  size (600, 400);
  numbers = new boids [l];


for (int i = 0; i < l; i = i+1) {
  
  float tempRadius= random (10);
  PVector tempPosition = new PVector(random(600),random(400));
  PVector tempSpeed = new PVector(random(-2,2),random(-2,2));
  
  numbers [i] =new boids (tempRadius, tempPosition, tempSpeed);
 
// println ("Die Zahl" + i + "ist=" + numbers [i]);
}
}
void draw (){
  background(255);
  for (int i =0; i<l; i=i+1){
    numbers [i].moveBoid();
    numbers [i].showBoid();
  }
}


//numbers [5] = numbers [0] + numbers [1] + numbers [2] + numbers [3] + numbers [4];


//println(numbers[2]);

class boids {
  float radius;
    PVector position;
    PVector speed;
    boids(float _radius, PVector _position, PVector _speed){
      radius= _radius;
      position = _position;
      speed = _speed;
    }
    
    void showBoid() {
      ellipse( position.x, position.y, radius*2, radius*2);
    }
     void moveBoid() {
     position.add(speed);
    }
}



