
int Spacing = 50;
int XPos = 0;
int YPos= 0;
  
//color[] mycolors = {#9AB8B9,#47586c,#bd776d,#012f46,#2A3A55,#552A3C,#FAD930,
//#FF600F,#729DD8,#9DAA76,#AA7692,#9376AA,#B9351E,#E32E2E,#29333E,#F50202,#4B3C50,
//#5D6293};
 
color[] mycolors = {#9AB8B9,#556F90,#1E4D6C,#2B394B,#2B394B};
 
 
void setup() {
  size(500,500);
  colorMode(HSB);
  frameRate (11);
}
 
void draw() {
  background(0);
  noStroke();
  
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,4))]);
      triangle(XPos, YPos, XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing);
      fill(mycolors [int(random(0,4))]);
      triangle(XPos, YPos, XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing);
    }
  }
 
 
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,4))]);
      triangle(XPos+50, YPos+50, XPos+50, YPos+Spacing+50, XPos+Spacing+50, YPos+Spacing+50);
      fill(mycolors [int(random(0,4))]);
      triangle(XPos+50, YPos+50, XPos+Spacing+50, YPos+50, XPos+Spacing+50, YPos+Spacing+50);
    }
  }
 
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,4))]);
      triangle(XPos+50, YPos+Spacing, XPos+Spacing+50, YPos+Spacing, XPos+Spacing+50, YPos);
      fill(mycolors [int(random(0,4))]);
      triangle(XPos+50, YPos+Spacing, XPos+50, YPos, XPos+Spacing+50, YPos);
    }
  }
 
 
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) { 
      fill(mycolors [int(random(0,4))]);
      triangle(XPos, YPos+Spacing+50, XPos+Spacing, YPos+Spacing+50, XPos+Spacing, YPos+50);
      fill(mycolors [int(random(0,4))]);
      triangle(XPos, YPos+Spacing+50, XPos, YPos+50, XPos+Spacing, YPos+50);
    }
  }
}


   
                
