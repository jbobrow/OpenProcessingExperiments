
Stripe [] stripe1 = new Stripe [30];

void setup () {

  size (500, 500);
  smooth ();
  noStroke ();

  for (int i = 0; i < stripe1.length; i++) {

    stripe1[i] = new Stripe (i*20, 10, 10);
  }
}

void draw () {

  background (50);

  for (int i = 0; i < stripe1.length; i++) {

    stripe1[i].drawStripe ();
  }
}



class Stripe {
  
  float x;
  float y;
  float r;
  
  Stripe (float xpos, float ypos, float s) {
    
    x = xpos;
    y = ypos;
    r = s;    
       
  }  
  
  void drawStripe () {

  fill (255);
  rect(x-10, y-10, r, height+20);
  
}

  
}

