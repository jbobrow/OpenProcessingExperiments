
 //declare that you WANT to 
 //make three instants of class Hand called "hourHand","minuteHand","secondHand" 
Hand hourHand;  
Hand minuteHand, secondHand;

void setup(){  // setup runs once when the program starts

  size(500,500);  //size of the canvas
  
  hourHand = new Hand(10, 10, 70); //construct hourHand as a instant of class Hand 
  minuteHand = new Hand(10, 150, 110);//construct hourHand as a instant of class Hand
  secondHand = new Hand(10, 320, 150);//construct minuteHand as a instant of class Hand
}

void draw(){
  background(0,0,100);

  hourHand.move(1); 
  hourHand.display(10);
  
  minuteHand.move(2);
  minuteHand.display(6);
  
  secondHand.move(3);
  secondHand.display(3);
}








