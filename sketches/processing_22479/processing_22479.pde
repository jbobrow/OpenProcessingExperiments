
//KYLE LLESES
//PS2_1

void setup() {
  size(500, 500);
  background (0);
}
// STARTS WITH BLACK AND GRADIENTS TO RED
color shadeblack = color (0);
color shadered = color (205, 50, 120);

//LOOP
void draw () {
  for (int g = 0; g < height; g++) {
    float atm = norm (g, 0, height);
    stroke (lerpColor (shadeblack, shadered, atm));
    rect (g, 0, g, 500);
    
 ;
  }
}





