
/*  Postcard Program
 
 A multistage animated postcard created for the FutureLearn
 "Creative Coding" Course.
 
 It depicts a stylised version of all four seasons (starting
 and ending with the "current" one (using artbitrary quartering
 of the year to approximate Northern Hemisphere) before displaying
 a text message:
 
 "It's been a long"
 "old year"
 "but it's finally"
 "here"
 
 With the first three lines and the fourth given different effects.
 
 A second message:
 
 "It's time"
 "to start"
 "Processing"
 
 Is given the same treatment
 
 As does an instruction page before it settles into a Casey Reas style
 moving elements routine.
 */

int stage;  // Used to step through the different stages
int fibNo;  // Used to emulate natural growth in the Spring stage

int startingSeason;  // Used to ensure all four seasons are depicted
int season;  // Current season
boolean startOfYear; // Allows the current seaon to be depicted twice
int seasonFrame = 0;  // Used to make frammeCount Season specific
float stemHeight = 0;  // Used in the Spring Stage

ArrayList<Sunbeam> beams;  // Used in the Summer Stage
ArrayList<Leaf> leaves;  // Used in the Autumn Stage
ArrayList<Snowflake> flakes; // Used in the Winter Stage

// The different text messages
String rhymeLines[] = {
  "IT'S  BEEN  A  LONG", 
  "OLD  YEAR", 
  "BUT  THE  TIME  IS"
}; 
String introLines[] = {
  "IT'S  TIME", 
  "TO START"
};
String instructionLines[] = {
  "The next page features", 
  "invisible circular elements", 
  "bouncing around a page.", 
  " ", 
  "Use Left & Right Arrow Keys", 
  "to adjust how close", 
  "they have to get", 
  "before a line is", 
  "drawn between them"
};

PFont myFont;  // Holds the font for all text messaging
ArrayList<MovingLetter> rhymeLetters;  // Used to create one of the text effects

int eMax = 33;  // Number of elements in the Casey Reas stage
ArrayList<Element> elementList;  // Holds the elements in the Casey Reas stage
int minLineDistance = 10;  // Line drawing distance for Casy Reas stage 

int countdown;  // Used to delay transitions between stages


void setup() {
  // Initialise screen
  size(500, 500);
  background(0);

  // Initialise random number generator
  randomSeed(hour()+minute()+second()+millis());

  // Initialse stage variables
  stage = 0;
  countdown = 0;

  // Initialise Season variables
  startingSeason = 1 + int(((month() + 9) % 12) / 3);
  season = startingSeason;
  startOfYear = true;
  seasonFrame = 0;
  beams = new ArrayList<Sunbeam> ();
  leaves = new ArrayList<Leaf> ();
  flakes = new ArrayList<Snowflake> ();

  // Initialise Text variables
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
  rhymeLetters = new ArrayList<MovingLetter> ();

  // Initialise Casey Reas stage variables
  elementList = new ArrayList<Element> ();
}

