
Car car1;
Car car2;
Car car3;

void setup(){
  size(800,600);
  car1 = new Car(1);
  car2 = new Car(3);
  car3 = new Car(2);
      
}

void draw(){
  fill(255);
  background(0);
  car1.display(10);
  car2.display(50);
  car3.display(120);
  
}


class Car{
  int x; 
  int y; 
  int sp; 
  Car(int tempSp){
   x =10;
   y =10;
   sp = tempSp;
  }
  
  void display(int ypos){
  y = ypos;
  //wheels
  rect(x+2,y-5,5,5);
  rect(x+13,y-5,5,5);
  rect(x+2,y+20,5,5);
  rect(x+13,y+20,5,5);
  //car -body
  rect(x,y,20,20);
  x = x+sp;
if (x > width){
  x =0;
} 
  
}
}


