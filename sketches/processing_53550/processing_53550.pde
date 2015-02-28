
// Simone Roth // PS2_1 // 
// White gradients to blue.
// Variable called "s". 

void setup() {
  size(500, 500);
  background (0);
}


color shadeblack = color (250);
color shadered = color (42, 145, 198);
 

void draw () {
  for (int s = 0; s < height; s++) {
    float atm = norm (s, 0, height);
    stroke (lerpColor (shadeblack, shadered, atm));
    rect (s, 0, s, 500);
     
 ;
  }
}

