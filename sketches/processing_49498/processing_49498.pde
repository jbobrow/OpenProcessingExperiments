
Stripe [] myStripe = new Stripe [20];

void setup(){
  size (400, 400);
  smooth();
  
  for (int i = 0; i < myStripe.length; i++){
   myStripe[i] = new Stripe (i*30, 10, 20); 
  }
  
}

void draw(){
  
  background(0, 0, 160);
  
  for (int i = 0; i < myStripe.length; i++){
       
   myStripe[i].drawStripe();
  }
  
}

class Stripe{
  float x;
  float y;
  
  float r;
  
Stripe(float xpos, float ypos, float stripeSize){
  x = xpos;
  y = ypos;
  r = stripeSize;
}  
  
  void drawStripe(){
    noStroke();
    rect (x-10, y-10, 20, height);
  }
}
