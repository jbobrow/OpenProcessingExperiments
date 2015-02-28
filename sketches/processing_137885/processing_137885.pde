
Circles purple;


void setup (){
  size(400, 400);
  background (255);
  smooth();
  purple = new Circles();
  
}


void draw (){
  purple.display();
  
}
class Circles{
  
  //global variables
  float x = width;
  float y = height;
  

  //Constructor
  Circle(float x, float y){
 
}
} 
  //Functions
  void display(){
    fill(random(150,255), 0 , random(150,255), 75);
    ellipse(x, y,x, y);
  }

