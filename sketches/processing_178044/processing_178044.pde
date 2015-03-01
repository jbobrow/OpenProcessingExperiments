

/*
 * Project 3 - Welcome to Earth!
 *
 * That's is the theme of this project - Welcome to Earth! I created a short
 * movie in processing that plays for 1-2 minutes and then repeats. My
 * intention is to convey a light, friendly mood while at the same time
 * give some hint of the diversity among us Earthlings. 'Welcome' is stated
 * in thirteen different languages, which is just a small sample of the many
 * languages spoken on earth. Some of the languages are widely used while
 * others are spoken by very few. Showing multiply ways of expressing welcome
 * shows our many cultures, histories, and perspectives.
 *
 * The movie has four segments.
 *
 * Part 1: Introduction - The background and earth images fade in with a large
 * English "Welcome!" on the screen. The welcome shrinks into the earth.
 *
 * Part 2: Welcomes - Welcome in twelve different languages emerge from the earth
 * in sequence. Each one grows, blinks, shrink to normal size, and then toddles
 * off to a place next to the globe.
 *
 * Part 3: Stars - Little twinkling stars erupt at random locations around the earth.
 *
 * Part 4: End - The screen fades to black. The message "Welcome to Earth!" is
 * displayed. Also "again..." is displayed indicating that the movie is about to
 * replay, which it does.
 *
 * Keyboard input is accepted for the following commands:
 *
 *   'n' and 'N' - move to the next part of the movie
 *   'p' and 'P' - pause or unpause the movie
 *   'r' and 'R' - restart the movie
 *   's' and 'S' - save the current frame to "welcome-####.png" where "####" is
 *                 the frame number
 *
 * Enjoy!
 */

// constants used for counters in each state
int MAX_LANGUAGES = 12;
int MAX_GROW = 330;
int MAX_BLINK = 2;
int MAX_SHRINK = 330;
int MAX_STARS = 255;
int MAX_FADE_IN = 255;
int MAX_FADE_OUT = 255;

// images including the background, earth, and 'welcome' in 13 languages
PImage background;
PImage globe;
PImage[] welcome;

// record of user toggled pause
boolean pause = false;

// dimensions of the language images
int mSizeX = 256;
int mSizeY = 128;
int mCenterX = 128;
int mCenterY = 64;

// center of the screen
int mScreenX = 512;
int mScreenY = 256;

// counters for managing the states of the movie
int language;
float grow;
float shrink;
int blink;
float tilt;
float moveX;    // start at the center of the screen
float moveY;
int stars;
int fadeIn;
int fadeOut;

// coordinates of the resting place for each language; the is order clockwise
//   around the screen; some locations are tweeked a bit to round the corners
int[] mHomeX = { mCenterX+20, mCenterX+mSizeX, mCenterX+mSizeX*2,
                 mCenterX+mSizeX*3-20, mCenterX+mSizeX*3, mCenterX+mSizeX*3,
                 mCenterX+mSizeX*3-20, mCenterX+mSizeX*2, mCenterX+mSizeX,
                 mCenterX+20, mCenterX, mCenterX };
int[] mHomeY = { mCenterY+40, mCenterY, mCenterY,
                 mCenterY+40, mCenterY+mSizeY+15, mCenterY+mSizeY*2-15,
                 mCenterY+mSizeY*3-40, mCenterY+mSizeY*3, mCenterY+mSizeY*3,
                 mCenterY+mSizeY*3-40, mCenterY+mSizeY*2-15, mCenterY+mSizeY+15 };

void setup()
{
  size(1024,512);
  frameRate(30);
  
  background = loadImage("marble.png");
  globe = loadImage("globe.png");

  welcome = new PImage[13];
  welcome[0] = loadImage("wFrench.png");
  welcome[1] = loadImage("wArabic.png");
  welcome[2] = loadImage("wYoruba.png");
  welcome[3] = loadImage("wGerman.png");
  welcome[4] = loadImage("wChinese.png");
  welcome[5] = loadImage("wCherokee.png");
  welcome[6] = loadImage("wSpanish.png");
  welcome[7] = loadImage("wJapanese.png");
  welcome[8] = loadImage("wPortuguese.png");
  welcome[9] = loadImage("wHebrew.png");
  welcome[10] = loadImage("wHausa.png");
  welcome[11] = loadImage("wHindi.png");
  welcome[12] = loadImage("wEnglish.png");
  
  restart();
  smooth();
}

void draw()
{
  if (pause)
    return;
    
  imageMode(CENTER);
  
  if (fadeIn < MAX_FADE_IN) {
    drawBase();
    drawFadeIn();
  }
  else if (language < MAX_LANGUAGES) {  
    drawBase();
    drawEmergingWelcome();
  } 
  else if (stars < MAX_STARS) {
    if (stars == 0)
      drawBase();
    drawStar();
    drawGlobe();
    drawWelcomes();
  }
  else if (fadeOut < MAX_FADE_OUT) {
    drawFadeOut();
  }
  else {
    restart();
  }
}

// draw the background, globe, and all welcomes that have emerged
void drawBase()
{
  image(background, mScreenX, mScreenY, width, height);
  drawGlobe();
  drawWelcomes();
}

