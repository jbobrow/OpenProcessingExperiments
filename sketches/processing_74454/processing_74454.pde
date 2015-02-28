
import java.awt.Color;
import java.awt.Rectangle;
import java.awt.geom.Point2D;

import processing.opengl.*;

import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.property.*;

/**
 * A NextText-based interactive FULL TRAGEDY logo animations 2012. Interactive text productions clicking, dragging and moving clusters of the text.
Full tragedy productions 2012, Leonardo de Melo on creative commons 2012.
 * interactive artwork by Jason Lewis with Elie Zananiri
 * Processing port by Elie Zananiri | Obx Labs | June 2007
 */

// constants
static final float FONT_SIZE = 36.0f;
static final float PATH_POINTDISTANCE = 20.0;
static final Color IDLE_COLOR = new Color(0.5f, 0.5f, 0.5f, 0.1f);
static final Color SELECTED_COLOR = new Color(1.0f, 1.0f, 1.0f, 1.0f);
static final Color STROKE_COLOR = new Color(0.0f, 0.0f, 0.0f, 0.0f);
static final float COLOR_SPEED = 10.0f;
static final float ROTATE_SPEED = (float)Math.PI/40;

// variables
Book book;
SnakeMousePath snakeMousePath;
PFont font;

AbstractBehaviour topBehaviour;
Repeat repeat;
Condition isInSnake;

Multiplexer inSnakeActions;
Multiplexer outOfSnakeActions;

Action colorizeSelected;
Action followLeaderPath;

Action colorizeIdle;
Action swim;
Action rotateBack;

void setup() {
  size(900, 600, OPENGL);
  smooth();
  
  book = new Book(this);

  // create the mouse path input source and add it to the manager
  snakeMousePath = new SnakeMousePath(this, book, PATH_POINTDISTANCE);
  book.getInputs().add("SnakeMousePath", snakeMousePath);
  
  font = createFont("GillSans-UltraBold.ttf", FONT_SIZE, true);
  textFont(font);
  noStroke();
  
  inSnakeActions = new Multiplexer();
  colorizeSelected = new Colorize(SELECTED_COLOR, COLOR_SPEED);
  inSnakeActions.add(colorizeSelected);
  followLeaderPath = new FollowLeaderPath(snakeMousePath, PATH_POINTDISTANCE);
  inSnakeActions.add(followLeaderPath);

  outOfSnakeActions = new Multiplexer();
  colorizeIdle = new Colorize(IDLE_COLOR, COLOR_SPEED);
  outOfSnakeActions.add(colorizeIdle);
  swim = new Swim(new Rectangle(width, height));
  outOfSnakeActions.add(swim);
  rotateBack = new RotateBack(ROTATE_SPEED);
  outOfSnakeActions.add(rotateBack);

  isInSnake = new IsInSnake(inSnakeActions, outOfSnakeActions);
  repeat = new Repeat(isInSnake, 0);
  topBehaviour = new Behaviour(repeat);
  book.addBehaviour(topBehaviour);

  buildBook();
}

public void buildBook() {
  // load the text file
  String lines[] = loadStrings("iwf.txt");
  for (int i=0; i < lines.length; i++) {
    if (lines[i].length() != 0) {
      buildLine(lines[i], new PVector(0, 0, 0));
    }  
  }
}

public void buildLine(String text, PVector pos) {
  // create a new passage
  TextObjectGroup newGroup = new TextObjectGroup(pos);

  // create a new word and set its temporary position to 0,0,0
  PVector wOffset = new PVector(0, 0, 0);
  TextObjectGroup wordGroup = new TextObjectGroup(wOffset);

  // each glyph is offset by gOffset from the word location.
  // start at 0,0,0
  PVector gOffset = new PVector(0, 0, 0);

  for (int i=0; i < text.length(); i++) {
    // get the glyph at position i
    String glyphString = text.substring(i,i+1);

    // if glyph is a space (end of word)
    if (glyphString.compareTo(" ") == 0) {
      // get a random position for the word in the window
      wOffset =  new PVector(random(1)*width, random(1)*height, 0);

      // set the word position
      PVectorProperty wordPos = (PVectorProperty)wordGroup.getProperty("Position");
      wordPos.add(wOffset);

      // attach the word to the passage
      newGroup.attachChild(wordGroup);

      // create a new word and rest the glyph offset
      wordGroup = new TextObjectGroup(new PVector(0,0,0));
      gOffset = new PVector(0,0,0);

    // if the glyph is not a space
    } else {
      // create a new glyph
      TextObjectGlyph glyph = new TextObjectGlyph(glyphString.toUpperCase(), font, FONT_SIZE, gOffset);

      // initalize the glyph's colour
      ColorProperty colorProperty = glyph.getColor();
      Color glyphColor = IDLE_COLOR;
      colorProperty.set(glyphColor);
      colorProperty.setOriginal(glyphColor);
      
      // initalize the glyph's stroke colour
      ColorProperty strokeColorProperty = glyph.getStrokeColor();
      Color glyphStrokeColor = STROKE_COLOR;
      strokeColorProperty.set(glyphStrokeColor);
      strokeColorProperty.setOriginal(glyphStrokeColor);

      // intialize the "Follower" property
      BooleanProperty followProperty = new BooleanProperty(false);
      glyph.init("Follower", followProperty);

      // translate the glyph offset the its width and spacing
      gOffset.add(new PVector((float)glyph.getLogicalBounds().getWidth(), 0, 0));
      gOffset.add(new PVector(2, 0));

      // attach the glyph to the word
      wordGroup.attachChild(glyph);   

      // register the glyph with the behaviour
      topBehaviour.addObject(glyph);
    }
  }

  // get a random position for the word in the window
  wOffset =  new PVector(random(1)*width, random(1)*height, 0);

  // set the word position
  PVectorProperty wordPos = (PVectorProperty)wordGroup.getProperty("Position");
  wordPos.add(wOffset);

  // attach the last word to the passage
  newGroup.attachChild(wordGroup);

  // attach the passage to the book
  book.attachText(newGroup);
}

void draw() {
  background(0);

  renderSnakeMousePath();
  book.stepAndDraw();
}

public void renderSnakeMousePath() {
  noFill();
  stroke(255, 255, 255, 50);

  // get the path
  ArrayList path = snakeMousePath.getPath();

  beginShape();
  // render curves for every set of three points, using the middle one as the control point
  Point2D point1;
  for (int i=0; i < path.size(); i++) {
    point1 = (Point2D)path.get(i);
    curveVertex((float)point1.getX(), (float)point1.getY());
  }
  endShape();

  // draw "webs" at every corner
  Point2D point2;
  for (int i=0; i < path.size()-2; i+=1) {
    point1 = (Point2D)path.get(i);
    point2 = (Point2D)path.get(i+2);
    line((int)point1.getX(), (int)point1.getY(), (int)point2.getX(), (int)point2.getY());
  }
}

