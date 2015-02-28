

/**
 * UNBSD  ad_template (.pde) (Processing) for Online Advertising/Promotions
 * DEMONSTRATION APPLET  2010 UNBSD
 *
 * Processing Features (See www.processing.org):
 * 
 * Set colors by reading html page colors; dynamic deployment.
 * Can track clicks, referrers, platform & IP (via javascript); requires external server
 * Only requires java support; runs on most servers w/o configuration.
 * Interactive content to capture and maintain viewers
 * Accepts text entry, E.G. "Enter e-mail to join mailing list . . "
 * Dynamic content; update images and text from web pages or config files
 * Slide Shows, Optical Illusions, Scrolling Text, Photographs. 
 * Deploy as javascript .js, applet .jar, and executables .exe, etc.
 * Music, .mp3, wav, minim, music visualization.
 * Update text content from remote location. 
 *
 * ad_template features:
 *
 * random preset colors, random & 3d positioning, 3d text, fonts, collision, gravity, background changes, & mouseclick opens has beans website in same window.
 * 
 * This script contains the following elements:  bouncing balls, animated backgrounds, flashing text in random locations, exploding image, static text that changes colors, static text that waves/moves gently, tunnel/rotating texture effect, scene changes, image fades and swaps, cursor controlled sprite.
 * To do:  enter e-mail for list subscription; show 'open', 'closed' and time to openning and closing based on 'store hours'; set colors based on page background; read text elements and variables from configuration file; game code, e.g. shoot/spray people passing by or appearing in windows.
 * 
 * Thanks to Zach Lieberman (Kinetic Type); James Patterson (Sprite); Keith Peters (Bouncy Bubbles), Daniel Shiffman (Explode).
 */

Line ln;
Line lns[];

PFont font; //command for  font class
PImage a1;// command for image class which I have named a1
PImage a2;//second command for image class which I have called a2
PImage a3; // background for stage 1
PImage logo; // the main recognizable logo appearing in stage 1, explodes

PImage floatimage;   // floating image, photographic/image element
int floatChance = 50;  // chance of displaying floatimage
boolean floatOn;

PImage squid;  // cursor controlled sprite element
int a;
float xpos;
float ypos;
float drag = 30.0;

int x = 50;  // text x position offsett value

// text and element colors, add/remove allowed colors to fColors list
int fColors[] = {#F0E50F,#0FF251,#A2B5F7,#FC1C08,#03FFF9,#EB18F0,#D6FFD7,#FF920D,#6F4108,#433428};
int color1;// = 0;
int color2;// = 1;
int color3;
int colorBalls;// = 2;
int colorText;

boolean call = true;
boolean call_bktext = true;

int counter = 0;  // timeline controls, counter, tTic's
int tTocks = 3; // activation time for tunnel (total tics)
int tTic = 0;
int tDur = 1; // in tTic's
int Stage; // scene number
int StageTime; // default amount of time, in tTics to display each scene

boolean BubbleOn;  // floating balls toggle
int BubChance = 72; // percent chance of floating balls
int bkChance = 12; // percent chance of background random text
boolean bkTextOn;  // background text toggle

// intermediate waving/moving text
String words[] = {"Has Beans Coffeehouse", "917 2nd Street", "Eureka, California",
  "", "","", "Internet Cafe","Escape the Urban Error."
  }; 

int xt, yt, radius, l;

PGraphics tunnelEffect;
PImage textureImg;

// build lookup table
int[][] distanceTable;
int[][] angleTable;
int[][] shadeTable;
int w, h;

int numBalls = 4;
float spring = 0.05;
float gravity = -0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

boolean ExplodeOn;  // toggle for explosion effect
//int steps;
int cellsize = 2;
int columns, rows;

float Aalpha = 90;
float Balpha = 160;
float Calpha = 210;
float Dalpha = 240;
float Zalpha = 255;

void setup() //this is the setup of your program
{

  size(200,200, P3D);// this is the size of my window

  // Array of line objects for intermediate waving/moving text
  lns = new Line[8];
  
  // background images 
  a1 = loadImage("bkgrnd_200x200.png");//this is the image to be loaded from the sketch
  a2 = loadImage("bkgrnd_200x200_B.png"); // this is the image the other image
  a3 = loadImage("space_1.png");
  
  floatimage = loadImage("has_beans_front.png"); // floating image that displays occassional in stage 2
  
  squid = loadImage("squid64.png"); // cursor controlled sprite set up
  xpos = (width/2);
  ypos = (height/2);
  
  logo = loadImage("has_bean.png"); // exploding 'logo' & exploding logo setup
  columns = logo.width / cellsize;
  rows = logo.height / cellsize;
  ExplodeOn=false;
//  steps = 0;

  frameRate(30);

  font = loadFont ("Monospaced.bold-48.vlw"); // font used
  textFont (font, 12);

  color1=0; // initial color scheme, values = index locations in fColors list (above)
  color2=1;
  color3=2;
  
  BubbleOn = false;  // initialization of various toggles
  bkTextOn = false;
  Stage =1;  // starting stage
  StageTime = 5; // default time for each stage/scene
  
  for(int i = 0; i < 8; i++) {  // set up for the waving/moving text
    // For every line in the array, create a Line object to animate
    // i * 70 is the spacing
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
   }
    
  stroke(color2);  // set up for the moving balls
  //smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(10, 30), i, balls);
  }
  noStroke();
  
  // tunnel effect
  textureImg = loadImage("xaos_face_mod1.png"); // texture for tunnel effect
  textureImg.loadPixels();
  // Create buffer screen
  tunnelEffect = createGraphics(320, 200, P2D);
  w = tunnelEffect.width;
  h = tunnelEffect.height;

  float ratio = 32.0;
  int angle;
  int depth;
  int shade = 0;

  // tunnel effect set up (continued)
  // Make the tables twice as big as the screen. 
  // The center of the buffers is now the position (w,h).
  distanceTable= new int[2 * w][2 * h];
  angleTable= new int[2 * w][2 * h];

  for (int xt = 0; xt < w*2; xt++)
  {
    for (int yt = 0; yt < h*2; yt++)
    {
      depth = int(ratio * textureImg.height 
                  / sqrt(float((xt - w) * (xt - w) + (yt - h) * (yt - h)))) ;
      angle = int(0.5 * textureImg.width * atan2(float(yt - h), 
                  float(xt - w)) / PI) ;
      // The distance table contains for every pixel of the 
      // screen, the inverse of the distance to the center of 
      // the screen this pixel has.
      distanceTable[xt][yt] = depth ;
      // The angle table contains the angle of every pixel of the screen, 
      // where the center of the screen represents the origin.
      angleTable[xt][yt] = angle ;
    }
  }    
}

