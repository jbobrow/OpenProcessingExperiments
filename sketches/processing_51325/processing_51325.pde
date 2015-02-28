
// Creative Artists Agency, Sarah Morris
// written by Kei Kreutler, 2012


color greenBG, greenLine, grayHex;

// in order of brightness
color red1, red2, red3, red4, red5;
color green1, green2, green3, green4, green5;
color blue1;
color brown1, brown2, brown3, brown4, brown5;

int keyCount;
boolean displayLines, displayHex;


void setup() {

  greenBG = color(114, 179, 139);
  greenLine = color(151, 208, 75);
  grayHex = color(144, 145, 141);

  // Reds
  red1 = color(254, 235, 228);
  red2 = color(251, 233, 221);
  red3 = color(205, 51, 58); 
  red4 = color(218, 46, 58); // Red red
  red5 = color(137, 35, 75); // Burgundy-esque

  // Greens
  green1 = color(205, 224, 146);
  green2 = color(80, 134, 74);
  green3 = color(83, 131, 74);
  green4 = color(46, 68, 56);
  green5 = color(106, 169, 121); // Close to BG

  // Blues
  blue1 = color(41, 45, 74);

  // Brown to black
  brown1 = color(180, 124, 99);
  brown2 = color(167, 117, 90);
  brown3 = color(127, 100, 93);
  brown4 = color(43, 42, 40);
  brown5 = color(27, 28, 26); // Black

  size(417, 420);
  smooth();
  background(greenBG);
  drawHex();

  keyCount = 0;
  displayLines = false;
  displayHex = false;
}


