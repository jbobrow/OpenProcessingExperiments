
/* heylo. things used to make this little sketch:
 - http://colorschemedesigner.com/#1d32uxkesRYYy
 */


/* THE COLOR SCHEME ARRAYS */
color[] primary = new color[5];
color[] secondaryA = new color[5];
color[] secondaryB = new color[5];
/*                          */

int thirdoScreen;
int primeroThird;

void setup() {
  size(900, 400);
  background(255);
  colorMode(RGB);


  /*COLOR SCHEME ASSIGNMENT  */
  primary[0] = color(#735700); 
  primary[1] = color(#42391C);
  primary[2] = color(#2E2300);
  primary[3] = color(#FADB78);
  primary[4] = color(#FAF2D8);

  secondaryA[0] = color(#58003B);
  secondaryA[1] = color(#321629);
  secondaryA[2] = color(#230018);
  secondaryA[3] = color(#F978CF);
  secondaryA[4] = color(#F9D7EE);

  secondaryB[0] = color(#005321);
  secondaryB[1] = color(#142F1F);
  secondaryB[2] = color(#00210D);
  secondaryB[3] = color(#77F8AC);
  secondaryB[4] = color(#D7F8E5);
  /* THANK GOD THATS OVER      */


  /* Sets us the three regions for colourization to occur */
  thirdoScreen = thirdScreen(width);
  drawConstraint(thirdoScreen);

  /* Allows for boundaries to be set along x values */
  primeroThird = thirdoScreen;      // variable for first x value of third
  thirdoScreen += thirdoScreen;     // variable for second x value of third
  /*                                                */
  drawConstraint(thirdoScreen);
}

void draw() {
  for (int xValues = 0; xValues < primeroThird; xValues++) {
    for (int yValues = 0; yValues <= height; yValues+=10) {
      int placeHolder;
      placeHolder = int(random(0, 4));
      stroke(primary[placeHolder]);
      line(xValues, yValues, xValues, yValues+10);
    }
  }

  for (int xValues = primeroThird; xValues < thirdoScreen; xValues++) {
    for (int yValues = 0; yValues <= height; yValues+=20) {
      int placeHolder;
      placeHolder = int(random(0, 4));
      stroke(secondaryA[placeHolder]);
      line(xValues, yValues, xValues, yValues+20);
    }
  }
  for (int xValues = thirdoScreen; xValues <= width; xValues++) {
    for (int yValues = 0; yValues <= height; yValues+=15) {
      int placeHolder;
      placeHolder = int(random(0, 4));
      stroke(secondaryB[placeHolder]);
      line(xValues, yValues, xValues, yValues+15);
    }
  }
}


/* This will compute a third of the screen.*/
int thirdScreen(int widthValue) {
  int thirdoScreen = (widthValue / 3);
  return thirdoScreen;
}

void drawConstraint(int x) {
  smooth();
  stroke(0);
  line(x, 0, x, height);
}


