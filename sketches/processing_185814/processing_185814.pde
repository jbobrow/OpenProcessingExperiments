
// "ARCH.SYSTEM"
// KIARA GALICINAO
// ARTD 251, WINTER 2015
// FEBRUARY 12, 2014
// THIS EXPERIMENTAL CARTOGRAPHY PROJECT MAPS OUT THE ARCHITECTURAL 
// DESIGN PROCESS, FROM THEORETICAL START TO FINISH. IT SHOWS HOW
// THE ENTIRE DESIGN STEMS FROM A BEGINNING CONCEPT AND INSPIRATION,
// AND HOW EACH STEP EVOLVES INTO THE NEXT.
// THE USER CAN NAVIGATE THROUGH THE MAP BY TRANSLATING AND ZOOMING.

PImage p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, 
      p13, p14, p15, p16, p17, p18, p19;

PImage [] picArray = new PImage [20];

PImage bg;
float scaleFactor;
float x, y;

String [] steps = {"inspiration", "conceptualization", "iteration", "documentation", "execution", "DESIGN"};
String textHolder = "'arch.system'";

// THE ITEMS ARRAY
Item[] items = {};

void setup() {
  size(900, 750);
  scaleFactor = 1;
  println(steps.length);
  textAlign(CENTER);

// LOAD IMAGES
  bg = loadImage("background.png");
  
  p0 = loadImage("0.png");
  p1 = loadImage("1.png");
  p2 = loadImage("2.png");
  p3 = loadImage("3.png");
  p4 = loadImage("4.png");
  p5 = loadImage("5.png");
  p6 = loadImage("6.png");
  p7 = loadImage("7.png");
  p8 = loadImage("8.png");
  p9 = loadImage("9.png");
  p10 = loadImage("10.png");
  p11 = loadImage("11.png");
  p12 = loadImage("12.png");
  p13 = loadImage("13.png");
  p14 = loadImage("14.png");
  p15 = loadImage("15.png");
  p16 = loadImage("16.png");
  p17 = loadImage("17.png");
  p18 = loadImage("18.png");
  p19 = loadImage("19.png");
  picArray[0] = p0;
  picArray[1] = p1;
  picArray[2] = p2;
  picArray[3] = p3;
  picArray[4] = p4;
  picArray[5] = p5;
  picArray[6] = p6;
  picArray[7] = p7;
  picArray[8] = p8;
  picArray[9] = p9;
  picArray[10] = p10;
  picArray[11] = p11;
  picArray[12] = p12;
  picArray[13] = p13;
  picArray[14] = p14;
  picArray[15] = p15;
  picArray[16] = p16;
  picArray[17] = p17;
  picArray[18] = p18;
  picArray[19] = p19;

  items = new Item[picArray.length];
    
// ARRANGE ITEMS EQUALLY IN SEMI-CIRCLE
    float degreeStep = 240.0 / picArray.length;
    
// LOADS IMAGE AND CREATES ITEM FOR EACH FEED ITEM
    for (int i = 0; i < picArray.length; i++) {
      tint(255, 127); // DISPLAY IMAGES AT HALF OPACITY
      items[i] = new Item(picArray[i], degreeStep * i, 300, 0);
    }
  } 

void draw() {
  float degreeChange = (mouseY-width/2)/80.0;

  background(bg);
  scale(scaleFactor);

// ITEMS MOVE WITH MOUSE POSITION 
   translate(mouseX, mouseY);
  
// DISPLAY EACH ITEM
  for (int i = 0; i < picArray.length; i++) {
    items[i].display();

// ROTATE ITEMS, ACCORDING TO MOUSE Y POSITION
// THE LOWER Y VALUE, THE FASTER THE ROTATION CLOCKWISE
// THE HIGHER Y VALUE, THE FASTER THE ROTATION COUNTERCLOCKWISE
    items[i].degree += degreeChange;
  }

// DRAW TEXT
  textSize(random(25,50)); // TEXT CYCLES THROUGH RANDOM SIZES
  text(textHolder, 10, 30);
  fill(0, 102, 153);
}

// ZOOM TO AREA ON SCREEN, WHEN MOUSEWHEEL IS SCROLLED
void mouseWheel(MouseEvent e)
{
  scaleFactor += e.getAmount() / 100;
}

// RESTORE TO ORIGINAL SCALE, WHEN 'X' IS PRESSED
void keyPressed()
{
  if (key == 'x')
  {
    scaleFactor = 1;
  }
}

// TEXT CHANGES, WHEN MOUSE IS PRESSED
void mousePressed(){
  textHolder = steps[int(random(steps.length))];
}

// BASE CODE COURTESY OF TILL NAGEL: FEEDVISRADIALTHUMBNAILS [http://btk.tillnagel.com/tutorials/rotation-translation-matrix.html]
// CODE AND FUNCTIONS COURTESY OF PROCESSING.ORG [https://processing.org/examples/], [https://processing.org/reference/]

// IMAGE "p0.png" COURTESY OF THE SEA LIFE [http://oceaan-waves.tumblr.com/post/40973218319/kalories-bondi-ocean-pool]
// ORIGINAL DESIGN AND IMAGES CREATED IN ARCHITECTURE DESIGN STUDIO [KIARA GALICINAO, ARCH 284, SPRING 2013]