void draw() {
  // Creates a suitable frame for the current stage
  // and manages transition between stages

  // Switch on Current Stage
  switch (stage) {

  case 0:  // Seasons Stage
    switch (season) {

    case 1:  // Spring
      if (drawSpring(frameCount - seasonFrame)) {

        // Manage transition to Summer or next stage
        if (season == startingSeason) {
          if (startOfYear) {
            startOfYear = false;
          } else {
            stage++;
            countdown = 12;
          }
        }
        seasonFrame = frameCount;
        season = (season % 4) + 1;
      }
      break;

    case 2:  // Summer
      if (drawSummer(frameCount - seasonFrame)) {

        // Manage transition to Autumn or next stage
        if (season == startingSeason) {
          if (startOfYear) {
            startOfYear = false;
          } else {
            stage++;
            countdown = 12;
          }
        }
        if (beams.size() > 0) beams.clear();  // Tidy up Sunbeams
        seasonFrame = frameCount;
        season = (season % 4) + 1;
      }
      break;

    case 3:  // Autumn
      if (drawAutumn(frameCount - seasonFrame)) {

        // Manage transition to Winter or next stage
        if (season == startingSeason) {
          if (startOfYear) {
            startOfYear = false;
          } else {
            stage++;
            countdown = 12;
          }
        }
        if (leaves.size() > 0) leaves.clear();  // Tidy up Leaves
        seasonFrame = frameCount;
        season = (season % 4) + 1;
      }
      break;

    case 4:  // Winter
      if (drawWinter(frameCount - seasonFrame)) {

        // Manage transition to Spring or next stage
        if (season == startingSeason) {
          if (startOfYear) {
            startOfYear = false;
          } else {
            stage++;
            countdown = 12;
          }
        }
        if (flakes.size() > 0) flakes.clear();  // Tidy up Snowflakes
        seasonFrame = frameCount;
        season = (season % 4) + 1;
      }
      break;
    }
    break;

  case 1:  // Fade to first text Message 
    if (countdown > 0) {
      noStroke();
      fill(0, 32);
      rect(0, 0, width, height);
      countdown--;
      if (countdown == 0) {
        stage++;
      }
    } else {
      stage++;
    };
    break;

  case 2:  // Moving part of first Text Message (Rhyme)
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    if (drawMovingText(rhymeLines, 30)) {
      stage++;
      countdown = 100;
    }
    break;

  case 3:  // Allow first Text Message time to finish moving
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    drawMovingText(rhymeLines, 30);
    if (countdown-- < 0) {
      stage++;
      countdown = 40;
      if (rhymeLetters.size() > 0) rhymeLetters.clear();
    }
    break;

  case 4:  // Reverse video part of first Text Message
    drawReverse("HERE");
    if (countdown-- < 0) {
      stage++;
      background(0);
    }
    break;

  case 5:  // Moving part of second Text Message (Introduction)
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    if (drawMovingText(introLines, 48)) {
      stage++;
      countdown = 100;
    }
    break;

  case 6:  // Allow second Text Message time to finish Moving
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    drawMovingText(introLines, 48);
    if (countdown-- < 0) {
      stage++;
      countdown = 40;
      if (rhymeLetters.size() > 0) rhymeLetters.clear();
    }
    break;

  case 7:  // Reverse Video part of second Text Message
    drawReverse("PROCESSING");
    if (countdown-- < 0) {
      stage++;
    }
    break;

  case 8:  // Moving part of third Text Message (Instructions)
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    if (drawMovingText(instructionLines, 24)) {
      stage++;
      countdown = 100;
    }
    break;

  case 9:  // Allow third Text Message time to finish moving
    noStroke();
    fill(0, 8);
    rect(0, 0, width, height);
    drawMovingText(instructionLines, 24);
    if (countdown-- < 0) {
      stage++;
      countdown = 32;
      if (rhymeLetters.size() > 0) rhymeLetters.clear();
    }
    break;

  case 10:  // Reverse Video part of third Text Message
    drawReverse("Get Ready ...");
    if (countdown-- < 0) {
      stage++;
      background(0);
    }
    break;

  case 11:  // Casey Reas stage ad infinitum
    drawElements();
    break;
  }
}

