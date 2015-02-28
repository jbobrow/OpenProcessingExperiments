
/* ingredients for happiness
   a recipe by lily zhou
   february 2011             */

PFont splendid;

// ten images of happiness
PShape a1;
PShape a2;
PShape a3;
PShape b1;
PShape b2;
PShape b3;
PShape c1;
PShape c2;
PShape c3;
PShape c4;

// ten words of happiness
String ta1 = "a bicycle";
String ta2 = "fruit";
String ta3 = "vegetables";
String tb1 = "music";
String tb2 = "art";
String tb3 = "a book";
String tc1 = "a friend";
String tc2 = "a friend";
String tc3 = "a heart";
String tc4 = "an open mind";

// random integer linking image & text
float ri1;
float ri2;
float ri3;




// let's get started !
void setup () {
  size (640, 480);
  smooth();
  noLoop();

  // load some shapes please
  a1 = loadShape ("a1.svg");
  a2 = loadShape ("a2.svg");
  a3 = loadShape ("a3.svg");

  b1 = loadShape ("b1.svg");
  b2 = loadShape ("b2.svg");
  b3 = loadShape ("b3.svg");

  c1 = loadShape ("c1.svg");
  c2 = loadShape ("c2.svg");
  c3 = loadShape ("c4.svg");
  c4 = loadShape ("c3.svg");

  // splash
  background(255);
  splendid = loadFont ("splendid36.vlw");
  textFont(splendid);
  fill(0);
  text("do you long for happiness? \n here are the ingredients!", 100, 240);
}




// show the recipes !
void draw() {
  if (mousePressed == true) {
    background(255);

    // randomise the images
    PShape pa[]= {
      a1, a2, a3
    };
    float ri1 = random(0, pa.length);
    PShape a1 = pa[int(ri1)];
    shape(a1, 130, -10);

    PShape pb[]= {
      b1, b2, b3
    };
    float ri2 = random(0, pb.length);
    PShape b1 = pb[int(ri2)];
    shape(b1, -10, 190);

    PShape pc[]= {
      c1, c2, c3, c4
    };
    float ri3 = random(0, pc.length);
    PShape c1 = pc[int(ri3)];
    shape(c1, 270, 200);

    // show the appropriate text for each image
    String pat[]= {
      ta1, ta2, ta3
    };
    String pat1 = pat[int(ri1)];
    text (pat1, 210, 210);

    String pbt[]= {
      tb1, tb2, tb3
    };
    String pbt1 = pbt[int(ri2)];
    text (pbt1, 10, 420);

    String pct[]= {
      tc1, tc2, tc3, tc4
    };
    String pct1 = pct[int(ri3)];
    text (pct1, 310, 420);
  }
}




// do it all over again !
void mousePressed() {
  redraw();
}

