
// PFont is the class which will represents fonts in processing
PFont font;

void setup() {  
  size(300, 300);  

  // createFont builds up a font object from one of the installed 
  // fonts on your computer.
  font = createFont("Courier", 12);
  // creating a PFont object is not enough.. we need to make it active
  // using textFont() 
  textFont(font);
}

void draw() {
  background(255);
  fill(0);
 
  float s = 58;  // the font size we'll use
  float x = 10;
  float y = 50;

  textSize(s);
  
  // because 'chars' are really numbers, we can write loops
  // using them! 
  for (char c='A'; c <= 'Z'; c++) {
    text(c, x, y);      
    x += s;
    if ( x > width ) {
       x = 10;
       y += s; 
    }
  }
  
}