boolean drawSpring(int frameNo) {
  // Meant to draw a stem surmounted by a low head comprised of circular balls
  // With four "leaves" writhing at the bottom of the stem

  // Draw initial version of elements for first frame
  if (frameNo <= 1) {
    // Clear picture and Draw stem
    background(0);

    stroke(0);
    fill(96, 255, 0);
    fibNo = 0;

    stemHeight = height/10;

    beginShape();
    vertex(width/2-width/32, height);
    vertex(width/2-width/64, height - stemHeight);
    vertex(width/2+width/64, height - stemHeight);
    vertex(width/2+width/32, height);
    endShape();
  } else {
    float myAngle = radians(frameNo/1.75);
    float myAngle2 = radians(frameNo/1.5);
    float myAngle3 = radians(frameNo/2);
    float myAngle4 = radians(frameNo/1.25);
    float heightOffset = constrain(height-frameNo/6, height*0.67, height*0.9);

    // Draw stem
    stemHeight = constrain(stemHeight+5, 0, height * 0.8);
    stroke(0, 1);
    fill(96, 255, 0, 2);
    beginShape();
    vertex(width/2-width/32, height);
    vertex(width/2-width/64, height - stemHeight);
    vertex(width/2+width/64, height - stemHeight);
    vertex(width/2+width/32, height);
    endShape();

    // Draw flower Head
    float ballsize = stemHeight < height*0.8 ? width/32 : 20+(height/5.5 - fibNo) / (height/5.5) * 25;
    stroke(192, 240, 255, 160);
    fill(64, 64, 255, 160);
    ellipse(width/2 + fibNo*sin(frameNo), height - stemHeight + fibNo*cos(frameNo), ballsize, ballsize);
    fibNo += frameNo/333;
    fibNo = fibNo % int(height/5.5);

    // Draw first "leaf"
    stroke(0);
    fill(160, 255, 0);
    beginShape();
    vertex(width/2, height);
    bezierVertex(3*width/8+width/21*cos(myAngle/10), heightOffset+height/21*sin(myAngle/10), 3*width/8+width/13*cos(myAngle/5), heightOffset+height/13*sin(myAngle/5), 3*width/8+width/8*cos(myAngle/2), heightOffset+height/8*sin(myAngle/2));
    curveVertex(3*width/8+width/13*cos(myAngle/10), heightOffset+height/13*sin(myAngle/10));
    curveVertex(3*width/8+width/8*cos(myAngle/5), heightOffset+height/8*sin(myAngle/5));
    curveVertex(3*width/8+width/5*cos(myAngle/2), heightOffset+height/5*sin(myAngle/2));
    curveVertex(width/2, height);
    curveVertex(3*width/8+width/8*cos(myAngle/5), heightOffset+height/8*sin(myAngle/5));
    endShape();

    // Draw second "leaf"
    fill(128, 255, 0);
    beginShape();
    vertex(width/2, height);
    bezierVertex(3*width/8-width/21*cos(myAngle2/10), heightOffset-height/21*sin(myAngle2/10), 3*width/8-width/13*cos(myAngle2/5), heightOffset-height/13*sin(myAngle2/5), 3*width/8-width/8*cos(myAngle2/2), heightOffset-height/8*sin(myAngle2/2));
    curveVertex(3*width/8-width/13*cos(myAngle2/10), heightOffset-height/13*sin(myAngle2/10));
    curveVertex(3*width/8-width/8*cos(myAngle2/5), heightOffset-height/8*sin(myAngle2/5));
    curveVertex(3*width/8-width/5*cos(myAngle2/2), heightOffset-height/5*sin(myAngle2/2));
    curveVertex(width/2, height);
    curveVertex(3*width/8-width/8*cos(myAngle2/5), heightOffset-height/8*sin(myAngle2/5));
    endShape();

    // Draw third "leaf"
    fill(192, 255, 0);
    beginShape();
    vertex(width/2, height);
    bezierVertex(5*width/8+width/21*cos(myAngle3/10), heightOffset+height/21*sin(myAngle3/10), 5*width/8+width/13*cos(myAngle3/5), heightOffset+height/13*sin(myAngle3/5), 5*width/8+width/8*cos(myAngle3/2), heightOffset+height/8*sin(myAngle3/2));
    curveVertex(5*width/8+width/13*cos(myAngle3/10), heightOffset+height/13*sin(myAngle3/10));
    curveVertex(5*width/8+width/8*cos(myAngle3/5), heightOffset+height/8*sin(myAngle3/5));
    curveVertex(5*width/8+width/5*cos(myAngle3/2), heightOffset+height/5*sin(myAngle3/2));
    curveVertex(width/2, height);
    curveVertex(5*width/8+width/8*cos(myAngle3/5), heightOffset+height/8*sin(myAngle3/5));
    endShape();

    // Draw fourth "leaf"
    fill(64, 255, 0);
    beginShape();
    vertex(width/2, height);
    bezierVertex(5*width/8-width/21*cos(myAngle4/10), heightOffset-height/21*sin(myAngle4/10), 5*width/8-width/13*cos(myAngle4/5), heightOffset-height/13*sin(myAngle4/5), 5*width/8-width/8*cos(myAngle4/2), heightOffset-height/8*sin(myAngle4/2));
    curveVertex(5*width/8-width/13*cos(myAngle4/10), heightOffset-height/13*sin(myAngle4/10));
    curveVertex(5*width/8-width/8*cos(myAngle4/5), heightOffset-height/8*sin(myAngle4/5));
    curveVertex(5*width/8-width/5*cos(myAngle4/2), heightOffset-height/5*sin(myAngle4/2));
    curveVertex(width/2, height);
    curveVertex(5*width/8-width/8*cos(myAngle4/5), heightOffset-height/8*sin(myAngle4/5));
    endShape();
  }

  // Indicate finished after an arbittrary number of frames
  return frameNo == 1500;
}

