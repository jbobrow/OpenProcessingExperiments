
//Degree Show 2014//
//Triangle Flipper//
int Spacing = 98;
int XPos = 0;
int YPos= 0;
//RGB versions need array format change
//green(149,193,31) 96c11f
//GreenGrey (117,151,56) 759738
//grey (203,187,159) cbbb9f
//Pink (230,0,126) e6007e
//Maroon (149,43,44) 952b2c
//Brown (94,33,29) 5e211d
//PinkDark (192,22,94) c0165e
color[] mycolors = {#759538,#96c11f,#cbbb9f,#e6007e,#5e211d
,#952b2c,#c0165e};
 
 
//int myc = mycolors [int(random(0,33))];
 
 
void setup() {
  size(500,500);
  colorMode(HSB);
  textAlign(CENTER);
  textSize(24);
  text("Press S to save an image.",250,250);
}

void draw() {
  background(255);
  noStroke();
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,7))]);
      triangle(XPos, YPos+4, XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing);
      fill(mycolors [int(random(0,7))]);
      triangle(XPos, YPos, XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing-4);
    }
  }
}
