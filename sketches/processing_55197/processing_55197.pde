
PShape b1;
PShape b2;
PShape b3;
PShape b4;
PShape b5;
PShape b6;
PShape b7;
PShape b8;
PShape hungry;
PShape or;
PShape cameraa; // CAMERA
PShape camerashutter; // SHUTTER BUTTON
PShape rvpp; // RED VELVET PREP PAGE
PShape epp; //  ECLAIR PREP PAGE
PShape cspp; // CINNAMON STREUSEL PREP PAGE
PShape bpp; // BAGUETTE PREP PAGE
PShape rpp; // RUGELACH PREP PAGE

PImage rvfp; // RED VELVET FINAL IMAGE
PImage rvfp2; // RED VELVET FINAL IMAGE 2
PImage rvfp3; // RED VELVET FINAL IMAGE 3
PImage rvfp4; // RED VELVET FINAL IMAGE 4
PImage rvfp5; // RED VELVET FINAL IMAGE 5

PImage efp; // ECLAIR FINAL IMAGE
PImage efp2; // ECLAIR FINAL IMAGE 2
PImage efp3; // ECLAIR FINAL IMAGE 3
PImage efp4; // ECLAIR FINAL IMAGE 4
PImage efp5; // ECLAIR FINAL IMAGE 5

PImage csfp; // CINNAMON STREUSEL FINAL IMAGE
PImage csfp2; // CINNAMON STREUSEL FINAL IMAGE 2
PImage csfp3; // CINNAMON STREUSEL FINAL IMAGE 3
PImage csfp4; // CINNAMON STREUSEL FINAL IMAGE 4
PImage csfp5; // CINNAMON STREUSEL FINAL IMAGE 5

PImage bfp; // BAGUETTE FINAL IMAGE
PImage bfp2; // BAGUETTE FINAL IMAGE 2
PImage bfp3; // BAGUETTE FINAL IMAGE 3
PImage bfp4; // BAGUETTE FINAL IMAGE 4
PImage bfp5; // BAGUETTE FINAL IMAGE 5

PImage rfp; // RUGELACH FINAL IMAGE
PImage rfp2; // RUGELACH FINAL IMAGE 2
PImage rfp3; // RUGELACH FINAL IMAGE 3
PImage rfp4; // RUGELACH FINAL IMAGE 4
PImage rfp5; // RUGELACH FINAL IMAGE 5

PShape shungry; // STILL HUNGRY
int ss = 250; // CONSTANT FOR SHAPE SIZES
int page = 1;
float bVal;
boolean pmp = false;

void setup()
{
  smooth();
  size(640, 480);
  shapeMode(CENTER);
  colorMode(RGB, 255, 255, 255, 100);
  b1 = loadShape("button1.svg");
  b2 = loadShape("button2.svg");
  b3 = loadShape("button3.svg");
  b4 = loadShape("button4.svg");
  b5 = loadShape("button5.svg");
  b6 = loadShape("button6.svg");
  b7 = loadShape("button7.svg");
  b8 = loadShape("button8.svg");
  hungry = loadShape("hungry.svg");
  or = loadShape("or.svg");

  rvpp = loadShape("red velvet cupcake prep page.svg");
  epp = loadShape("eclair prep page.svg");
  cspp = loadShape("cinnamon streusel prep page.svg");
  bpp = loadShape("baguette prep page.svg");
  rpp = loadShape("rugelach prep page.svg");

  rvfp = loadImage("rvfp.png");
  rvfp2 = loadImage("rvfp2.png");
  rvfp3 = loadImage("rvfp3.png");
  rvfp4 = loadImage("rvfp4.png");
  rvfp5 = loadImage("rvfp5.png");

  efp = loadImage("efp.png");
  efp2 = loadImage("efp2.png");
  efp3 = loadImage("efp3.png");
  efp4 = loadImage("efp4.png");
  efp5 = loadImage("efp5.png");

  csfp = loadImage("csfp.png");
  csfp2 = loadImage("csfp2.png");
  csfp3 = loadImage("csfp3.png");
  csfp4 = loadImage("csfp4.png");
  csfp5 = loadImage("csfp5.png");

  bfp = loadImage("bfp.png");
  bfp2 = loadImage("bfp2.png");
  bfp3 = loadImage("bfp3.png");
  bfp4 = loadImage("bfp4.png");
  bfp5 = loadImage("bfp5.png");

  rfp = loadImage("rfp.png");
  rfp2 = loadImage("rfp2.png");
  rfp3 = loadImage("rfp3.png");
  rfp4 = loadImage("rfp4.png");
  rfp5 = loadImage("rfp5.png");

  cameraa = loadShape("camera.svg");
  camerashutter = loadShape("camerashutter.svg");
  shungry = loadShape("still-hungry.svg");
}

