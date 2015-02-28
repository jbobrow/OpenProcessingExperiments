
import geomerative.*;
//import processing.opengl.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

float d; //distance
float sp = 285; //points
float spr; //points random
float sdr; //distancerandom
float sd = 100; //distance
float sw = 1.0; //strokeweight
float ripple = 1;  //
float ring = 10;
boolean light = false; //


color nyan = color(107, 199, 221);
color sky = color(256, 256, 256);
//text

String letter = "e";



void setup() {
  size(400, 560);
  frameRate(5);
  strokeCap(SQUARE);


  PFont font = loadFont("juice.vlw");


  textFont(font);

  background(256, 256, 256);

  // VERY IMPORTANT: Always initialize the library in the setup
  RG.init(this);

  // Enable smoothing
  smooth();
}


void draw() {
  noStroke();


  //slider background
  fill(240, 240, 240);
  rect(10, 395, 380, 140);

  fill(140, 140, 140);
  PFont slidertext = loadFont("ir.vlw");
  textFont(slidertext, 11);
  text("Quantity of Points", 30, 425, 120, 120);
  text("Ripple control", 47, 455, 120, 120);
  text("Color", 86, 485, 120, 120);
  text("Background", 58, 509, 120, 120);
  text("Stroke", 285, 509, 120, 120);



  // SLIDER for points
  stroke(100, 100, 100);
  strokeWeight(.5);
  line(130, 432, 380, 432);
  strokeWeight(2);
  line(350, 432, 380, 432);
  noStroke();
  if ((mousePressed == true) && (mouseY>420) && (mouseY<440) && (mouseX>130 && mouseX<380)) {
    sp = int(mouseX);
  }
  fill(90, 90, 90);

  spr = random(130, 380);
  if (mouseX<350) {
    ellipse(sp, 432, 15, 15);
  }
  if (mouseX>350 && mouseX<width) {
    ellipse(sp, 432, 15, 15);
  }


  // SLIDER for ring size
  stroke(100, 100, 100);
  strokeWeight(.5);
  line(130, 462, 380, 462);
  noStroke();
  if ((mousePressed == true) && (mouseY>460) && (mouseY<480)  && (mouseX>130 && mouseX<380)) {
    ring = map(int(mouseX), 130, 380, 3, 20);
  }
  fill(90, 90, 90);
  ellipse(map(ring, 3, 20, 130, 380), 462, 15, 15);

  spr = random(130, 380);
  if (mouseX<350) {
    ellipse(sp, 432, 15, 15);
  }
  if (mouseX>350 && mouseX<width) {
    ellipse(sp, 432, 15, 15);
  }


  // COLOR swatches
  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>128 && mouseX<144) {
    nyan = color(224, 234, 94);
  }
  fill(224, 234, 94); //nuclear   
  ellipse(135, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>148 && mouseX<164) {
    nyan = color(124, 212, 144);
  }
  fill(124, 212, 144); // leaf 
  ellipse(155, 491, 13, 13);  

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>168 && mouseX<184) {
    nyan = color(148, 216, 208);
  }
  fill(148, 216, 208);  //seafoam
  ellipse(175, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>188 && mouseX<204) {
    nyan = color(107, 199, 221);
  }
  fill(107, 199, 221);  //robin
  ellipse(195, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>208 && mouseX<224) {
    nyan = color(91, 131, 170);
  }
  fill(91, 131, 170);  //dusk
  ellipse(215, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>228 && mouseX<244) {
    nyan = color(120, 80, 127);
  }
  fill(120, 80, 127);  //royal
  ellipse(235, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>248 && mouseX<264) {
    nyan = color(165, 106, 127);
  }
  fill(165, 106, 127);  //mauve
  ellipse(255, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>268 && mouseX<284) {
    nyan = color(181, 57, 98);
  }
  fill(181, 57, 98);  //smooch
  ellipse(275, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>288 && mouseX<304) {
    nyan = color(181, 75, 57);
  }
  fill(181, 75, 57);  //brick
  ellipse(295, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>308 && mouseX<324) {
    nyan = color(250, 201, 70);
  }
  fill(250, 201, 70);  //yolk
  ellipse(315, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>328 && mouseX<344) {
    nyan = color(198, 195, 190);
  }
  fill(198, 195, 190);  //stoneage
  ellipse(335, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>348 && mouseX<364) {
    nyan = color(142, 139, 135);
  }
  fill(142, 139, 135);  //restful
  ellipse(355, 491, 13, 13);

  if (mousePressed == true && mouseY>480 && mouseY<500 && mouseX>368 && mouseX<384) {
    nyan = color(40, 38, 36);
  }
  fill(40, 38, 36);  //stern
  ellipse(375, 491, 13, 13);


  // BACKGROUND Color swatches
  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>130 && mouseX<155) {
    sky = color(256, 256, 256);
  }
  fill(256, 256, 256);
  stroke(110, 105, 100);
  strokeWeight(.3);
  rect(130, 510, 25, 10);

  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>165 && mouseX<190) {
    sky = color(200, 197, 194);
  }
  noStroke();
  fill(200, 197, 194);
  rect(165, 510, 25, 10);

  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>200 && mouseX<225) {
    sky = color(80, 77, 74);
  }
  fill(80, 77, 74);
  rect(200, 510, 25, 10);

  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>235 && mouseX<260) {
    sky = color(30, 28, 25);
  }
  fill(30, 28, 25);
  rect(235, 510, 25, 10);

  //background fill
  fill(sky);
  rect(20, 15, 360, 395);


  // change stroke weight
  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>325 && mouseX<340) {
    sw = 1;
  }
  strokeWeight(1);
  stroke(nyan);
  line(325, 510, 340, 510);
  line(325, 513, 340, 513);
  line(325, 516, 340, 516);
  line(325, 520, 340, 520);


  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>345 && mouseX<360) {
    sw = 3;
  }
  strokeWeight(3);
  stroke(nyan);
  line(345, 511, 360, 511);
  line(345, 515, 360, 515);
  line(345, 519, 360, 519);

  if (mousePressed == true && mouseY>510 && mouseY<520 && mouseX>365 && mouseX<380) {
    sw = 6;
  }
  strokeWeight(5);
  stroke(nyan);
  line(365, 512, 380, 512);
  line(365, 518, 380, 518);


  //Change the letter
  if (keyPressed == true) {
    if ((key>=32) && (key <=126)) {
      letter =Character.toString(key);
    }
  }




  grp = RG.getText(letter, "Harabara.ttf", 265, CENTER);

  // Set the origin to draw in the middle of the sketch
  translate(width/2 - 10, 2*height/3 -75);

  // Draw the group of shapes
  //RG.setPolygonizer(RG.ADAPTATIVE);
  // grp.draw();

  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY/10), 0.0, float(height/10), 0.0, 40.0));

  RG.setAdaptorLengthOffset(random(0, 1));

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  if (mouseX<350 && mouseX>130) {
    RG.setPolygonizerLength(map(width - sp, 0, width, 00, 200));
  }
  if ((sp>350)) {
    RG.setPolygonizerLength(map(width - spr, 0, width, 10, 80));
  }
  points = grp.getPoints();
  // If there are any points
  if (points != null) {
    noFill();

    ripple = ripple + 1;
    if (ripple > 10) {
      ripple=1;
    }


    for (int i=0; i<points.length; i++) {      


      for (float k = 1; k<ring; k+=1) {
        noFill();
        strokeWeight(sw);

        if (k % ripple == 0) {
          stroke(nyan, 120-(5*ripple));
        }
        else {
          noStroke();
        }

        ellipse(points[i].x, points[i].y, k*k, k*k);

        vertex(points[i].x, points[i].y);
      }
    }
  }
  //  MASK
  // offscreen PGraphics object created at size of window
  PGraphics mask = createGraphics(400, 400, P2D);
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  PFont cut = loadFont("harabara.vlw");

  // use dot syntax with PGraphics object: it works just like commands to
  // the display window, but they must be surrounded by calls to
  // beginDraw and endDraw. After that, you can display the result to
  // the display window using "image" function.
  mask.beginDraw(); // begin
  mask.background(256, 256, 256); //white background
  mask.fill(0); // black fill
  mask.textFont( cut, 260); //select font
  mask.textAlign(CENTER);
  mask.text(letter, 150, 245); //draw letter
  mask.endDraw(); // end
  // blend the mask with the image on the window
  // the white will cover because it's the LIGHTEST
  if ((mouseX<(width-20)) || (mouseY<(height-20))) {
    blend(mask, 0, 0, 300, 330, 0, 0, 400, 420, LIGHTEST);
  }
  //image(mask, 0, 0); // uncomment to display mask
  println(mouseX + " , " + mouseY);
}


