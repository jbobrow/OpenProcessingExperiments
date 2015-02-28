
/*
array and "for" loop
 */

Hand hourHand;  
Hand minuteHand, secondHand;
int clockDiameter;

Dial[] dials;

void setup() {   

  size(500, 500 );   
  smooth();
  hourHand  =  new Hand(100, 100, 70, 15);  
  minuteHand = new Hand(10, 150, 110, 8); 
  secondHand = new Hand(10, 320, 150, 2); 

  clockDiameter = width/2-20;

  dials = new Dial[120];
  for (int i=0; i < dials.length; i++) {
    dials[i] = new Dial(120, i); 
  }
}

void draw() {
//  fill(0, 0, 100,5);
//  rect(0,0,width*2, height*2);
  background(0, 0, 100);
  hourHand.resetPosition(width/2, height/2);  
  hourHand.spin(0.2); 
 // hourHand.blink(20);//-------call blink function, blink every 20 degree 
  hourHand.display();

  minuteHand.resetPosition(width/2, height/2); 
  minuteHand.spin(0.5);  
 // minuteHand.blink(10);//-------call blink function, blink every 10 degree 
  minuteHand.display();

  secondHand.resetPosition(width/2, height/2);  
  secondHand.spin(1);  
 // secondHand.blink(3);//-------call blink function, blink every 3 degree 
  secondHand.display();

  
  for (int i =0; i<dials.length; i++) {
    dials[i].setNumber(i+1);
    dials[i].setPosition(width/2,height/2,170,i);
    dials[i].blowUp(secondHand);
    if(mousePressed){
       dials[i].moveToTarget();
    }else{
        dials[i].fly();
    }
     
      dials[i].display(false);
     
  }
}


