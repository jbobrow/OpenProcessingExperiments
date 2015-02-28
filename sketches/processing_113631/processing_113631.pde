
// Homework = Create a drawing tool that uses a "for" loop.

int randomOffset = 1;
int transparency = 10;
int currentFont, i;
String[] fontList;
PFont font;

void setup() {
  size( 800, 800 );
  background( 0 );
  fontList = PFont.list();
}

void draw() {

  for(i=0; i < 4; i++ ) {
    stroke(random(0,64));
    line(mouseX, mouseY, mouseX, 800);
    line(mouseX, mouseY, 0, mouseY);    
    line(mouseX, mouseY, mouseX, 0);
    line(mouseX, mouseY, 800, mouseY);
  }


}

/*
  The following functions are really handy when you want to perform a task every time
  the mouse buttons (any of them) are pressed. When a button is pressed
  by the user, the program goes here to see what you want to do. It will
  only do it once for every button press.
*/
void mousePressed() {
  randomOffset = int(random(1,fontList.length-1));
  font = createFont(fontList[randomOffset], 20);
  print(randomOffset);
  for( int i = 4; i < 30; i++ ) {
    textFont(font,i*3);
    fill(randomOffset+128);
    
    text("W", mouseX-i*30, mouseY);
    text("E", mouseX+i*30, mouseY);
    text("N", mouseX, mouseY-i*30);
    text("S", mouseX, mouseY+i*30);
  }
 
}

// If the user presses the spacebar, stop the sketch.
void keyPressed() {
 if( key == ' ') {
   stop();
 } 
}
