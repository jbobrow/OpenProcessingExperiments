
Dot[] One = new Dot[50];


void setup(){
  size(1000, 1000);
  smooth();
  background(255);
  for (int i = 0; i < 50; i++){
    One[i] = new Dot(random(100), random(10), color(5*i)); 
  }
  
//  Two = new Dot(10, color(234));
}

void draw(){
  for (int i = 0; i < 50; i++){
    One[i].move();
    One[i].display();; 
  }

}
class Dot {
 int fillC;
 float a;
 int x;
 int y;
 float size;
 Dot(float tempA, float tempZ, int tempC){
   a = tempA;
   fillC = tempC;
   size = tempZ;
 }
   void move(){
     x = mouseX;
     y = mouseY;
   }
   
   void display(){

     noStroke();
     fill(fillC);
     ellipse(x-(a*random(10)), y-(a*random(10)), size, size);
   }
  
  
}


