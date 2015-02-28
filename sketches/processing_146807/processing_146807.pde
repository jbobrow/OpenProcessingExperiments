
String[] lines;
String[] labels;

float[] milk;
float[] tea;
float[] coffee;

PFont font;

int highlight;

float px = 0.0;
float pmy = 0.0;
float pty = 0.0;
float pcy = 0.0;

float mx;
float my;
float tx;
float ty;
float cx;
float cy;

void setup() {
  size( 800, 600 );

  font = createFont( "Orator Std", 14 );
  textFont( font );

  lines = loadStrings( "milk-tea-coffee.tsv" );

  labels = new String[95];
  milk = new float[95];
  tea = new float[95];
  coffee = new float[95];

  // a loop to look at every line in the text file...
  for (int i = 0; i < lines.length; i++) {
    String[] values = split( lines[i], "\t" );  // split the line based on commas
    labels[i-1] = values[0];                     // save the label string in the labels array
    milk[i-1] = float(values[1]);
    tea[i-1] = float(values[2]);
    coffee[i-1] = float(values[3]);

    //println( labels[i] + " , " + data[i] );
  }
}

void draw() {
  background( 255 );
  noFill();
  stroke( 0 );
  rect( 100, 100, 600, 400 );

  //title
  textSize(36);
  textAlign( CENTER );
  fill(0);
  text( "Drink Popularity", 400, 60 );

  //x-axis label
  textSize(20);
  textAlign( CENTER );
  text("Year", 400, 570);

  //y-axis label
  int fontX = 30;     // Location of start of text.
  int fontY = 300;
  pushMatrix();
  translate(fontX, fontY);
  rotate(HALF_PI);
  translate(-fontX, -fontY);
  textSize(36);
  textAlign( CENTER );
  fill(0);
  textSize(20);
  text("Popularity", fontX, fontY);
  popMatrix();

  // This loop draws the ticks and labels for the Y axis
  for (int y = 0; y <= 50; y += 10) {
    float ym = map( y, 0, 50, 500, 100 );
    stroke( 0 );
    line( 100, ym, 96, ym );
    textSize(14);
    textAlign( RIGHT, CENTER );
    text( y, 90, ym );
  }

  for (int i = 0; i < lines.length; i++) {
    float x = map( float( i ), -1, 96, 100, 700 );
    float milkY = map( milk[i], 0, 50, 500, 100 );
    float teaY = map( tea[i], 0, 50, 500, 100 );
    float coffeeY = map( coffee[i], 0, 50, 500, 100 );

    mx = (milk[i]);
    tx = (tea[i]);
    cx = (coffee[i]);

    my = milkY;
    ty = teaY;
    cy = coffeeY;

    if (i > 0 && i < 95) {
      //draw milk line
      stroke(215);
      noFill();
      strokeWeight(2);
      line(px, pmy, x, milkY);
      strokeWeight(1);
      //data point
      ellipse(px, pmy, 6, 6);

      //draw tea line
      stroke( 42, 111, 27 );
      noFill();
      strokeWeight(2);
      line(px, pty, x, teaY);
      //data point
      strokeWeight(1);
      ellipse(px, pty, 6, 6);

      //draw coffee line
      stroke( 155, 130, 76 );
      noFill();
      strokeWeight(2);
      line(px, pcy, x, coffeeY);
      //data point
      strokeWeight(1);
      ellipse(px, pcy, 6, 6);
    }

    // draw a tick and label for the X axis
    stroke(0);
    strokeWeight(1);
    line( x, 500, x, 504 ); // tick mark
    fill( 0 );

    textSize(14);
    textAlign( CENTER );
    if (i % 10 == 0) {  // only draw every 4th label
      text( labels[i], x, 520 );
    }

    px = x;
    pmy = milkY;
    pty = teaY;
    pcy = coffeeY;
  }

  //legend
  noStroke();
  fill(215);
  rect(710, 240, 80, 25);

  noStroke();
  fill(42, 111, 27);
  rect(710, 280, 80, 25);

  noStroke();
  fill(155, 130, 76);
  rect(710, 320, 80, 25);

  textSize(20);
  textAlign( CENTER );
  fill(110);
  text("Milk", 750, 260);

  fill(180);
  text("Tea", 750, 300);

  fill(180);
  text("Coffee", 750, 340);

  highlight();
}

void highlight() {
  if (highlight != -1) {
    //Milk
    stroke(215);
    strokeWeight(3);
    noFill();
    ellipse(lines[highlight].mx, lines[highlight].my, 10, 10);

    //Tea
    stroke(42, 111, 27);
    strokeWeight(3);
    noFill();
    ellipse(lines[highlight].tx, lines[highlight].ty, 10, 10);

    //Coffee
    stroke(155, 130, 76);
    strokeWeight(3);
    noFill();
    ellipse(lines[highlight].tx, lines[highlight].ty, 10, 10);
  }
}

void mouseMoved() {
  float close = 2000;
  int closeI = -1;

  for (int i = 0; i < lines.length; i++) {
    float mDist = dist(lines[i].mx, lines[i].my, mouseX, mouseY);
    if (mDist < close) {
      close = mDist;
      closeI = i;
    }

    float tDist = dist(lines[i].tx, lines[i].ty, mouseX, mouseY);
    if (tDist < close) {
      close = tDist;
      closeI = i;
    }

    float cDist = dist(lines[i].cx, lines[i].cy, mouseX, mouseY);
    if (cDist < close) {
      close = cDist;
      closeI = i;
    }
  }
  if (close < 20 && closeI >= 0) {
    highlight = closeI;
  }

  else {
    highlight = -1;
  }
}