boolean drawSummer(int frameNo) {
  // Meant to draw a sum surrounded by sumbeams

  // In first frame draw intitial state of elements
  if (frameNo <= 1) {
    if (beams.size() > 0) beams.clear();
    background(192, 192, 255);
    for (int i=0; i<32; i++) {
      beams.add(new Sunbeam(width/3, height/4));
    }
  } else {
    // Fade to sky
    noStroke();
    fill(192, 192, 255, 1);
    rect(0, 0, width, height);

    // Add more sunbeams gradually
    if (beams.size() < 150) {
      beams.add(new Sunbeam(width/3, height/4));
      beams.add(new Sunbeam(width/3, height/4));
      beams.add(new Sunbeam(width/3, height/4));
      beams.add(new Sunbeam(width/3, height/4));
    }

    // Animate sunbeams
    for (int i=0; i<beams.size (); i++) {
      if (beams.get(i).move()) {
        beams.remove(i);
        if (beams.size() < 150) {
          beams.add(new Sunbeam(width/3, height/4));
        }
        i--;
      }
    }
  }

  // Add "glare" from the sun
  for (int i=0; i<10; i++) {
    fill (255, 240, 160, 1);
    ellipse(width/3, height/4, width/8*i, width/8*i);
  }

  // Always draw the sun last so that it supercedes sunbeams and sky 
  fill (255, 240, 160);
  ellipse(width/3, height/4, width/8, width/8);

  // Indicate finished after an arbitrary number of frames
  return frameNo == 500;
}

boolean drawAutumn(int frameNo) {
  // Meant to draw parallaxed Leaves falling from the sky and settling on the ground

  boolean endReached = false;

  // Medium blue / grey sky
  background(96, 96, 128);

  // Green ground
  noStroke();
  fill(32, 128, 0);
  rect (0, 0.75*height, width, height/4);
  // Add distance effects by fading towards black near horizon
  for (int i=0; i<25; i++) {
    fill(16, 16);
    rect(0, 0.75*height, width, height/100 * i);
  }

  // In intial frame add a representative number of leaves
  if (frameNo <= 1) {
    // Clear picture and Draw Ground
    if (leaves.size() > 0) leaves.clear();
    for (int i=0; i<16; i++) {
      leaves.add(new Leaf());
      leaves.get(i).display();
    }
  } else {
    int settledCount = 0;

    // Add more leaves as needed
    if (leaves.size() < 750) {
      leaves.add(new Leaf());
    }

    // Animate leaves, keep tally of how many have settled 
    for (int i=0; i<leaves.size (); i++) {
      if (leaves.get(i).move()) {
        settledCount++;
      }
    }

    // Indicate finished after an arbitrary number of leaves have settled
    endReached = (settledCount >= 500);
  }

  return endReached;
}

boolean drawWinter(int frameNo) {
  // Meant to draw parallaxed Snowflakes falling from the sky and settling on the ground

  boolean endReached = false;

  // Dark blue sky
  background(32, 32, 48);

  // Green ground
  noStroke();
  fill(0, 64, 0);
  rect (0, 0.75*height, width, height/4);
  // Add distance effects by fading towards black near horizon
  for (int i=0; i<25; i++) {
    fill(16, 32);
    rect(0, 0.75*height, width, height/100 * i);
  }

  // In intial frame add a representative number of snowflakes
  if (frameNo <= 1) {
    // Clear picture and Draw Ground
    if (flakes.size() > 0) flakes.clear();
    for (int i=0; i<16; i++) {
      flakes.add(new Snowflake());
      flakes.get(i).display();
    }
  } else {
    int settledCount = 0;

    // Add more snowflakes as needed
    if (flakes.size() < 1000) {
      flakes.add(new Snowflake());
    }

    // Animate snowflakes, keep tally of how many have settled 
    for (int i=0; i<flakes.size (); i++) {
      if (flakes.get(i).move()) {
        settledCount++;
      }
    }

    // Indicate finished after an arbitrary number of snowflakes have settled
    endReached = (settledCount >= 250);
  }

  return endReached;
}

