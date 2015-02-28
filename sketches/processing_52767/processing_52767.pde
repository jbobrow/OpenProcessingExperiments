
//Mauricio Orantes
//Gravity Simulation on Ball

color g = #526F35;
float x =400;
float y = 400;
float acceleration = 0;
//int direction = 1;
float gravity = 0.1;

void setup(){
size(800,600);
  background(255);
  smooth();
}

void draw(){
  background(255);
  makeball();
  scale(10);
   y = y+acceleration; //Vertical plus the Acceleration of 0, remains constant
     acceleration = acceleration + gravity; //Acceleration is the sum of gravity and acceleration 0 + 0.1
      if (y >600) { //condition if Vertical is greater than 600 then perform action below
     acceleration = acceleration * -0.85;//-.085 is an arbitrary number that took some experimenting with
  }
}
 
//BALL
void makeball(){
 ellipse(x,y,40,40);
  fill(g);
  smooth();
   
}

