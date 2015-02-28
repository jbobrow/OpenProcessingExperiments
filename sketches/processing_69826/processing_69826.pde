
//Rachel Toups Image Remake
//
//Image is from 'Cancer is Curable if Treated Early' by Leo Lionni
//originally found at artstor.com, but specific image used found at 
//http://www.moma.org/collection_images/resized/610/w500h420/CRI_211610.jpg

void setup(){
  smooth();
size(600,800);
background(219,214,197);
fill(31,31,31); //black box
  quad(30,145,270,150,271,300,30,301);
fill(134,30,30); //tear drop
noStroke();
bezier(440, 50, 450, 200, 700, 250, 440, 350);
bezier(440, 50, 430, 200, 200, 250, 440, 350);
bezier(557,250,600,420,250,420,340,230);
  
fill(72,137,105); //arrow (quad and triangles)
  noStroke();
  quad(100,450,400,470,400,540,95,560);
  triangle(370,500,470,500,360,400);
  triangle(370,500,470,500,340,600);
fill(219,214,197); //text rects
  quad(110,485,420,485,420,525,110,525);
  quad(45,205,260,205,260,235,45,235);
  quad(393,209,488,209,488,239,393,238);
  quad(390,254,497,255,495,283,390,283);
  quad(375,299,517,299,516,333,373,333);

fill(32,32,32);
PFont font; // Taken from Processing.org Reference
  font = loadFont("Times-Roman-32.vlw");
  textFont(font, 28);
  text("At the first sign of",50,228);
  text("go straight to your doctor.",120,510);
  text("Cancer is curable", 160, 735);
  text("unusual", 400,230);
  text("bleeding", 398,275);
  text("or discharge", 378,321);
  font = loadFont("TimesNewRomanPS-ItalicMT-32.vlw");
  textFont(font,28);
  text("if treated early.",360,735);
  font = loadFont("TimesNewRomanPS-BoldMT-28.vlw");
  textFont(font,28);
  text("It", 295, 650);
  text("mean cancer.", 377,650);
  font = loadFont("TimesNewRomanPS-BoldItalicMT-28.vlw");
  textFont(font,28);
  text("may",322,650);
}