// draw the globe
void drawGlobe()
{
  image(globe, mScreenX, mScreenY, mSizeX*2.3, mSizeY*2.3);
}  

// draw all of the welcomes that have emerged
void drawWelcomes()
{
  for (int i=0; i<language; i++)
    image(welcome[i], mHomeX[i], mHomeY[i], mSizeX, mSizeY);
}

// initialize the variables associated with an emerging welcome
void initializeEmergingWelcome()
{
  grow = 0.05;
  blink = 0;
  shrink = 0.0;
  moveX = mScreenX;
  moveY = mScreenY;
  tilt = 0.0;
}

// draw one emerging welcome and then prepare for the next one
void drawEmergingWelcome()
{
  // increase the size of the welcome
  if (grow < 2.5)
  {
    image(welcome[language], mScreenX, mScreenY, mSizeX*grow, mSizeY*grow);
    grow += 0.05;
  }
  // blink the welcome while it is large
  else if (blink < MAX_BLINK)
  {
    welcome[language].filter(INVERT);
    image(welcome[language], mScreenX, mScreenY, mSizeX*grow, mSizeY*grow);
    blink += 1;
  }
  // decrease the size of the welcome to normal size
  else if (shrink < 1.5)
  {
    image(welcome[language], mScreenX, mScreenY,
          mSizeX*(2.5-shrink), mSizeY*(2.5-shrink));
    shrink += 0.05;
  }
  // move welcome from the center of the screen to its place beside the globe;
  //  tip back and forth as it moves
  else if (abs(mHomeX[language] - moveX) > 20)
  {
    moveX += (mHomeX[language] - mScreenX) / 30.0;
    moveY += (mHomeY[language] - mScreenY) / 30.0;

    pushMatrix();
    translate(moveX,moveY);
    rotate(tilt);
    image(welcome[language], 0, 0, mSizeX, mSizeY);
    popMatrix();

    if (tilt == 0) tilt = -0.1;
    else if (tilt == -0.1) tilt = 0.01;
    else if (tilt == 0.01) tilt = 0.1;
    else tilt = 0.0;
  }
  // prepare for the next welcome
  else
  {
    language++;
    initializeEmergingWelcome();
  }
}

// draw little twinkling stars and dots at random locations around the screen,
//  skipping (most of) the area under the globe
void drawStar()
{
  float x = random(10,width-10);
  float y = random(10,height-10);
  if ((x > mSizeX && x < mSizeX*3) && (y > mSizeY && y < mSizeY*3))
    return;
      
  pushMatrix();
  translate(x,y);
  for (int i=0; i<10; i++)
  {
    stroke(255);
    line(0, 0, 0+random(-20,20), 0+random(-20,20));
    point(random(-30,30), random(-30,30));
    point(random(-30,30), random(-30,30)); 
    point(random(-30,30), random(-30,30)); 
  }
  popMatrix();

  stars++;
}

// inital screen - fade in from black gradually showing the background, globe, and
//   a large english welcome. The welcome shrinks into the center of the globe.
void drawFadeIn()
{
  image(welcome[12], mScreenX, mSizeX,
        mSizeX*4-(fadeIn*3.5), mSizeY*4-(fadeIn*2));

  // draw a decreasingly transparent black rectangle to the screen
  if (fadeIn < MAX_FADE_IN/3) {
    fill(0, 255-(fadeIn*3));
    rect(0, 0, width, height);
  }
  
  fadeIn++;
}

// final screen - cover the screen with an increasing opaque black rectangle, display
//   the welcome message and an indication that the movie will start again...
void drawFadeOut()
{
  // draw an increasingly opaque rectangle to the screen
  fill(0, fadeOut/4);
  rect(-1, -1, width+1, height+1);

  textSize(32);
  textAlign(CENTER);
  fill(fadeOut-75);

  if (fadeOut > 75)
    text("Welcome to Earth!", width/2, height/2);
  if (fadeOut > 150) {
    textSize(26);
    text("again...", width-120, height-50);
  }
  
  fadeOut++;
}

// restart the movie by initializing all of the state variables
void restart()
{
    fadeIn = 0;
    language = 0;
    initializeEmergingWelcome();
    stars = 0;
    fadeOut = 0;
}

// process input keys from the user
void keyPressed()
{
  switch (key)
  {
  // jump to the next segment of the movie
  case 'n': case 'N':
    if (fadeIn < MAX_FADE_IN) {
      fadeIn = MAX_FADE_IN;
    } else if (language < MAX_LANGUAGES) {
      language = MAX_LANGUAGES;
      initializeEmergingWelcome();
    } else if (stars < MAX_STARS) {
      stars = MAX_STARS;
    } else if (fadeOut < MAX_FADE_OUT) {
      fadeOut = MAX_FADE_OUT;
    }
    break;
    
  // toggle pause of the movie
  case 'p': case 'P':
    pause = !pause;
    break;
    
  // restart the movie
  case 'r': case 'R':
    restart();
    break;
    
  // save the current screen image
  case 's': case 'S':
    saveFrame("welcome-#####.png");
    break;    
  }
}