boolean drawMovingText(String[] theLines, float fontSize) {
  // Separates lines of text into individual characters and animates their frame by frame
  // movement from the centre of the screen to their final positions
  // Note - produces a good effect when com bined with  a gradual fade to black

  float charX = 0;
  float charY = 0;
  int letterCount = rhymeLetters.size();
  int stationaryLetters;
  float lWidth;
  float wWidth;
  float tWidth;
  float ascent;
  char thisLetter = ' ';
  int allLetters = 0;

  // Determine the total number of characters in the text
  for (int i=0; i<theLines.length; i++) {
    allLetters += theLines[i].length();
  }  

  // Determine character size 
  textSize(fontSize);
  ascent = textAscent() * 2;

  // Add one character per frame if any remain
  if (letterCount < allLetters) {
    int charOffset=0;
    int lineCount = theLines.length;

    // Determine the final position of the new character
    int lineNo = 0;
    while (lineNo < lineCount && charOffset <= letterCount) {
      String tempString = theLines[lineNo];
      int tsIndex = letterCount - charOffset;
      if (tsIndex < tempString.length()) {
        thisLetter = tempString.charAt(tsIndex);
        lWidth = textWidth(tempString);
        wWidth = textWidth(tempString.substring(0, tsIndex));
        tWidth = textWidth(thisLetter)/textWidth('n');
        charX = width/2 - lWidth/2 + +wWidth + tWidth/2;
        charY = (height - ascent * (lineCount+1))/2 + ascent * lineNo;
      }
      charOffset += tempString.length();
      lineNo++;
    }

    // Start animation of this character (inital position = centre of screen)
    rhymeLetters.add(new MovingLetter(thisLetter, width/2, height/2, charX, charY, 100));
  }

  // Animate all characters currently on screen, keep tally of how many
  // have reached their final position
  stationaryLetters = 0;
  for (int i=0; i<rhymeLetters.size (); i++) {
    if (rhymeLetters.get(i).move()) stationaryLetters++;
  }

  // Indicate finished when all characters have reached their desination
  return stationaryLetters == allLetters;
}

void drawReverse(String reverseString) {
  // Displays a word in black, then gradually adds a red background behind it line by line
  // (ie draws the word in reverse video at the bottom of the screen)

  // Draw the current red line 
  float ySeperation = height*0.2 / 32;
  noFill();
  strokeWeight(ySeperation);
  stroke(255, 0, 0);
  for (int i=0; i<width; i++) {
    line(0, height-ySeperation*(frameCount%32), width, height-ySeperation*(frameCount%32));
  }

  // Display the black text on top of red lines
  strokeWeight(1);
  textSize(60);
  fill(0);
  text(reverseString, width/2 - textWidth(reverseString)/2, height-textAscent()*0.75);
}

void drawElements() {
  // Draws a Casey Reas style moving elements scenario
  // Elements are circular and continue in a straight line until they hit either the
  // edge of the screen or another element at which point they keep turning until they
  // discover a direction that allows them to move again

  // Fully populate the screen with elements
  while (elementList.size () < eMax) {
    elementList.add(new Element(50+random(width-100), 50+random(height-100)));
    println(elementList.size ());
  }

  // Animate elements (spin at boundaries if relevant)
  for (int i=0; i<elementList.size (); i++) {
    elementList.get(i).move();
  }

  // Process element interactions 
  for (int i=0; i<elementList.size ()-1; i++) {
    Element firstElement = elementList.get(i);
    for (int j=i+1; j<elementList.size (); j++) {
      Element secondElement = elementList.get(j);

      // If they are close enough, draw a line
      if (firstElement.isNear(secondElement, minLineDistance)) {
        // If they intersect, start both elements spinning
        if (firstElement.intersects(secondElement)) {
          firstElement.turn();
          secondElement.turn();
        }
      }
    }
  }
}

void keyPressed() {
  // Handles key presses during the final Casey Reas style stage

  if (stage == 11) {
    // Adjust minimum distance between adjacent elements needed to draw a line
    if (keyCode == LEFT) {
      minLineDistance = constrain(--minLineDistance, 0, width/2);
      background(0);
    }
    if (keyCode == RIGHT) {
      minLineDistance = constrain(++minLineDistance, 0, width/2);
      background(0);
    }
  }
}