void draw() {


  noStroke();

  if(keyCount > 21){
    background(greenBG);
  }


  if (keyCount > 0) {
    fill(brown5);
    quad(362.133, 0, width, 0, width, 87.572, 309.127, 87.572);

    fill(red1);
    quad(56.5, 0, 393.99, 0, 341.689, 87.572, 108.5, 87.572);
  }


  if (keyCount > 2) {
    fill(red3);
    quad(222.54, 0, width, 0, width, 48.318, 193.991, 48.318); 

    fill(greenBG);
    beginShape();
    vertex(291.5, 12.321);
    vertex(364.5, 12.321);
    vertex(374.5, 31);
    vertex(364.5, 48.318);
    vertex(272.5, 48.318);
    endShape();
  }


  if (keyCount > 4) {
    fill(brown4);
    quad(399.307, 0, width, 0, width, 12.321, 391.945, 12.321);

    fill(green5);
    quad(0, 0, 138.5, 0, 146, 12.321, 0, 12.321);

    fill(grayHex);
    quad(138.5, 0, 222, 0, 215.167, 12.321, 146, 12.321);

    fill(red1);
    quad(222, 0, 298.818, 0, 291.5, 12.321, 215.167, 12.321);
  }


  if (keyCount > 6) {
    fill(brown2);
    quad(0, 12.321, 63.619, 12.321, 84.417, 48.318, 0, 48.318);

    fill(grayHex);
    beginShape();
    vertex(138.5, 0);
    vertex(222, 0);
    vertex(205, 30.921);
    vertex(215.167, 48.318);
    vertex(167, 48.318);
    endShape();
  }


  if (keyCount > 8) {
    fill(green5);
    quad(298.818, 0, 357.5, 0, 364.5, 12.321, 306.5, 12.321);

    fill(red5);
    quad(167, 48.318, 364.5, 48.318, 353.5, 66, 177, 66);

    fill(greenBG);
    quad(364.5, 48.318, width, 48.318, width, 66, 353.5, 66);
  }


  if (keyCount > 10) {
    fill(green1);
    quad(0, 48.318, 38.613, 48.318, 16.774, 87.572, 0, 87.572);

    fill(brown5);
    quad(38.613, 48.318, 123, 48.318, 146, 87.572, 15.958, 87.572);

    fill(green4);
    quad(28.408, 66, 94.633, 66, 107.097, 87.572, 15.958, 87.572);

    fill(greenBG);
    quad(84.417, 48.318, 167, 48.318, 177, 66, 94.633, 66);
  }


  if (keyCount > 12) {
    fill(blue1);
    quad(146, 87.572, width, 87.572, width, 118.5, 165.5, 118.5);

    fill(brown5);
    quad(190.5, 87.572, width, 87.572, width, 104.5, 200.5, 104.5);

    fill(green4);
    quad(95.867, 104.5, 200, 104.5, 232, 159.321, 63.917, 159.31);
  }


  if (keyCount > 13) {
    fill(green1);
    quad(156.5, 104.5, 200, 104.5, 208.5, 118.5, 165.5, 118.5);

    fill(green3);
    quad(15.958, 87.572, 106, 87.572, 63.917, 159.321, -18, 159.321);

    fill(red1);
    quad(0, 87.572, 14.958, 87.572, 5.188, 104.5, 0, 104.5);
  }


  if (keyCount > 14) {
    fill(brown3);
    quad(0, 104.5, 96, 104.5, 88, 118.5, 0, 118.5);

    fill(blue1);
    quad(89.818, 118.5, 165.5, 118.5, 144, 159.321, 66.5, 159.321);
  }


  if (keyCount > 15) {
    fill(red1);
    triangle(0, 118.5, 19.134, 159.321, 0, 159.321);

    fill(red5);
    quad(-5.8, 118.5, 39.96, 118.5, 63.263, 159.321, 17.853, 159.321);

    fill(brown2);
    quad(0, 159.321, 19.134, 159.321, 39, 195.654, 0, 195.654);
  }


  if (keyCount > 16) {
    fill(blue1);
    quad(145, 159.321, width, 159.321, width, 195.654, 167.5, 195.654);

    fill(green1);
    triangle(63.263, 159.31, 83.229, 195.654, 43.306, 195.654);  

    fill(red5);
    triangle(144, 159.321, 167.5, 195.654, 124, 195.654);
  }


  if (keyCount > 17) {
    fill(red4);
    quad(0, 195.654, 212.5, 195.654, 181.5, 249.5, 0, 249.5);

    fill(brown3);
    quad(43.306, 195.654, 83.229, 195.654, 39.96, 265.5, 21.654, 232.821);

    fill(brown2);
    quad(83.229, 195.654, 169.3, 195.654, 146, 234.646, 105.699, 234.572);

    fill(blue1);
    triangle(169.3, 195.654, 191.396, 234.572, 146, 234.646);
  }


  if (keyCount > 18) {

    fill(green3);
    quad(146.043, 234.572, 190.385, 234.572, 148.707, 308.35, 126.077, 269.154);

    fill(green4);
    quad(212.5, 195.654, 253, 195.654, 284.5, 249.5, 181.5, 249.5);
  }


  if (keyCount > 19) {
    fill(brown5);
    quad(253, 195.654, width, 195.654, width, 249.5, 284.5, 249.5);

    fill(green1);
    quad(136.5, 249.5, width, 249.5, width, 283.84, 115, 283.84);
  }


  if (keyCount > 20) {
    fill(red2);
    beginShape();
    vertex(181.5, 249.5);
    vertex(284.5, 249.5);
    vertex(296, 268.25);
    vertex(273.392, 308.35);
    vertex(148.707, 308.35);
    endShape();

    fill(brown2, 200);
    quad(218.55, 283.84, 287.34, 283.84, 273.392, 308.35, 232.499, 308.35);

    fill(green4);
    beginShape();
    vertex(0, 249.5);
    vertex(136.5, 249.5);
    vertex(124.75, 268.25);
    vertex(133.75, 283.84); 
    vertex(0, 283.84);
    endShape();

    fill(brown5);
    triangle(31.284, 249.5, 49.198, 249.5, 39.96, 265.5);
  }


  if (keyCount > 1) {
    fill(green5);
    quad(0, 268.25, 38.961, 268.25, 47.833, 283.84, 0, 283.84);

    fill(blue1);
    quad(0, 283.84, 133.75, 283.84, 99.722, 342.654, 0, 342.654);

    fill(green3);
    quad(273.392, 308.35, width, 308.35, width, 342.654, 252.507, 342.654);
  }


  if (keyCount > 3) {
    fill(brown3);
    triangle(133.75, 283.84, 168.513, 342.654, 99.722, 342.654);

    fill(brown4);
    triangle(133.75, 283.84, 148.707, 308.35, 119.528, 308.35);

    fill(blue1);
    quad(287.34, 283.84, width, 283.84, width, 308.35, 273.392, 308.35);
  }


  if (keyCount > 5) {
    fill(brown2, 200);
    quad(0, 342.654, width, 342.654, width, 371.333, 0, 371.333);

    fill(red3);
    quad(99.722, 342.654, 252.507, 342.654, 260.985, 357.34, 91.243, 357.34);

    fill(green4);
    quad(0, 342.654, 99.722, 342.654, 91.243, 357.34, 0, 357.34);
  }


  if (keyCount > 7) {
    fill(brown5);
    quad(91.243, 357.34, width, 357.34, width, 384.667, 107.021, 384.667);


    fill(blue1);
    quad(91.243, 357.34, 260.985, 357.34, 252.906, 371.333, 99.722, 371.333);

    fill(green3);
    quad(255, 371.333, width, 371.333, width, height, 224.808, height);
  }


  if (keyCount > 9) {
    fill(red1, 200);
    quad(107.021, 384.667, width, 384.667, width, 395, 112.986, 395);

    fill(brown5);
    quad(118.567, 404.666, 233.661, 404.666, 224.808, 420, 127.42, 420);

    fill(red1);
    quad(0, 371.333, 97, 371.333, 106.021, 384.667, 0, 384.667);
  }


  if (keyCount > 11) {
    fill(green4);
    quad(239.242, 395, width, 395, width, 404.666, 233.661, 404.666);

    fill(red5);
    quad(234.661, 404.666, width, 404.666, width, 412.533, 230.234, 412.533);

    fill(green3);
    quad(112.986, 395, 239.242, 395, 232.661, 404.666, 117.5, 404.666);
  }


  if (keyCount > 21) {
    if (displayLines) {
      drawLines();
    }
  }


  if (keyCount > 21) {
    if (displayHex) {
      noStroke();
      fill(grayHex);
      quad(236.5, 86.572, width, 86.572, width, 109, 246, 109);

      drawHex();
    }
  }
}


