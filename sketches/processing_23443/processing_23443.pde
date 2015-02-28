
/* 
 * Not quite a quine. A drawing machine that draws it's own code on the screen. Cheats by reading in the sketch file...
 */
 
/*
 * Variable declarations
 */
 
String s, l; /* s is the string representing the whole sketch, l represents a line used to construct s */
PVector pos, prepos; /* the current and previous position of text */
int i; /* cursor used to read through the text */
BufferedReader reader; /* reader object to read in the .pde file */
boolean read; /* boolean used to tell the reader to keep reading */
color[] colors; /* array of colors used to approximate syntax highlighting */

void setup() {
  size(800, 800); /* set size of the window to 800 x 800 pixels */
  background(255); /* set background to white */
  pos = new PVector(mouseX, mouseY); /* set initial position to current mouse position */
  prepos = pos; /* set previous position to current position */
  reader = createReader("drawme.pde"); /* create reader object, passing it this sketch name */
  i = 0; /* set initial character position to the first character in the string */
  s = ""; /* initialise an empty string */
  
  /*
   * Read in the sketch file. 
   */
  read = true; /* tell the reader to read */
  while(read) { /* while there are still lines to read in, */
    try {
      l = reader.readLine(); /* if there is a line, read it in to 'l' */
    } 
    catch (IOException e) { /* if there's no line to read catch the exception and set 'l' to null */
      e.printStackTrace();
      l = null;
    }
    if (l == null) { /* if we ran out of lines, tell the read loop to stop */
      read = false; 
    } 
    else {

      s = s + l; /* if there was a line then add it onto the end of the accumulating string */
    }
  }
  colors = new color[s.length()]; /* create an array to hold colors for syntax highlighting,  
   the same length as the string to print */
  
  /* call setColor() for each keyword appearing in the sketch trying to avoid things that appear
   * within other words - i.e. int, in print... 
   */
  setColor("String");
  setColor("PVector");
  setColor(" int ");
  setColor("boolean");
  setColor(" color ");
  setColor("void");
  setColor("setup");
  setColor("size");
  setColor("new");
  setColor("createReader");
  setColor("true");
  setColor("while");
  setColor("try");
  setColor("catch");
  setColor("null");
  setColor("if");
  setColor("false");
  setColor("else");
  setColor("length");
  setColor("draw");
  setColor("mouseDragged");
  setColor("background");
  setColor("fill");
  setColor("textSize");
  setColor("text");
  setColor("length");
  setColor("charAt");
  setColor("indexOf");
  
  /* call colquotes() to go through and set colour for strings appearing in the text */
  colquotes();
  /* call colcomms() to go through and set colour for comments appearing in the text */
  colcomms();
  /* call colConsts() to go through colour array and set colour of constants appearing in the text */
  colConsts("mouseX");
  colConsts("mouseY");
}

void draw() { /* just there so mouseDragged() works... */
}

/* draw text when the mouse is dragged... */
void mouseDragged() {

  pos = new PVector(mouseX, mouseY); /* create new position vector for current mouse position */
  if(pos.dist(prepos) > 10) { /* if the current mouse position is more than 10 pixels away from the previous position */
    fill(colors[i]); /* set colour to value of colour array for current position in string */
    textSize(10); /* set font size to 10, probably doesn't need to be here, doesn't change... */
    text(s.charAt(i), mouseX, mouseY);  /* draw current character at mouse position */
    i = (i + 1) % s.length(); /* move cursor to next charater in the string */
    prepos = pos; /* re-set previous position to current position */
  }
}

/* setColor() trawls through the string and set's the colour in the color array to an approximation of 
 * the orange used to indicate keywords in processing text editor...
 */
void setColor(String string) { /* setColor takes one String parameter */
  int colorindex = 0;

  while(colorindex < colors.length) { /* loop until the end of the colours array */
    if(s.indexOf(string, colorindex) != -1) {  /* if the keyword passed in appears in the string created from the text file */
      colorindex = s.indexOf(string, colorindex); /* set cursor to position of the word in the string */
      for(int i = colorindex; i < colorindex + string.length(); i++) { /* loop through the colour array from the index mirroring the beginning of the word, to the end of the word */
        colors[i] = color(234, 162, 73); /* set color array value to a guess at orange... */
      }
      colorindex = colorindex + string.length(); /* move cursor to end of word */
    }
    else {
      colorindex = colors.length; /* if word doesn't appear in string, then move to the end of the array to exit the loop */
    }
  }
}

/* loops through and sets colour array value to blue for constants appearing in the text (pass constant in as parameter)*/ 
void colConsts(String string) {
  int colorindex = 0;

  while(colorindex < colors.length) {
    if(s.indexOf(string, colorindex) != -1) {     
      colorindex = s.indexOf(string, colorindex);
      for(int i = colorindex; i < colorindex + string.length(); i++) {
        colors[i] = color(123, 200, 240);
      }
      colorindex = colorindex + string.length();
    }
    else {
      colorindex = colors.length;
    }
  }
}

/* loops through and sets value of colours array to blue for characters between quotes. 
 * buggy because of double quotes... i.e. doesn't handle escaped quotes.
 */
void colquotes(){
  int quoteindex = 0;
  int inquotes = 1;
   while(quoteindex < colors.length) {
    if(s.indexOf("\"", quoteindex + 1) != -1) {   
      quoteindex = s.indexOf("\"", quoteindex + 1);
      inquotes++;
      for(int i = quoteindex; i < s.indexOf("\"", quoteindex + 1) + 1; i++) {
        if(inquotes%2 == 0){
           colors[i] = color(123, 200, 240);
        }  
    }
    }else {
      quoteindex = colors.length;
    }
  }
}

/* functions similarly to colquotes, loops through and set's value of colours array to light
 * grey for values corresponding to characters between multiline comment indicators
 */
void colcomms(){
  int comindex = 0;
   while(comindex < colors.length) {
    if(s.indexOf("/*", comindex) != -1) {
      comindex = s.indexOf("/*", comindex);
      for(int i = comindex; i < s.indexOf("*/", comindex + 1) + 2; i++) {
           colors[i] = color(200);
      }
      comindex = s.indexOf("*/", comindex + 1);
    }else {
      comindex = colors.length;
    }
  }
}