/*  A Casey Reas style moving element
 
 It is basically circular and continues in a straight line until it
 encounters the edge of the screen or another element.
 
 Methods are avaiable to move the element and to determine if an
 element is within drawing distance of another (specified) element
 (said method draw a line if this is so) and intersects with another
 (specified) element.
 
 A turn method is also present to allow the element to be turned if
 necessary (ie it is intersecting another element)
 */

class Element {
  float x;
  float y;
  float eRadius;
  float speed;
  float direction;
  float omega;

  // Constructor - randomise everything except position
  Element(float x_, float y_) {
    x = x_;
    y = y_;
    eRadius = randomGaussian()+20;
    speed = random(0.1, 0.3);
    omega = randomGaussian() * 0.3;
    direction = random(-PI, PI);
  }

  // Moves element in a straight line unless it encounters the edge of
  // the screen at which point it spins until it finds a direction which
  // takes it away from the wall
  void move() {
    if (x+speed * sin(direction) <= eRadius ||
      x+speed * sin(direction) >= width - eRadius ||
      y+speed * cos(direction) <= eRadius ||
      y+speed * cos(direction) >= height - eRadius) {
      turn();
    } else {
      x += speed * sin(direction);
      y += speed * cos(direction);
    }
  }

  // Determines if element is within line drawing distance of another (specified)
  // element in which case it draws a line whose colour is determined by the
  // distance
  boolean isNear(Element other, float lineDistance) {
    float distance = dist(x, y, other.x, other.y) - (eRadius + other.eRadius);
    if (distance <= lineDistance) {
      noFill();
      stroke((lineDistance - distance) / lineDistance * 255);
      line(x, y, other.x, other.y);
      return true;
    } else {
      return false;
    }
  }

  // Determines if an element is intersecting another (specified) element
  boolean intersects(Element other) {
    float distance = dist(x, y, other.x, other.y) - (eRadius + other.eRadius);
    return distance <= 0;
  }

  // Allows the element to be spun without needing to know the spin mechanism
  void turn() {
    direction += omega;
  }
}

/*  Class for a single leaf
 
 It is envisioned as being on a z plane which determines a scaling factor
 both its size and its fall rate and also determines how far down the screen
 it has to fall before "settling" on the ground
 
 Note - Largely based on the Snowflake class.
 
 It has a age which affects it colour
 */

class Leaf {
  float x;
  float y;
  float z;
  float angle;
  float omega;
  float fSize;
  int age;
  int death;
  boolean settled;
  float dy;
  float dx;

  // Constructor - everything except the settled flag is randomised.
  // It is initially assumed not to have settled.
  // Note - it is initially positioned part way up the sky in order
  // to guarentee that it has not reached the ground.
  Leaf() {
    x = random(width);
    y = random(height/2);
    z = random(height/8);
    fSize = 1+(randomGaussian()+30) * ((height/4-z)/(height/4))* ((height/4-z)/(height/4));
    dx = random(-0.1, 0.1);
    dy = fSize * random(0.1, 0.125);
    death = (int)random(50, 100);
    age = (int)random(death);
    angle = random(360);
    omega = random(-10, 10);
    settled = false;
  }

  // Makes the leaf fall, if it has fallen far enough to have
  // reached the ground (determined by the z plane value) it changes
  // to a settled leaf after which it doesn't move.
  // Calls display to draw it in the current position / settled state
  boolean move() {
    if (!settled) {
      x += dx;
      y += dy;
      angle += omega;
      if (y >= height - 2*z) settled = true;
    }
    age = constrain(++age, 0, death);
    display();
    return settled;
  }

  // Display the leaf as a flattened ellipse
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));

    noStroke();
    fill(192 + float(death-age)/death * 63.0, float(death-age)/death * 255.0, float(death-age)/death * 128.0);
    ellipse(0, 0, fSize, fSize/10);
    popMatrix();
  }
}

/*  Class for a single moving character, the character has a start position and an
 end position, and a time (in frames) in which to move from the former to the
 latter
 */

class MovingLetter {
  float start_x;
  float start_y;
  float end_x;
  float end_y;
  int duration;
  int moveStage;
  char letter;

  // Constructor - everything has to be specified except the moveStage counter
  // which is initialised to zero. character is displayed in its starting
  // position as soon as it is created
  MovingLetter(char letter_, float x0, float y0, float x1, float y1, int duration_) {
    start_x = x0;
    start_y = y0;
    end_x = x1;
    end_y = y1;
    duration = duration_;
    letter = letter_;
    moveStage = 0;

    display();
  }

