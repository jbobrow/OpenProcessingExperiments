
Umbrella[] umbrella = new Umbrella[6];  //declare an Umbrella array with size 6
StripeUmbrella[] stripeUmbrella = new StripeUmbrella[5];  //declare an StripeUmbrella array with size 5
Umbrella[] rainDrop = new StripeUmbrella[5];  //declare an Raindrop array of Umbrella type with size 5

void setup() {
  size(600, 600);
  smooth();
  for (int i = 0; i < umbrella.length; i++) { // loop over each position in the array and initialize with values
    umbrella[i] = new Umbrella(i*100, 0); // -> move diameter(100) to right every position
  }
  for (int i = 0; i < stripeUmbrella.length; i++) { // loop over each position in the array and initialize with values
    stripeUmbrella[i] = new StripeUmbrella(i*100, 0); // -> move diameter(100) to right every position
  }
  
  for (int i = 0; i < rainDrop.length; i++) { // loop over each position in the array and initialize with values
    rainDrop[i] = new Raindrop(i*100, 0); // -> move diameter(100) to right every position
  }
}

void draw() {
  background(255);
  
  //draw the Umbrellas
  pushMatrix();
  translate(50, 50); //translate the origin to the position of first umbrella
  for (int j = 0; j < umbrella.length; j++) {
    for (int i = 0; i < umbrella.length; i++) {  // loop over each position in the array and draw the umbrella
      umbrella[i].rotation();
      umbrella[i].scaling();
      umbrella[i].coloring();
      umbrella[i].draw();
    }
    translate(0, 100); // draw the first line, then translate 100 down everytime before drawing one line
  }
  popMatrix();
  
  //draw the StripeUmbrellas
  pushMatrix();
  translate(100, 100); //translate the origin to the position of first stripeUmbrella
  for (int j = 0; j < stripeUmbrella.length; j++) {
    for (int i = 0; i < stripeUmbrella.length; i++) {  // loop over each position in the array and draw the stripeUmbrella
      stripeUmbrella[i].rotation();
      stripeUmbrella[i].scaling();
      stripeUmbrella[i].coloring();
      stripeUmbrella[i].draw();
    }
    translate(0, 100); // draw the first line, then translate 100 down everytime before drawing one line
  }
  popMatrix();
  
  //draw the RainDrops
  pushMatrix();
  translate(100, 100); //translate the origin to the position of first rainDrop
  for (int j = 0; j < rainDrop.length; j++) {
    for (int i = 0; i < rainDrop.length; i++) {  // loop over each position in the array and draw the rainDrop
      rainDrop[i].rotation();
      rainDrop[i].scaling();
      rainDrop[i].coloring();
      rainDrop[i].draw();
    }
    translate(0, 100); // draw the first line, then translate 100 down everytime before drawing one line
  }
  popMatrix();
  
}

void keyPressed() {
  if (key == 's') {
    save("frame" + frameCount + ".png");
  }
}