void draw()  
{
  //println(str(millis())+ " millis:framecount " + str(frameCount) + " :counter " + str(counter));
  if (Stage == 2) {  // everything in this stage is part/scene 2

    if (counter >= 100) {  // if the counter is below 100, display background 1 
    background (a1);
    gravity = -0.03;  // negative (falling) gravity for floating balls
    } else { 
    background(a2);  // if the counter is not below 100, display background 2
    gravity = + 0.03; // pusing/rising gravity for floating balls
    };
    if (counter == 200 ) { 
    counter = 0;
    tTic++;
    
    int rndChance = int(random(100)); // random elements (controlled with rndChance variables)
    if (rndChance <= BubChance ) { BubbleOn = true;} else { BubbleOn = false; };
    rndChance = int(random(100));
    if (rndChance <= bkChance ) { bkTextOn = true;} else { bkTextOn = false; };
    rndChance = int(random(100));
    if (rndChance <= floatChance ) { floatOn = true;} else { floatOn = false; };
    
    // println("STAGE 2 counter == 200; tTic = " + str(tTic));
    // uncomment the above line for diagnostics, outputs timeline info
      if (tTic >= StageTime){  // StageTime or number of tics you want stage to last 
        tTic = 0;
        counter =0;
        Stage = 1;
       }
    }
  
  if (tTic >= tTocks )
  {
    tunnelEffect.beginDraw();
    tunnelEffect.loadPixels();

    float timeDisplacement = millis() / 1000.0;
  
    // Calculate the shift values out of the time value
    int shiftX = int(textureImg.width * .2 * timeDisplacement+300); // speed of zoom
    int shiftY = int(textureImg.height * .15 * timeDisplacement+300); //speed of spin
    // Calculate the look values out of the time value
    // by using sine functions, it'll alternate between 
    // looking left/right and up/down
    int shiftLookX = w / 2 + int(w / 4 * sin(timeDisplacement));
    int shiftLookY = h / 2 + int(h / 4 * sin(timeDisplacement * 1.5));
    for (int yt = 0; yt < h; yt++)  {
      for (int xt = 0; xt < w; xt++)      {
        // Make sure that x + shiftLookX never goes outside 
        // the dimensions of the table
        int texture_x = constrain((distanceTable[xt + shiftLookX][yt + shiftLookY] 
                                   + shiftX) % textureImg.width ,0, textureImg.width);
        
        int texture_y = (angleTable[xt + shiftLookX][yt + shiftLookY] 
                         + shiftY) % textureImg.height;
        
        tunnelEffect.pixels[xt+yt*w] = textureImg.pixels[texture_y 
                           * textureImg.width + texture_x]; 
        // Test lookuptables
        // tunnelEffect.pixels[xt+yt*w] = color( 0,texture_x,texture_y);
      }
    }
    tunnelEffect.updatePixels();
    tunnelEffect.endDraw();
    image(tunnelEffect, 0, 0, width, height);
    //tint(255,255);
    //noFill();
    
    // only display image if toggle is on
    if (floatOn == true) {image(floatimage, 0,0, width, height);};  
    };
  
  // set random colors from fColor list at various times
  if ( counter == 60 || counter == 120 || counter == 180 ) {
    call = true;
        
      color1 = int(random(fColors.length));     
      color2 = int(random(fColors.length)); 
      color3 = int(random(fColors.length));
      colorBalls = int(random(fColors.length));
      colorText = int(random(fColors.length));
  }
     
  counter++;  // super important, advances timer each loop through

  if ( BubbleOn){  // draw floating bubbles if toggled on
    BubbleOn = true;
    fill(fColors[colorText]);
    fill(fColors[colorBalls],150);
    for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
    };
  }  

  if ( bkTextOn ){         // draw random words (change words here)
    bkTextOn = true;
      fill(fColors[colorText]);
      textFont (font, 16);
      text("Coffee", random(height), random(height));   
      text("Caffene", random(width),random(height));  
      text("Tea", random(width),random(height));  
      text("Bakery", random(height), random(height));
      text("Deli", random(height), random(height)); 
      text("Happy", random(width),random(height));  
      text("Chocolate", random(height), random(height)); 

    };
  
  // draw cursor controlled sprite
  float difx = mouseX - xpos-squid.width/2;
  if(abs(difx) > 1.0) {
  xpos = xpos + difx/drag;
  xpos = constrain(xpos, 0, width-squid.width);
  }
  float dify = mouseY - ypos-squid.height/2;
  if(abs(dify) > 1.0) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-squid.height);
  } 
  image(squid, xpos, ypos);
  
  textFont (font, 29);  // draw static text
  fill(fColors[color2]);
  text("Has Beans", x-25, 29);
  
  textFont (font, 29);  // repeating text with slightly larger values and offset creates simple 3d text effect
  fill(fColors[color1]);
  text("Has Beans", x-24, 30);

  textFont (font, 24);
  fill(fColors[color2]);
  text("Coffeehouse", x-30, 109);
  
  textFont (font, 24);
  fill(fColors[color3]);
  text("Coffeehouse", x-29, 110);
  
  textFont (font, 20);
  fill(fColors[color3]);
  text("Old Town Eureka", x-40, 134);
  
  stroke(0,255);   // draw a black border around the screen
  strokeWeight(10);
  fill(0,10);
  rectMode(CORNER);
  rect(0,0,width,height);
  noStroke();

  fill(0);   // this section draws the waving/moving text
  translate(-240, -100, -450);
  rotateY(0.3);
  textFont (font, .8);
  // Now animate every line object & draw it...
  for(int i = 0; i < 8; i++) {
    float f1 = sin((i + 1.0) * (millis() / 10000.0) * TWO_PI);
    float f2 = sin((8.0 - i) * (millis() / 10000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.005 * f2);
      pushMatrix();
      scale(75.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
  }
  
  if (Stage ==1){
    
    if (counter >= 100) {   // counter less than 100 isn't needed in this stage
    } else { 
    };
    if (counter >= 200 ) { 
      counter = 0;
      tTic++;
   
    //println("STAGE 1 counter == 200; tTic = " + str(tTic));
    // uncomment above for timeline diagnostics
    
    if (tTic >= (StageTime-3) ){     
      tTic = 0;
      counter =0;
      ExplodeOn=false;
      Stage = 2;
    }
   }

    background(0); // start with a black background for stage 1
      
      if (ExplodeOn == true && counter >= 90) {        
        //tint(255,255);  // use tint to change background hue and alpha (255,255 are defaults)
        image(a3, 0,0, width, height);  // drop in image background after 90 secs (after explosion effect starts)
       };

      if ( counter >= 181 && ExplodeOn == true) {  // after [time], fade background a bit
        tint(255,30);
        image(a2,0,0,width, height);
        tint(255,255);
        Zalpha = 240;
      }
      
        if ( counter >= 184 && ExplodeOn == true) {  // after [time] fade background & add another image to fade in
        tint(255,Dalpha);
        image(a3, 0,0, width, height);
        tint(255,Aalpha);
        image(a2,0,0,width, height);
        tint(255,255);
        Zalpha = 210;
      }
      
        if ( counter >= 187 && ExplodeOn == true) {
        tint(255,Calpha);
        image(a3, 0,0, width, height);
        tint(255,Balpha);
        image(a2,0,0,width, height);
        tint(255,255);
        Zalpha = 130;
      }
      
        if ( counter >= 190 && ExplodeOn == true) {
        tint(255,Balpha);
        image(a3, 0,0, width, height);
        tint(255,Calpha);
        image(a2,0,0,width, height);
        tint(255,255);
      }
      
        if ( counter >= 193 && ExplodeOn == true) {
        tint(255,Aalpha);
        image(a3, 0,0, width, height);        
        tint(255,Dalpha);
        image(a2,0,0,width, height);
        tint(255,255);
      }
      
        if ( counter > 196 && ExplodeOn == true) {
        tint(255,255);
        image(a2,0,0,width, height); // when original background fades a lot, put new background on top
        tint(255,0);
        image(a3, 0,0, width, height);        
        tint(255,255);
        Zalpha = 0;
      }
        stroke(0,255);  // draw same black border used in scene/stage 1
        strokeWeight(10);
        fill(0,10);
        rectMode(CORNER);
        rect(0,0,width,height);
        noStroke();

      // before the explosion starts, display the logo statically for a while
      if ( counter <= 199 && ExplodeOn == false ) {image(logo, 37, 37, 127, 127);};
   
      if ( tTic == 1 && ExplodeOn == false ) {ExplodeOn = true;counter=0;background(0);;Zalpha=255;};// else {image(logo, 0, 0, width, height);};
      // turn on explosion effect, make alpha for explosion is off (doesn't work great with some transparencies)
      // try other alpha values to see if it works with a particular logo
      
    if (ExplodeOn) {  // the explosion effect
      call = true;
      // println(str(counter));
      for ( int i = 0; i < columns; i++) {
        // Begin loop for rows
        for ( int j = 0; j < rows; j++) {
          int x = i*cellsize + cellsize/2;  // x position
          int y = j*cellsize + cellsize/2;  // y position
          int loc = x + y*logo.width;  // Pixel array location
          color c = logo.pixels[loc];  // Grab the color
          // Calculate a z position as a function of mouseX and pixel brightness
          float z = ((counter*4) / float(width)) * brightness(logo.pixels[loc]) - 100.0;
          // Translate to the location, set fill and stroke, and draw the rect
          pushMatrix();
          translate(x + 0, y + 0, z - 0);
          fill(c, Zalpha);
          noStroke();
          rectMode(CORNER);
          rect(0, 0, cellsize, cellsize);
          popMatrix();
        }
      }
    }
    
  counter = counter +1; // IMPORTANT!  INCREMENT THE TIMER!
  if (counter == 255) {ExplodeOn=false;}; // reduce below 200 to shorten explosion effect
  };
  
}

void mousePressed()  // this is a command which activates when the mouse is pressed
{
  // uncomment the below for some mouse effects, e.g. opening links, etc.
  //ExplodeOn=true;
  //counter = 0;
  //noLoop();// this is telling the program to stop looping when the mouse is pressed
  //link("http://www.hasbeans.com/");// "_new");
}

void keyPressed(){  //this is a command which activates when a key is pressed
  // uncomment below (there's nothing there now) for keypress effects, events, etc.
}


class Letter
{
  char myChar;
  float x;
  float y;

  Letter(char c, float f, float f1)
  {
    myChar = c;
    x = f;
    y = f1;
  }
}

//  following are class definitions of the follow elements:  waving/moving intermediate text, floating balls

class Line
{
  String myString;
  int xPosition;
  int yPosition;
  int highlightNum;
  float speed;
  float curlInX;
  Letter myLetters[];

  Line(String s, int i, int j) 
  {
    myString = s;
    xPosition = i;
    yPosition = j;
    myLetters = new Letter[s.length()];
    float f1 = 0.0;
    for(int k = 0; k < s.length(); k++)
    {
      char c = s.charAt(k);
      f1 += textWidth(c);
      Letter letter = new Letter(c, f1, 0.0);
      myLetters[k] = letter;
    }
    curlInX = 0.1;
  }
}

class Word
{
  String myName;
  int x;

  Word(String s)
  {
    myName = s;
  }
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    //fill(255, 204);
    ellipse(x, y, diameter, diameter);
  }
}

