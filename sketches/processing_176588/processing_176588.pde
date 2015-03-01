

int[] data ;

PImage moose ;
PImage chart ;

ArrayList cars;

String[] labels = {"1.", "2.", "3.", "4.", "5.", "6.", "7."} ; 

void setup() {
  size(1200, 550);
   
  String[] stuff = loadStrings("data.txt") ;
  println(stuff) ;

  data = int(split(stuff[0], ',')) ;
  moose = loadImage("moose_big2.png") ;
  chart = loadImage("chart.png");

  // Create an empty ArrayList
  cars = new ArrayList();

  int lastMooseButt = 0 ;
  for (int i = 0; i <data.length; i ++) {
 //   for (int i = 0; i <1; i ++) {


    cars.add(new Car(data[i], lastMooseButt, i)  );  


    lastMooseButt = lastMooseButt + data[i]/100 ;
  }
}

void draw() {
  background(0) ; 
 // stroke(0) ;
  for (int i = 0; i < cars.size(); i++) {
    Car thisCar = (Car) cars.get(i) ;

    thisCar.display() ;
    thisCar.update() ;
  }
  
  // put your data table here
   
  image(chart, 900, 20) ; 
  
}

class Car{

//  float xVel;
  PVector velocity ;
  PVector position ;
  float wide ;
  int myfData ;
String myLabel ; 

  // Car constructor
  Car(int myData, int lastMooseButt, int i){
    
  
  
    velocity = new PVector(-1, 0) ;
//    xVel = tempxVel;
myfData = myData ;
    wide = myfData/100 ;
      position = new PVector(lastMooseButt, height-wide) ;
      myLabel = labels[i] ; 
  }

  //methods
  void display(){
    fill(255) ; 
 //   println("wide = " + wide) ;
 //   println("position.x = "+ position.x) ; 
    image(moose, position.x, position.y-60, wide, wide);
    fill(255, 0, 0) ; 
//    text(myfData, position.x + 30, height-40) ;  //position.y + wide/2) ;
// text(myLabel, position.x + 30, height-25) ; 
     text(myfData, position.x + wide/2, height-40) ;  //position.y + wide/2) ;
 text(myLabel, position.x + wide/2, height-25) ; 
  }

  void update(){
    position.add(velocity);
    
  
    if (position.x < -480) {
      position.x = width ;
    }

    
  }

}



