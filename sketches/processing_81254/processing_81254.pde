
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65678*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/**
 * A simple sketch to demonstrate page turning.
 * 
 * To use your own pages you only need to make changes in setup()
 * (1) create a book with your own page width and height
 * (2) add pages 
 * @author Peter Lager
 *
 */

Book book;
PImage bgImage;
PFont font;
PVector sPos;

public void setup() {
  size(1000, 409);
  bgImage = loadImage("greenbg.jpg");
  cursor(CROSS);
  // Initialise font and screen position for text 
  font = createFont("Sans-Serif", 26);
  textFont(font);
  // Create the a book with the page width and height specified.
  // NOTE: The actual book width will be 2 * page width.
  book = new Book(this, 330, 300);
  // Add pages to the book. Each page has its own image which MUST
  // be the same size as the page width and height.
  // The parameter is the image filename.
  book.addPage("front.jpg");
  book.addPage("page1.jpg");
  book.addPage("page2.jpg");
  book.addPage("back.jpg");
  // Finally before we can use the book it must be initialised
  book.initialiseBook();
  // Draw the book in its starting with the first page.
  image(book.getBookImage(), 0, 0);
}

/**
 * The N and P keys are used to turn a page. If a page is 
 * still turning then the key press will be ignored.
 */
 void keyPressed() {
  if (key == 'p' || key == 'P')
    book.previousPage();
  if (key == 'n' || key == 'N')
    book.nextPage();
}

public void draw() {
  background(bgImage);
  pushMatrix();
  translate((width - book.getBookImageWidth())/2, 10);
  image(book.getBookImage(), 0, 0);
  popMatrix();
  if (!book.isTurning()) {
    fill(0, 64, 0);
    noStroke();

  }
}

/**
 * Calculate the length of a string (in pixels) for 
 * a given font and font size
 * @param f
 * @param s
 * @return
 */
public float strWidth(PFont f, float fsize, String s) {
  float w = 0;
  for (int c = 0; c < s.length(); c++)
    w += f.width(s.charAt(c));
  w *= fsize;
  return w;
}