void draw()
{
  // PAGE ONE, HUNGRY?
  if (page == 1) 
  {
    background(212, 239, 251);
    if ( dist(mouseX, mouseY, 475, 375) < 30) {  
      hungry.enableStyle();
    }
    else {
      fill(50);
      stroke(150);
      hungry.disableStyle();
    }
    shape(hungry, 670, 575, 700, 500);

    if ((mousePressed==true) && (pmp==false)) {
      color temp = get(mouseX, mouseY);
      float bVal = blue(temp);
      if ((bVal == 255) || (bVal == 0)) {
        page = 2;
      }
    }
    pmp = mousePressed;
  } 

  // PAGE TWO, AP OR SP FLOUR?
  else if (page == 2) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(50, 280, 245, 65);
    ellipse(350, 280, 245, 65);
    noFill();
    stroke(0);

    // ALL PURPOSE FLOUR
    if ( dist(mouseX, mouseY, 170, 230) < 30) {  
      b1.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 3;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b1.disableStyle();
    }
    shape(b1, 180, 230, ss, ss);

    // SPECIALTY FLOUR
    if ( dist(mouseX, mouseY, 490, 230) < 30) {  
      b2.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 4;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b2.disableStyle();
    }
    shape(b2, 470, 230, ss, ss);

    shape(or, 368, 230, 200, 250);
  }

  // PAGE THREE, MILK OR CREAM CHEESE?
  else if (page == 3) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(50, 277, 245, 80);
    ellipse(350, 280, 245, 65);
    noFill();
    stroke(0);

    // MILK, BUTTER, EGGS
    if ( dist(mouseX, mouseY, 170, 300) < 30) {  
      b3.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 5;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b3.disableStyle();
    }
    shape(b3, 175, 240, 270, ss);

    // CREAM CHEESE, SOUR CREAM, BUTTER
    if ( dist(mouseX, mouseY, 480, 300) < 30) {  
      b4.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 6;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b4.disableStyle();
    }
    shape(b4, 475, 280, ss, 265);

    shape(or, 375, 230, 200, 250);
  }

  // PAGE FOUR, WATER OR BUTTERMILK?
  else if (page == 4) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 290, 210, 50);
    ellipse(250, 270, 380, 90);
    noFill();
    stroke(0);

    // WATER, YEAST
    if ( dist(mouseX, mouseY, 120, 280) < 30) {  
      b5.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 7;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b5.disableStyle();
    }
    shape(b5, 120, 280, 225, ss);

    // BUTTERMILK, SUGAR, EGGS, OIL, VINEGAR...
    if ( dist(mouseX, mouseY, 450, 250) < 30) {  
      b6.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 8;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b6.disableStyle();
    }
    shape(b6, 440, 250, 375, 275);

    shape(or, 285, 230, 200, 250);
  }

  // PAGE FIVE, WATER OR SUGAR?
  else if (page == 5) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(50, 300, 175, 40);
    ellipse(280, 273, 340, 90);
    noFill();
    stroke(0);

    // WATER
    if ( dist(mouseX, mouseY, 135, 300) < 30) {  
      b7.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 9;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b7.disableStyle();
    }
    shape(b7, 140, 285, 200, ss);

    // SUGAR, BROWN SUGAR, VANILLA, BAKING POWDER...
    if ( dist(mouseX, mouseY, 455, 270) < 30) {  
      b8.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 10;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      b8.disableStyle();
    }
    shape(b8, 450, 260, 350, 300);

    shape(or, 300, 230, 200, 250);
  }

  // PAGE SIX, RED VELVET PREP
  else if (page == 6) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 250, 600, 100);
    noFill();
    stroke(0);

    if ( dist(mouseX, mouseY, width/2, 270) < 30) {  
      rvpp.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 11;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      rvpp.disableStyle();
    }
    shape(rvpp, width/2, height/2, 575, 500);
  }

  // PAGE SEVEN, BAGUETTE PREP
  else if (page == 7) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 215, 600, 125);
    noFill();
    stroke(0);

    if ( dist(mouseX, mouseY, width/2, 270) < 30) {  
      bpp.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 12;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      bpp.disableStyle();
    }
    shape(bpp, width/2, 260, 660, 490);
  }

  // PAGE EIGHT, RUGELACH PREP
  else if (page == 8) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 213, 600, 123);
    noFill();
    stroke(0);

    if ( dist(mouseX, mouseY, width/2, 270) < 30) {  
      rpp.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 13;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      rpp.disableStyle();
    }
    shape(rpp, width/2, 245, 650, 490);
  }

  // PAGE NINE, ECLAIR PREP
  else if (page == 9) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 240, 600, 120);
    noFill();
    stroke(0);

    if ( dist(mouseX, mouseY, width/2, 270) < 30) {  
      epp.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 14;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      epp.disableStyle();
    }
    shape(epp, width/2, height/2, 575, 500);
  }

  // PAGE TEN, CINNAMON STREUSEL PREP
  else if (page == 10) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(20, 250, 600, 110);
    noFill();
    stroke(0);

    if ( dist(mouseX, mouseY, width/2, 270) < 30) {  
      cspp.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 15;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      cspp.disableStyle();
    }
    shape(cspp, width/2, height/2, 575, 500);
  }

  // PAGE ELEVEN, RED VELVET CUPCAKES
  else if (page == 11) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rvfp, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 16;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE TWELVE, BAGUETTE
  else if (page == 12) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(bfp, 93, 86, 500, 375);
    
    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 20;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);
    
    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE THIRTEEN, RUGELACH
  else if (page == 13) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rfp, 50, 42, 500, 375);
    
    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 24;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);
    
    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE FOURTEEN, ECLAIR
  else if (page == 14) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(efp, 50, 42, 500, 375);
    
    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 28;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);
    
    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE FIFTEEN, CINNAMON STREUSEL
  else if (page == 15) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(csfp, 49.5, 45, 500, 375);
    
    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 32;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);
    
    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE SIXTEEN, RED VELVET CUPCAKE, rvfp2
  else if (page == 16) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rvfp2, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 17;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }

  // PAGE SEVENTEEN, RED VELVET CUPCAKE, rvfp3
  else if (page == 17) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rvfp3, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 18;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE EIGHTEEN, RED VELVET CUPCAKE, rvfp4
  else if (page == 18) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rvfp4, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 19;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE NINETEEN, RED VELVET CUPCAKE, rvfp5
  else if (page == 19) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rvfp5, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 11;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY, BAGUETTE bfp2
  else if (page == 20) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(bfp2, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 21;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY ONE, BAGUETTE bfp3
  else if (page == 21) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(bfp3, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 22;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY TWO, BAGUETTE bfp4
  else if (page == 22) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(bfp4, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 23;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY THREE, BAGUETTE bfp5
  else if (page == 23) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(bfp5, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 12;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY FOUR, RUGELACH rfp2
  else if (page == 24) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rfp2, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 25;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY FIVE, RUGELACH rfp3
  else if (page == 25) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rfp3, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 26;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY SIX, RUGELACH rfp4
  else if (page == 26) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rfp4, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 27;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY SEVEN, RUGELACH rfp5
  else if (page == 27) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(rfp5, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 13;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY EIGHT, ECLAIR efp2
  else if (page == 28) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(efp2, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 29;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE TWENTY NINE, ECLAIR efp3
  else if (page == 29) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(efp3, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 30;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY, ECLAIR efp4
  else if (page == 30) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(efp4, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 31;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY ONE, ECLAIR efp5
  else if (page == 31) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(efp5, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 14;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY TWO, CINNAMON STREUSEL csfp2
  else if (page == 32) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(csfp2, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 33;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY THREE, CINNAMON STREUSEL csfp3
  else if (page == 33) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(csfp3, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 34;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY FOUR, CINNAMON STREUSEL csfp4
  else if (page == 34) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(csfp4, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 35;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
  
  // PAGE THIRTY FIVE, CINNAMON STREUSEL csfp5
  else if (page == 35) {
    background(212, 239, 251);
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(43, 240, 500, 65);
    noFill();
    stroke(0);

    shape(cameraa, 320, 248, 500, 375);
    image(csfp5, 50, 42, 500, 375);

    if ( dist(mouseX, mouseY, 335, 90) < 10) {  
      camerashutter.disableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 15;
      }
      pmp = mousePressed;
    }

    else {
      fill(50);
      stroke(150);
      camerashutter.enableStyle();
    }
    shape(camerashutter, 556, 273, 500, 375);

    if ( dist(mouseX, mouseY, 450, 400) < 30) {  
      shungry.enableStyle();
      if ((mousePressed==true) && (pmp==false)) {
        page = 2;
      }
      pmp = mousePressed;
    }
    else {
      fill(50);
      stroke(150);
      shungry.disableStyle();
    }
    shape(shungry, 625, 600, 700, 500);
  }
}


