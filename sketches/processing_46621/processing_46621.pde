
void setup() {
  size (500, 330);
  

  background (random(0,250),random(0,250),random(1,250));
  }


void draw() { 
  
 fill(random(0,250),random(0,250), random(0,250));
  {
    strokeWeight (2);
    stroke (random(#F5F16D,#4068FF));
    for (int d = 490; d > 20; d -= random(20,40)) {
      ellipse(150, 180, d, d);
    }
  }

saveFrame("DavidGarcía_hypnofor.png");}

