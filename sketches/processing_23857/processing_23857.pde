
PImage img;
PImage bg;
PFont font;

boolean drawing = false;

void setup(){
  size(733, 478);
  //img = loadImage(selectInput("select an image"));
   bg = loadImage("023.jpg");
   img = loadImage("023.png");
   background (200);
   image(bg,0,0);
      font = loadFont("HelveticaNeue-Bold-48.vlw"); 
     smooth();

}

void draw(){
    textFont(font);
  fill(255); //colour
  text("AS I WANDER", 125, 200);
   text("THROUGH THIS MAZE", 125, 240);
     text("IT'S ALL A BLUR.", 125, 280);
  if (drawing) {
    image (img, mouseX-img.width,0);
}
}

//----------------LEFT----- to draw
void mousePressed () {
  if (mouseButton == LEFT) {
    drawing = true;
//----------------RIGHT----- to overlay background
} else if (mouseButton == RIGHT) {
  // background (bg) ;
    image(bg,0,0);
  }
}

//---------------RELEASE------- stop
void mouseReleased () {
  drawing = false;
}

//-------------mouse actions-----------------------------------

//press and hold left to draw
//right click to overlay





//void keyReleased() {
//if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
//}

// timestamp
//String timestamp() {
// now = Calendar.getInstance();
//return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
//}

