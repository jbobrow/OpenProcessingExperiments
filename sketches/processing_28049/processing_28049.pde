
int Spacing = 50;
int XPos = 0;
int YPos= 0;

 
//color[] mycolors = {#9AB8B9,#47586c,#bd776d,#012f46,#2A3A55,#552A3C,#FAD930,
//#FF600F,#729DD8,#9DAA76,#AA7692,#9376AA,#B9351E,#E32E2E,#29333E,#F50202,#4B3C50,
//#5D6293};

//color[] mycolors = {#9AB8B9,#556F90,#1E4D6C,#2B394B,#2B394B};
color[] mycolors3 = {#ae0956,#d74643,#cd5652,#59084a,#68004b,#a86670,#d74643,
#b08380};

color[] mycolors1 = {#99aa9a, #01002c,#1d5669,#2a4a61,#485367,#000c34,#305367,
#57556b,#11002a,#64727d,#393e5b
};

color[] mycolors2 = {#d9ac69, #e07436,#e6da62,#c99973,#e16935,#e39241,#eac34c
,#ffe304};

color[] mycolors = {#d9ac69,#e6da62,#c99973,#e16935,#eac34c
,#ffe304,#99aa9a,#01002c,#1d5669,#2a4a61,#485367,#000c34,#305367,#57556b,
#11002a,#64727d,#393e5b,#ae0956,#d74643,#cd5652,#59084a,#68004b,#a86670,#d74643,
#b08380,#4d2a52,#a03e64,#90566f,#305367,#57556b,#11002a,#64727d,#393e5b,#06001c
};


//int myc = mycolors [int(random(0,33))];


void setup() {
  size(500,500);
  colorMode(HSB);
  textAlign(CENTER);
  textSize(24);
  text("Press S to save an image.",250,250);
}


void mousePressed() {
  background(255);
  noStroke();
  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,33))]);
      triangle(XPos, YPos, XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing);
      fill(mycolors [int(random(0,33))]);
      triangle(XPos, YPos, XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing);
    }
  }


  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,33))]);
      triangle(XPos+50, YPos+50, XPos+50, YPos+Spacing+50, XPos+Spacing+50, YPos+Spacing+50);
      fill(mycolors [int(random(0,33))]);
      triangle(XPos+50, YPos+50, XPos+Spacing+50, YPos+50, XPos+Spacing+50, YPos+Spacing+50);
    }
  }

  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {
      fill(mycolors [int(random(0,33))]);
      triangle(XPos+50, YPos+Spacing, XPos+Spacing+50, YPos+Spacing, XPos+Spacing+50, YPos);
      fill(mycolors [int(random(0,33))]);
      triangle(XPos+50, YPos+Spacing, XPos+50, YPos, XPos+Spacing+50, YPos);
    }
  }


  for(int XPos=0;XPos<500;XPos=XPos+100) {
    for (int YPos=0;YPos<500;YPos=YPos+100) {  
      fill(mycolors [int(random(0,33))]);
      triangle(XPos, YPos+Spacing+50, XPos+Spacing, YPos+Spacing+50, XPos+Spacing, YPos+50);
      fill(mycolors [int(random(0,33))]);
      triangle(XPos, YPos+Spacing+50, XPos, YPos+50, XPos+Spacing, YPos+50);
    }
  }
}
void draw() {
}
  
void keyPressed() {
  if (key == 's' || key == 'S'){
      saveFrame("filename-####.png");
    }
}

