
//universals
PFont myFont;
int fontPosX = 210;
int fontPosY = 35;
int numberFontX = 210;
int numberFontY = 485;

//create canvas size with background colour

void setup() {
  size(800, 501);
  background(0);
  smooth();
  noStroke();

  //import text type/see texts
  String[] fontList = PFont.list();

  PImage myImage = loadImage("plane.jpeg");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  smooth();
}

void draw() {
    PFont titleFont = createFont( "Courier New", 30, true );
    textFont(titleFont);
    fill(255);
    smooth();
    noStroke();
    text("Find the difference", fontPosX, fontPosY);
    
    PFont numberFont = createFont( "Helvetica", 30, true );
    textFont(numberFont);
    fill(255);
    smooth();
    noStroke();
    text("There are total of 5 differences.", numberFontX, numberFontY);
     
    // debugging to check where mouse button click position is.
    if( mousePressed && (mouseButton == LEFT) ) {
       println( "mouseX position: " + mouseX + " and mouseY position: " + mouseY); 
    }
  
    if ( mousePressed && (mouseButton == LEFT) ) {
       //E -> S
       if( ( mouseX >= 40 && mouseX <= 47 && mouseY >= 261 && mouseY <= 276 )
           || ( mouseX >= 451 && mouseX <= 458 && mouseY >= 261 && mouseY <= 276 ) ) {
         noFill();
         stroke(0);
         ellipse(43.5, 268, 20, 20);
         noFill();
         stroke(0);
         ellipse(455.5, 268, 20, 20);
       }
       //propeller
       else if( ( mouseX >= 231 && mouseX <= 251 && mouseY >= 66 && mouseY <= 160 )
           || ( mouseX >= 641 && mouseX <= 659 && mouseY >= 66 && mouseY <= 160 ) ) {
         noFill();
         stroke(0);
         ellipse(241, 113, 20, 20);
         noFill();
         stroke(0);
         ellipse(650, 113, 20, 20);
       }
       //shadow
       else if( ( mouseX >= 369 && mouseX <= 382 && mouseY >= 414 && mouseY <= 444 )
           || ( mouseX >= 780 && mouseX <= 793 && mouseY >= 414 && mouseY <= 444 ) ) {
         noFill();
         stroke(0);
         ellipse(375.5, 429, 20, 20);
         noFill();
         stroke(0);
         ellipse(786, 429, 20, 20);
       }
       //orange thing..
       else if( ( mouseX >= 235 && mouseX <= 246 && mouseY >= 300 && mouseY <= 308 )
           || ( mouseX >= 651 && mouseX <= 658 && mouseY >= 300 && mouseY <= 308 )) {
         noFill();
         stroke(0);
         ellipse(240, 304, 20, 20);
         noFill();
         stroke(0);
         ellipse(654, 304, 20, 20);
       }
       //window
       else if( ( mouseX >= 150 && mouseX <= 158 && mouseY >= 248 && mouseY <= 262 )
           || ( mouseX >= 559 && mouseX <= 569 && mouseY >= 248 && mouseY <= 263 ) ){
         noFill();
         stroke(0);
         ellipse(154, 255, 20, 20);
         noFill();
         stroke(0);
         ellipse(564, 255, 20, 20);
       }
    }
}

