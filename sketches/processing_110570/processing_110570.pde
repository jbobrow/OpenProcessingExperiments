
/**
* Veritablour
*
* An interactive poem. Luís Rodrigues Alves (Louisload), 19/09/2013.
* For J.
*/

public static final float SQUARE_RATIO = 0.3;
public static final int SQUARE_MIN_VELOCITY = 1;
public static final int SQUARE_MAX_VELOCITY = 3;

public static int MAXIMUM_REDNESS = 207;

//Background variables
public int currentMaximumRedness = 20;
public static final int MAXIMUM_REDNESS_LIMIT = 207;
public int currentMinimumRedness = 0;
public static final int MINIMUM_REDNESS_LIMIT = 100;
public int currentRedness = 0;
public boolean rednessFilling = true;

//Thunder variables
public static final int MAXIMUM_THUNDER_PROBABILITY = 90;
public static final int MAXIMUM_THUNDER_WEIGHT = 10;
public int thunderProbability = 0;
public int thunderWeight = 5;
public Square[] squares;

//Poem variable

String[]poem = {
  "Hey...",
  "Satisfy",
  "conscientia constraints.",
  "Your aqua regia",
  "and my aqua pura",
  "trap both fluids",
  "inside a glass",
  "and free the touch",
  "from the prison of the instant.",
  "let it live",
  "and let it be, always.",
  "amplify",
  "intensify",
  "my atom",
  "inside a data bit",
  "flowing on the canal",
  "to find you",
  "to love you."
};

public static final double POEM_PROBABILITY = 2;
public boolean poemActive = true;
public int currentPoemPhrase = 0;
public int currentPoemFade = 255;
public PoemPhrase phrase = null;
public PFont font;

//Living thing
public LivingThing livingThing;

void setup() {
  
  size(640, 480);
  background(204, 0, 0);
  
  // setup squares
  int numberOfSquares = int(SQUARE_RATIO*width);
  squares = new Square[numberOfSquares];
  
  for (int i = 0; i < numberOfSquares; i++) {
    int randomVelocity = SQUARE_MIN_VELOCITY + int(random(SQUARE_MAX_VELOCITY));
    squares[i] = new Square(int(random(width)), int(random(height)), randomVelocity);
  }
  
  //Load font
  font = createFont("dysin4mation", 40, false);
  textFont(font, 40);
}

void draw() {
  
    
    if (currentPoemPhrase < poem.length) {
    drawBackground();
          
    drawSquares();
    
    drawThunder();
    
    drawLivingThing();
    
    drawPoem();
    } else {
     textAlign(CENTER, CENTER);
     fill(255, 255, 255, 1);
     rect(0, 0, width, height);
     text("I love you.", width/2, height/2);
    }
}

void drawBackground() {
  
  if (currentRedness >= currentMaximumRedness) {
    rednessFilling = false;
  } else if (currentRedness <= currentMinimumRedness) {
    rednessFilling = true;
  }
  
  //Calculate speed
  int redSpeed = (currentMaximumRedness * 3)/MAXIMUM_REDNESS_LIMIT;
    if (rednessFilling) {
      currentRedness += redSpeed;
    } else {
      currentRedness -= redSpeed;
    }
    
    fill(currentRedness, 0, 0, 150);
    rect(0, 0, width, height);
}

void drawPoem() {
  

  if (!poemActive && phrase == null) {
    if ((random(100) < POEM_PROBABILITY) && (currentPoemPhrase < poem.length)) {
      poemActive = true;
    }
  } 
  
  if (poemActive) {
    if (phrase == null) {
      phrase = new PoemPhrase(mouseX, mouseY, poem[currentPoemPhrase]);
    }
    
    phrase.display(255, 255, 255, mouseX, mouseY);
  }
  
  if(!poemActive && phrase != null) {
    fill(255, 255, 255, currentPoemFade);
    rect(0, 0, width, height);
    fill(0, 0, 0, currentPoemFade);
    currentPoemFade--;
    phrase.display();
    
    if (currentPoemFade <= 0) {
      phrase = null;
      currentPoemFade = 255;
    }
  }
  
}

void drawSquares() {
  for(int i = 0; i < squares.length; i++) {
     squares[i].display(); 
     squares[i].moveUp();
    }
}

void drawThunder() {
 
  if (int(random(100)) <= thunderProbability) {
  
 int numberOfPoints = int(random(60));
 boolean directionIsLeft = (int(random(1)) == 0);
 int previousPointY = 0;
 int previousPointX = int(random(width));
 
   for (int i = 0; i < numberOfPoints; i++) {
     int direction = directionIsLeft ? -1 : 1;
     int nextPointX = previousPointX + (int(random(4)) * direction);
     int nextPointY = previousPointY + int(random(50));
     strokeWeight(int(random(thunderWeight)));
     line(previousPointX, previousPointY, nextPointX, nextPointY);
     
     //Point made it past the screen
     if (nextPointY > height) {
       line(nextPointX, nextPointY, nextPointX - 3, height);
       break;
     } else {
       previousPointY = nextPointY;
       previousPointX = nextPointX;
     }
     
     //End
     if (i == numberOfPoints - 1) {
        line(nextPointX, nextPointY, nextPointX - 3, height);
     }
   }
  }
}

