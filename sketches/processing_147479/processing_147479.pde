
/**
 * Tutorial example 1
 * Beings doing stuff!
 * https://github.com/rdlester/hermes/wiki/Tutorial-Pt.-2:-A-Simple-World
 */

import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;

///////////////////////////////////////////////////
// CONSTANTS
///////////////////////////////////////////////////
/**
 * Constants should go up here
 * Making more things constants makes them easier to adjust and play with!
 */
static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;
static final int PORT_IN = 8080;
static final int PORT_OUT = 8000; 

World currentWorld;

/**
 * Add groups here if you need custom group behavoir
 */

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
  background(0); 
  Hermes.setPApplet(this);

  currentWorld = new TutorialWorld(300);       

  //Important: don't forget to add setup to TemplateWorld!

  currentWorld.start(); // this should be the last line in setup() method
}

void draw() {
  currentWorld.draw();
}

/**
 * An immobile flashing square --- DANGEROUS 
 */
class GlitchySquare extends Being {
  static final int WIDTH = 50;
  static final int HEIGHT = 50;
  color _c;
  static final int SHAKE_STEP = 10;

  GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));
    _c = pickColor();
  }

  public void update() {
    _c = pickColor();
    _position.x += round(random(SHAKE_STEP * 2)) - SHAKE_STEP;
  }

  public void draw() {
    fill(_c);
    noStroke();
    _shape.draw();
  }

  private color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }
}


/**
 * Template interactor between a MyBeing and another MyBeing
 */
class SquareInteractor extends Interactor<GlitchySquare, GlitchySquare> {
  SquareInteractor() {
    //Add your constructor info here
  }

  boolean detect(GlitchySquare being1, GlitchySquare being2) {
    //Add your detect method here
    return true;
  }

  void handle(GlitchySquare being1, GlitchySquare being2) {
    //Add your handle method here
  }
}


/**
 * Tutorial World
 * A World filled with squares
 */
class TutorialWorld extends World {
  int _squareNum;

  TutorialWorld(int squareNum/*, int portIn, int portOut*/) {
    super(/*portIn, portOut*/);
    _squareNum = squareNum;
  }

  void setup() {
    for (int i = 0; i < _squareNum; i++) {
      int x = (int) random(WINDOW_WIDTH - 50);
      int y = (int) random(WINDOW_HEIGHT - 50);
      register(new GlitchySquare(x, y));
    }
  }
  
  void draw() {
    background(0);
    super.draw();
  }
}

