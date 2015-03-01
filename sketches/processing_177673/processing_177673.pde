
/*
Move the mouse to change the color of the frame and of the text.
Press "e" to see the poetry translated in english and press "i"
to see the poetry again in original italian.
Press "p" to generate a png screenshot of the picture.

For the final project I choose to make a vintage postcard of 
my town, Ivrea, with a color changing frame and text.
In the text, besides the greetings, there are some verses, 
about my town, from the poem “Piemonte” of the Italian 
poet Giosué Carducci.
This is my way to say goodbye to everybody.
*/

// create global variables

PImage ivrea;
boolean language = true;


//setup the display and load the artistic image of my city
void setup(){
  size(1067,600);
  ivrea=loadImage("P_20141007_082502b.png");
 colorMode(RGB);
}

void draw() {
  image(ivrea,0,0);
      //load an external font and write the greetings
      PFont book = loadFont("book.vlw");
      textFont(book);
      textAlign(CENTER);
      textSize(32);
      //fill(mouseX, mouseY, mouseX);
      text("Greetings from Ivrea, Italia", width/2,height/2-270);
      
      //if language is true, print the poem in italian
      if (language == true) {
       textSize(18);
       text("Ivrea la bella che le rosse torri", width/2+330,height/2+190);
       text("specchia sognando a la cerulea Dora", width/2+330,height/2+210);
       text("nel largo seno, fosca intorno è l'ombra ", width/2+330,height/2+230);
       text("di re Arduino (Giosué Carducci)", width/2+330,height/2+250);
      }
      
      //if language is false, print the poem in english
       if (language == false) {
       textSize(18);
       text("Ivrea the beautiful that the red towers", width/2+310,height/2+190);
       text("reflects dreamily on the cerulean Dora", width/2+310,height/2+210);
       text("at the large bight, dark around is the", width/2+310,height/2+230);
       text("shadow of king Arduino (Giosué Carducci)", width/2+310,height/2+250);
      }
  
  // this for loop generate the top left side and left side
  // of the frame
  for (int i = width/2-510; i<width/2-250; i+=20) {
    for(int j = height/2-280; j<height/2+240; j+=20){
    rectMode(CENTER);
    rect(i,height/2-280,10,10);
    line(i+5,height/2-285,i+15,height/2-275);
    rect(width/2-510, j,10,10);
    line(width/2-515,j+5,width/2-505,j+15);
  }
  }
  
  // this for loop generate the top right side and right side
  // of the frame
    for (int i = width/2+250; i<width-80; i+=20) {
    for(int j = height/2-280; j<height/2+180; j+=20){
    rectMode(CENTER);
    rect(i,height/2-280,10,10);
    line(i+5,height/2-285,i+15,height/2-275);
    rect(width-60, j,10,10);
    line(width-55,j+5,width-65,j+15);
  }
  }
  
    // this for loop generate the bottom side of the frame
    for (int i = width/2-510; i<width-410; i+=20) {
    rectMode(CENTER);
    rect(i,height/2+240,10,10);
    line(i+5,height/2+245,i+15,height/2+235);
  }
  
}

// this function change the colors of the frame if the mouse
// is moved
void mouseMoved() {
    fill(random(mouseX), random(255), random(mouseY));
    stroke(random(mouseX), random(mouseY), random(255));
}

// this function define the keyboard controls
void keyPressed() {
  if (key=='p' || key=='P') saveFrame("screenshot.png");
  if (key=='i' || key=='I') language = true;
  if (key=='e' || key=='E') language = false;

}

