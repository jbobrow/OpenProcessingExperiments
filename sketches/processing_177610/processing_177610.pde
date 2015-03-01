
float myFloat = 50;
 
Stripe [] myStripe = new Stripe [20];
 
void setup () {
   
  size (1000,700);
  smooth ();
  noStroke();
   
   
  for (int i=0; i<myStripe.length; i++) {
    myStripe[i] = new Stripe (i*50,40,35); // change number to i times the size gap wanted to stop stripes beeing over top eachother
     
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
    fill (30,30,19);
    rect (x,0,stripeSize,height);
    rect(325,200,300,300);
    fill(0);
    rect(370,250,200,200);
    fill(30,30,19);
    rect(420,300,100,100);
    fill(0);
    rect(450,330,35,35);
    
  }
}

