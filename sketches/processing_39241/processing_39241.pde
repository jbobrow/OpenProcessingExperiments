
PImage cow;
int durationPeriod;

void setup () {
  size (400, 400);
  smooth ();
  cow = loadImage ("fatcow.jpg");
  durationPeriod = 5000;
  noStroke ();
}

void draw () {
  noStroke ();
  int elapsed = millis ();
  if (elapsed <= durationPeriod) {
    fill (127);
    rect (0, 0, 400, 400);
    //milk rect
    //float milkDrank = 127;
    float milkDrank = map(elapsed, 0, 5000, 140, 300);
    fill (255);
    rect (111, milkDrank, 178, 160);
    stroke (0);
    strokeWeight(2);
    noFill ();
    ellipse (200, 100, 175, 40);
    fill (255);
    //bottom milk ellipse
    stroke (0, 0, 0, 170);
    ellipse (200, 299, 175, 30);

    //top milk ellipse
    float milkDrank2 = map(elapsed, 0, 5000, 140, 300);
    ellipse (200, milkDrank2, 175, 30);
    // ellipse (200, 140, 175, 30);

    //cuplines
    stroke (0);
    strokeWeight(2);
    line (112, 100, 112, 300);
    line (288, 100, 288, 300);
      noStroke ();
  fill (127);
  rect (100, 320, 200, 100);
  noFill();
stroke (127);
  strokeWeight(10);
beginShape ();
curveVertex (100, 250);
curveVertex (100, 250);
curveVertex (105, 260);
curveVertex (110, 307);
curveVertex (200, 320);
curveVertex (290, 307);
curveVertex (295, 260);
curveVertex (300, 250);
endShape ();

fill (127);
noStroke();
rect(111, 312, 20, 20);
rect(270, 312, 20, 20);

  } 

  else {
    background (255);
    noStroke();
    for (int x =0; x<=800; x= x+100) {
      for (int y= 0; y<= 800; y= y+100) { 
        //for (int i =0; i<=800; i= i+40) {
        //for (int j= 0; j<= 800; j= y+40) { 
        fill (255, 0, 0);
        noStroke ();
        ellipse (x, y, 5, 5);
        udder (x, y, .5);
        image (cow, 100, 70);
      }
    }
  }

}


void udder (int x, int y, float s) {
  pushMatrix ();
  scale (s);
  noStroke ();
  fill (2550, 200, 200);
  ellipse (x, y, 60, 65);
  //udders
  ellipse (x, y+35, 8, 20);
  ellipse (x+15, y+30, 8, 20);
  ellipse (x+28, y+18, 8, 20);
  ellipse (x-15, y+30, 8, 20);
  popMatrix ();
  //  ellipse (100, 135, 8, 20);
  //  ellipse (115, 130, 8, 20);
  //  ellipse (128, 118, 8, 20);
  //  ellipse (85, 130, 8, 20);
}