void drawLivingThing() {
  if(currentPoemPhrase > (poem.length/2)) {
    
    if (livingThing == null) {
     livingThing = new LivingThing(width/2, height/2); 
    }
    livingThing.display();
  }
}

void mousePressed() {
  if (phrase != null && poemActive) {
    background(255, 255, 255);
    fill(0);
    text(poem[currentPoemPhrase], mouseX, mouseY);
    poemActive = false;
    
    //Go to next level
    if (currentPoemPhrase < poem.length) {
      currentPoemPhrase++;
      currentMinimumRedness += MINIMUM_REDNESS_LIMIT/poem.length;
      currentMaximumRedness += MAXIMUM_REDNESS_LIMIT/poem.length;
      thunderProbability += MAXIMUM_THUNDER_PROBABILITY/poem.length;
      thunderWeight += MAXIMUM_THUNDER_WEIGHT/poem.length;
    }
  }
}

class Square {
 
 private int x, y;
 private int velocity;
 private int rotation;
 private int size;
 private int currentAlpha;
 private int fadingSpeed;
 private boolean fading;
 
 private static final int SQUARE_SIZE = 1;
 private static final int MAX_FADING_SPEED = 5;

  public Square(int initial_x, int initial_y, int initialVelocity) {
   x = initial_x;
   y = initial_y;
   velocity = initialVelocity;
   size = SQUARE_SIZE + initialVelocity - 1;
   rotation = 0;
   currentAlpha = 255;
   fadingSpeed = int(random(MAX_FADING_SPEED));
   fading = true;
  } 
  
  public void moveUp() {
    if (y > 0) {
      y = y - velocity;
    } else {
      y = height;
    }
  }

  public void display() {
    stroke(0, 0, 0, currentAlpha);
    fill(0, 0, 0, currentAlpha);
    
    //rect(x, y, size, size);
    strokeWeight(1);
    quad(x - size + rotation, y - size - rotation, x + size + rotation, y - size - rotation, x + size - rotation, y + size + rotation, x - size - rotation, y + size + rotation);
    
    if (currentAlpha <= 0) {
      fading = false;
    } else if (currentAlpha >= 255) {
      fading = true;
    }
    
    if (fading) {
      currentAlpha = currentAlpha - fadingSpeed;
    } else {
      currentAlpha = currentAlpha + fadingSpeed;
    }
    
  }
}

class PoemPhrase {
  int x, y;
  String phrase;
  
  public PoemPhrase(int xpos, int ypos, String initialPhrase) {
    x = xpos;
    y = ypos;
    phrase = initialPhrase;
  }
  
  public void display(int r, int g, int b, int xpos, int ypos) {
    x = xpos;
    y = ypos;
    fill(r, g, b);
    textAlign(CENTER, CENTER);
    text(phrase, x, y);
  }
  
  public void display() {
   text(phrase, x, y); 
  }
}

class LivingThing {
  private int x1, y1, x2, y2, x3, y3, x4, y4;
  
  public LivingThing(int xpos, int ypos) {
    x1 = x2 = x3 = x4 = xpos;
    y1 = y2 = y3 = y4 = ypos;
  }
  
  void display() {
    
    int direction = randomDirection();
   if (xWithinBounds(x1 + direction)) {
     x1 += direction;
   }
   
   direction = randomDirection();
   if (xWithinBounds(x2 + direction)) {
     x2 += direction;
   }
   
   direction = randomDirection();
   if (xWithinBounds(x3 + direction)) {
     x3 += direction;
   }
   
   direction = randomDirection();
   if (xWithinBounds(x4 + direction)) {
     x4 += direction;
   }
   
   direction = randomDirection();
   if (yWithinBounds(y1 + direction)) {
     y1 += direction;
   } 
   
   direction = randomDirection();
   if (yWithinBounds(y2 + direction)) {
     y2 += direction;
   } 
   
   direction = randomDirection();
   if (yWithinBounds(y3 + direction)) {
     y3 += direction;
   } 
   
   direction = randomDirection();
   if (yWithinBounds(y4 + direction)) {
     y4 += direction;
   } 
   
   noFill();
   stroke( 255, 255, 255);
   bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  
  int randomDirection() {
   return (int(random(50)) <= 25) ? 1 : -1; 
  }
  
  boolean xWithinBounds(int xTest) {
    
    if ((xTest >= width/4) && (xTest <= 3*(width/4))) {
      return true;
    } 
    
    return false;
  }
  
  boolean yWithinBounds(int yTest) {

    if ((yTest >= height/4) && (yTest <= 3*(height/4))) {
      return true;
    } 
    
    return false;
    
  }
  
}


