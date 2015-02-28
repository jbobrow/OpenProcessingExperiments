
import java.awt.Color;

import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.physics.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.behaviour.dform.*;

/**
 * A NextText sketch where different behaviours can be applied
 * to the text using the 1, 2, 3, 4, 5 keys.
 *
 * by Elie Zananiri | Obx Labs | June 2007
 * and modified by Leonardo de Melo, full tragedy productions 2012
 */

// global attributes
Book book; // the main object managing everything
Selector selector;  // the main action affecting the text
PFont font;  // the font used to display the text
String word = "full tragedy productions 2012";  // the displayed text

void setup() {
  size(1000, 360);
  smooth();

  // create the Book
  book = new Book(this);

  // load and set the font and color attributes
  font = createFont("CenturySchL-Ital-48", 48, true);
  textFont(font);
  fill(255);
  stroke(241, 100, 34);
 
  // create the Selector and add all the Actions to it
  // a Selector is a control action that manages multiple
  // actions and allows to activate any one at runtime,
  // in this case, when keyboard keys are pressed.
  selector = new Selector();

  // add Throb, ChaosPull, Reform, RandomMotion
  // and Colorize actions to the Selector
  selector.add("Throb", new Throb(2, 100));
  // The Book.mouse passed to ChaosPull keeps the up-to-date mouse position
  selector.add("ChaosPull", new ChaosPull(Book.mouse));
  selector.add("Reform", new Reform());
  selector.add("RandomMotion", new RandomMotion());
  // Chain allows to string together actions sequentially
  Chain colour = new Chain();
  colour.add(new Colorize(Color.BLACK, 5)); // The first chained action will fade to black
  colour.add(new Colorize(Color.WHITE, 5)); // The second chained action will fade to white
  // Wrapping the Chain action in a Repeat action will repeat it indefinitely
  selector.add("Colour", new Repeat(colour));

  // convert the action into a behaviour  
  Behaviour selectorBehaviour = selector.makeBehaviour();
  // add the Selector Behaviour to the Book to affect future glyphs
  // that are added
  book.addGlyphBehaviour(selectorBehaviour);
  // select the Throb behavior as default
  selector.select("Throb");
  
  // add the text to the book, which uses all previously set
  // properties (font, color, behaviours, etc.)
  book.addText(word, 320, 200); 
}

void draw() {
  // clear the background
  background(0);
  
  // step (to apply behaviours) and
  // draw the book content
  book.stepAndDraw();
}

// activate the different actions added to the Selector when
// keys 1 to 5 are pressed
void keyPressed() {
  switch (key) {
    case '1':
      selector.select("Throb");
      break;
    case '2':
      selector.select("ChaosPull");
      break;
    case '3':
      selector.select("Reform");
      break;
    case '4':
      selector.select("RandomMotion");
      break;
    case '5':
      selector.select("Colour");
      break;
  }
}

