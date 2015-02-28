

float myFloat = 50;

Stripe [] myStripe = new Stripe [9];

void setup () {
  
  size (400,400);
  smooth ();
  noStroke();
  
  
  for (int i=0; i<myStripe.length; i++) {
    myStripe[i] = new Stripe (i*50,40,20); // change number to i times the size gap wanted to stop stripes beeing over top eachother
    
  }
  
  
  
}

void draw () {
  
  background (0);
  
  for (int i=0; i<myStripe.length; i++) {
    
    myStripe[i].drawStripe ();
    
  }
}

class Stripe {
 
 float x;
 float y;
 float stripeSize;

Stripe (float xpos, float ypos, float sSize) {
 
 x = xpos;
 y = ypos;
stripeSize = sSize;


 
}
  
  void drawStripe () {
    fill (0,0,190);
    rect (x,0,stripeSize,height);
  }
}