void drawLines() {
  stroke(greenLine);
  strokeWeight(3.5);

  line(0, 12.321, width, 12.321);
  line(0, 48.318, width, 48.318);
  line(0, 66, width, 66);
  line(0, 104.5, width, 104.5);
  line(0, 87.572, width, 87.572);
  line(0, 118.5, width, 118.5);
  line(0, 159.321, width, 159.321);
  line(0, 195.654, width, 195.654);
  line(0, 249.5, width, 249.5);
  line(0, 283.84, width, 283.84);
  line(0, 308.35, width, 308.35);

  strokeWeight(4);

  line(0, 342.654, width, 342.654);
  line(0, 357.34, width, 357.34);
  line(0, 371.333, width, 371.333);
  line(0, 384.667, width, 384.667);
  line(0, 395, width, 395);
  line(0, 404.666, width, 404.666);
  line(0, 412.533, width, 412.533);

  stroke(grayHex);
  strokeWeight(6);
  line(0, 306.35, 147.53, 306.35);
  line(0, 342.654, 252.507, 342.654);
  line(0, 357.34, 260.985, 357.34);
  line(0, 371.333, 252.906, 371.333);
}


void drawHex() {

  hexagon(-64.689, 12.321);
  hexagon(-3.8, 48.318);
  hexagon(63.263, 87.572);
  hexagon(21.654, 159.321);
  hexagon(-87.346, 118.5);
  hexagon(91.243, 283.84);
  hexagon(126.077, 195.654);
  hexagon(204.708, -42.44);
  hexagon(134.313, -81.264);
  hexagon(264.191, -133);
}


void hexagon(float translateX, float translateY) {
  noFill();
  stroke(grayHex);
  strokeWeight(6);

  pushMatrix();
  translate(translateX, translateY);
  beginShape();
  vertex(42.436, 147);
  vertex(0, 73.5);
  vertex(42.436, 0);    
  vertex(127.307, 0);
  vertex(169.742, 73.5);    
  vertex(127.307, 147);
  endShape(CLOSE);
  popMatrix();
}


void keyPressed() {
  keyCount++;

  if (key == ' ') {
    displayLines = !displayLines;
  }

  if (key == ENTER) {
    displayHex = !displayHex;
  }
  
}