  // Simply updates the moveStage counter of the character and calls display to
  // show it in the appropriate position for the current moveStage
  boolean move() {
    moveStage = constrain(++moveStage, 0, duration);
    display();
    return moveStage == duration;
  }

  // Displays the character in the appropriate x and y position as determined by
  // moveStage ie moveStage/duration of the journey between the start and end
  // positions. In the early stages it is displayed in red but later transitions
  // to white.
  void display() {
    fill(255, (float)moveStage/duration * 255, (float)moveStage/duration * 255);
    float x = map(moveStage, 0, duration, start_x, end_x);
    float y = map(moveStage, 0, duration, start_y, end_y);
    text(letter, x, y);
  }
}

/*  Class for a single snowflake
 
 It is envisioned as being on a z plane which determines a scaling factor
 both its size and its fall rate and also determines how far down the screen
 it has to fall before "settling" on the ground
 
 While falling it is shown as a star/asterix, but when settled it is depicted
 as a flattened ellipse
 */

class Snowflake {
  float x;
  float y;
  float z;
  float fSize;
  boolean settled;
  float dy;
  float dx;

  // Constructor - everything except the settled flag is randomised.
  // It is initially assumed not to have settled.
  // Note - it is initially positioned part way up the sky in order
  // to guarentee that it has not reached the ground.
  Snowflake() {
    x = random(width);
    y = random(height/2);
    z = random(height/8);
    fSize = 1+(randomGaussian()+10) * ((height/4-z)/(height/4));
    dx = random(-0.1, 0.1);
    dy = fSize * random(0.1, 0.125);
    settled = false;
  }

  // Makes the snowflake fall, if it has fallen far enough to have
  // reached the ground (determined by the z plane value) it changes
  // to a settled snowflake.
  // Calls display to draw it in the current position / settled state
  boolean move() {
    if (!settled) {
      x += dx;
      y += dy;
      if (y >= height - 2*z) settled = true;
    }
    display();
    return settled;
  }

  // Display the snowflake as a six point star if it is in the air
  // otherwise as a flattened ellipse
  void display() {
    if (settled) {
      noStroke();
      fill(255, 64 + ((height/4-z) / (height/4)) * 64);
      ellipse (x, y, 2*fSize, fSize/4);
    } else {
      noFill();
      stroke(255, 48 + ((height/4-z) / (height/4)) * 64);
      line(x, y-fSize, x, y+fSize);
      line(x-fSize*sin(PI/3), y-fSize/2, x+fSize*sin(PI/3), y+fSize/2);
      line(x+fSize*sin(PI/3), y-fSize/2, x-fSize*sin(PI/3), y+fSize/2);
    }
  }
}

/* Class for a sunbeam object
 
 Originally conceived as a wriggling wave growing in size as it moves
 away from its origin. As sunbeam ages, it changes colour.
 */

class Sunbeam {
  float originX;
  float originY;
  float angle;
  int age;
  float scaling;
  float waveLength;

  // Constructor - the origin has to be specified, everything else
  // is randomised
  Sunbeam(float x_, float y_) {
    originX = x_;
    originY = y_;
    angle = random(360);
    age = (int)random(1000);
    scaling = random (0.1, 0.5);
    waveLength = random (33, 50);

    display();
  }

  // Simply updates the age. Returns true is the sunbeam has reached
  // the end of its lifespan or it has moved off the screen
  boolean move() {
    age++;
    display();
    return age == 750 || scaling*age > width;
  }

  // Draws the sunbeam scaling and colouring it according to its
  // age and also applying a "wriggle".
  // Note - scaling is unrealistic being linear instead of exponential
  // Also "wriggle" is actually a rotation about the origin due to poor
  // implementation.
  void display() {
    float x = sin(degrees(age/waveLength));
    float y = cos(degrees(age/waveLength));

    pushMatrix();
    translate(originX, originY);
    rotate(angle);
    scale(scaling*age, scaling*age);
    noStroke();
    fill(255, age%255, 0, 80*(1000-age)/1000);
    ellipse(x, y, 0.1, 0.033);
    popMatrix();
  }
}



