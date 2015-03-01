
//declare , vroom vroom

Car car1;
Car car2;
Car car3;
 
void setup(){
  size(800,600);
  car1 = new Car(100);
  car2 = new Car(290);
  car3 = new Car(460);
}

//so many voids...
void keyPressed(){
  setup();
  draw();
} 

//ALL the voids!
void draw(){
  background(120);

  //make cars show up 
  car1.display();
  car1.move();
  car2.display();
  car2.move();
  car3.display();
  car3.move();
 
    //hit walls
    if (car1.x > width-25 || car1.x < 0 ||
        car2.x > width-25 || car2.x < 0 ||
        car3.x > width-25 || car3.x < 0 ) {
      //change direction
      car1.speed = (car1.speed)*-1;
      car2.speed = (car2.speed)*-1;
      car3.speed = (car3.speed)*-1;
} 
}
 

//insert object
class Car {
  float x;
  int y;
  float speed; 
  int r;
  int g;
  int b;

  //random speeds for each car
  Car(int vroom) {
    y = vroom;
    x = 150;
    r = 255;
    g = 255;
    b = 255;
    
    speed = random(5,10); 
  }
  
//show cars color when hitting walls, too many voids inside voids
  void display(){
    if (x > width - 25 || x < 0){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    } 
    
    fill(r,g,b);
    rect(x,y,25,15); 
  }
  
  //this is the last void...right?
  void move(){
     x = x + (speed);
  }    
}

