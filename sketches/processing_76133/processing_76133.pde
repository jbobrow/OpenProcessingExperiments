
/*
transform
matrix
rotate
*/

Hand hourHand;  
Hand minuteHand, secondHand;

void setup(){   

  size(500,500);   
  smooth();
  hourHand  =  new Hand(100, 100, 70, 15);  
  minuteHand = new Hand(10, 150, 110, 8); 
  secondHand = new Hand(10, 320, 150, 2); 
}

void draw(){
  background(0,0,100);

  hourHand.resetPosition(width/2, height/2); //------- reset the position to the center
  hourHand.spin(0.2); //-------call spin function, ratate 0.2 degree every frame
  hourHand.display();
  
  minuteHand.resetPosition(width/2, height/2); //------- reset the position to the center
  minuteHand.spin(0.5); //-------call spin function, ratate 0.5 degree every frame
  minuteHand.display();
  
  secondHand.resetPosition(width/2, height/2); //------- reset the position to the center
  secondHand.spin(1); //-------call spin function ratate 1 degree every frame
  secondHand.display();
 
}


