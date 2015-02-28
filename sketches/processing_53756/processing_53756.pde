
// Code Written By: Chukwudi T. Unonu
// Date Created:  02/27/2012
// Date Finished: 02/27/2012
//
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: INSPIRON 1521 (Motherboard), INSPIRON 1520 (Screen) 
// 
// SKETCH 1 of 24: 8903
// DESCRIPTION: Mimicing Album Cover Design of Usher's "8701"
//
// Sketch Items:
// (Top Layer) Fonts (iput and drawing by ellipse/squares)
// (Bottom Layer) Mesh overlapping, bluriness, perline noise?, depth of field, sunshine effect,
// Colors: Yellow, White, Red, Red-Orange, Orange
//
////  ----====    START "Sketch"   ====----
//

void setup()
{
  // Screen Resolutions References via Wikiedia
  // (a) <http://en.wikipedia.org/wiki/720p>  
    size(900,900);
  
}

//  img_ctu_x = a;
//  img_ctu_y = b;
//  a = 900;
//  b = 900;

void draw()
{
  // Background Color References via Google.com Search Engine "", Feb 02, 2012.
  // (a) Prese Color Charts <http://www.tayloredmktg.com/rgb/>
  // (b) Color Generator <http://www.colorschemer.com/online.html>
  // (c) Color Calculator <http://drpeterjones.com/colorcalc/>
  // *** (d) Hexadecimal code and RGB value generator <http://www.blogtrickstream.com/2011/08/hexadecimal-color-html-code-rgb-values.html>    

  // "Sunkist Orange" Background
 background(#FFBF00);

//Radians References
//<http://en.wikipedia.org/wiki/Radian>
//<http://en.wikipedia.org/wiki/File:Degree-Radian_Conversion.svg>
//<http://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Degree-Radian_Conversion.svg/2000px-Degree-Radian_Conversion.svg.png>

//gradient atmosphere
// // Shift from red to red orange in RGB mode
  colorMode(RGB);
  for (int i = 0; i < 900; i++) 
  {
    float r = 255 + (i*0.9);
    float g = 0 + (i*0.5);
    float b = 0 - (i*1.5);
    stroke(r, g, b, 255);
    line(i, 0, i, 900);
  }
//Arcs & ellipse for gradient and atmosphere
  smooth();
//"for" loop
  stroke(#FBEAD0,175);//white oange
  strokeWeight(0.9);
  noFill();
  
  //#EDC78E pinkish white orange
//ellipse
for (int d = 1500; d > 0; d -= 5) 
{
ellipse(-300,-215,5000,d);
}
  stroke(#701E00,200);//red orange
  strokeWeight(0.9);
  noFill();

for (int d = 1500; d > 0; d -= 5) 
{
ellipse(-300,-340,3500,d);
}
 //arc
 stroke(#701E00,200);//red orange
  strokeWeight(0.9);
  noFill();

for (int ar = 1500; ar > 0; ar -= 5) 
{
  arc(350, 840, ar, 1000, -PI/2.5, 900);  // lower half of arc 
}

//Ellipse for sun gradient and atmosphere
  stroke(#FDE320);//yellow
  strokeWeight(0.5);
  noFill();
//"for" loop
for (int d = 200; d > 0; d -= 3) 
{
ellipse(532,50,250,d);
}
  stroke(#FFF395,200);//white yellow
  strokeWeight(0.5);
  noFill();
//"for" loop
for (int d = 100; d > 0; d -= 2.5) 
{
ellipse(532,50,100,d);
}

//"for" loop
for (int d = 200; d > 0; d -= 3) 
{
ellipse(532,50,250,d);
}
  stroke(#FFF395);//whitest yellow
  strokeWeight(0.5);
  noFill();
//"for" loop
for (int d = 50; d > 0; d -= 2) 
{
ellipse(532,50,50,d);
}


// Clouds


//Font 01: "8903" (Type)
  PFont font01; // Declare the variable
  font01 = loadFont("ArialNarrow-Bold-100.vlw"); //  Load the font
  textFont(font01); // Set the current text font
  fill(255,90);
  textAlign(CENTER);
  textSize(450);
  text("8903", 450, 425);
//Font 02a: "UNONU" (shapes or code blocks)

//Font 02b: "UNONU" (Type)
//Resources: <http://www.dafont.com/theme.php?cat=302&nb_ppp=50>
//<http://forums.serif.com/showthread.php?t=46254>
//<https://www.google.com/search?sourceid=chrome&ie=UTF-8&q=bulb+font>
  PFont font02; // Declare the variable
  font02 = loadFont("Ozone-50.vlw"); //  Load the font
  textFont(font02); // Set the current text font
  fill(255);
  textAlign(CENTER);
  textSize(170);
  textLeading(50);
  text("UNONU", 450, 300);

//HEADSHOT
 PImage ctu;   // Image must be in the sketch's "data" folder
  ctu = loadImage("headshot.gif"); //edit so there's a transparency!!!!!!!!
//  tint(#F06400); // Tint orange red
  tint(  #FFC195); // Tint light orange red
//  image(ctu, (img_ctu_x - 458), (img_ctu_y - 659));
    image(ctu, 442, 241);
}

