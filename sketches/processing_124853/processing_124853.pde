

// MonsterDraw v1.0!

// Import Minim to use audio
import ddf.minim.*; 


// Variables that will recive function calls:

int screenColorHandler = 0; // These four ints check for a change in the value
int screenClearHandler = 0; // From the default, letting you treat an int return
int soundToggleHandler = 0; // Pretty much as a bool by looking for a value change.
int screenShotHandler = 0;

// Raw variables
int output = 1; // draw tool selector
int modeToggle = 1; // HSB assoication mode selector
color screenColor = 400; // Background color settings


// constraint stuff for resizing draw area... these names aren't the best and are legacy to an
// older mockup. Think of border as X-border and bottomBorder as Y-border.
int border, bottomBorder;

// for drawing plain black/white line - I just made this esentally a 2 state enumeration with
// a bool so that the stroke settings for other things weren't messed with by going into
// black/white pen mode.
boolean colorless = false;

// Tracks what image should be used for the camera eye
boolean photoTaken = false; // this lets the counter for the flash button turn on/off
int counter = 0; // the counter for the flash button.

// master control for the sound.
boolean soundOn = true;

// GUI frame variable
PImage frame;

// Declaring the class variables for buttons I made. Please note that class names
// should properly be cammelcased with the first leter of both the first and following
// words in caps as below.

// Rectangle buttons:
RectButton backgroundButton; // deals with next background color.
RectButton clearButton; // Deals with clearing the screen.
RectButton colorButton; // Changes the HSB assoication.
RectButton brushButton; // Changes the brush being used.

// Circle Buttons:
CircleButton exitButton; // to exit() app.
CircleButton soundButton; // turns sound on and off. 
CircleButton screenShotButton; // takes a screen shot.
CircleButton screenShotTaken;

// declare a Minim variable.
Minim minim;

// Use an audio player for the intro sound it plays when it starts up.
AudioPlayer startUp;

void setup() 
{
  // Android orientation lock.
  orientation(LANDSCAPE);
  
  // All the basic setup stuff.
  size(1280,720);
  colorMode(HSB, 400);
  background(screenColor);
  
  //Center all the modes. I still feel this should be the default.
  imageMode(CENTER);
  rectMode(CENTER); 
  ellipseMode(CENTER); 
  
  // Feel like this should be the default too.
  smooth();
  
  // Constraint variables put them here so that width and height are already defined.
  border = int(width * 0.171875);// makes part of the area not useable
  bottomBorder = (height / 6); // makes more of the area not useable
  
  // get minim up and running.
  minim = new Minim(this);
  
  // load the startup sound
  startUp = minim.loadFile("sounds/OpenSound.wav");
  
  // Load the Gui Frame
  frame = loadImage("MonsterApp2.png");
  
  // Load button objects here.
  // RectButtons:
  // Final Placements: backgroundButton: Done, clearButton: Done, colorButton: Done, brush button: Done
  // varname = new RectButton(X,Y, W, H, Image, frames, Sound)
  backgroundButton = new RectButton((int(width - (width * 0.0859375))), (int(height / 1.463)), (int(width / 12.8)), (int(width / 12.8)), "spritestrips/BackgroundStrip.png", 2, "sounds/BackgroundButtonSound.wav");
  clearButton = new RectButton((int(width - (width * 0.08517))), (int(height / 1.217)), (int(height / 12)), (int(height / 12)), "spritestrips/ClearStrip.png", 2, "sounds/ClearButtonSound.wav");
  colorButton = new RectButton((int(width - (width * 0.0859375))), (int(height * 0.518)), (int(width / 12.8)), (int(width / 12.8)), "spritestrips/ColorStrip.png", 6, "sounds/ColorButtonSound.wav");
  brushButton = new RectButton((int(width - (width * 0.0859375))), (int(height / 2.83)), (int(width / 12.8)), (int(width / 12.8)), "spritestrips/BrushStrip.png", 9, "sounds/BrushButtonSound.wav");
  
  // CircleButtons:
  // Final Placements: exitButton: Done soundButton: Done screenShootButton: Done?
  // varname = new CircleButton(X, Y, R, Image, frames, Sound)
  exitButton = new CircleButton((int(width * 0.05078)), (int(height * 0.9125)),(int(0.0219 * width)), "spritestrips/ExitStrip.png", 2, "sounds/ExitButtonSound.wav");
  soundButton = new CircleButton((int(width / 16)), (int(height / 9)), (int(height / 11.8)), "spritestrips/SoundStrip.png", 2, "sounds/SoundButtonSound.wav");
  screenShotButton = new CircleButton((int(width - (width / 15.8))), (int(height / 9)), (int(height / 11.8)), "spritestrips/CameraStrip.png", 2, "sounds/CameraButtonSound.wav");
  screenShotTaken = new CircleButton((int(width - (width / 15.8))), (int(height / 9)), (int(height / 11.8)), "spritestrips/PhotoTaken.png", 1, "sounds/CameraButtonSound.wav");
  
  // Finish off startup with a nice opening roar! =)
  startUp.play();
}


// class  RectButton
// This class creates a rectangluar button that takes in the cordinates of the button's
// center, the width and height of the button, the name of the button's sprite strip, the number
// of sprites in the sprite strip, and the name of the audio file to play when the button is pressed.
// The button returns an int that is equal to the frame of the sprite strip and updates sprite
// shown, and plays a sound. Presumes that the sprite strip is a single row.

class RectButton
{
  // variable declaration.... is this classed or instanced?
  // button location
  int buttonX, buttonY;
  
  // button size and file slices
  int buttonWidth, buttonHeight, buttonFrames;
  
  // filename for image file
  String imageFile;
  
  // counter for current frame. Starts at frame 0.
  int counter = 0;
  
  // for determination of source image size.
  int frameSize;
  
  // image files
  PImage imageSheet, finalImage;
  
  // Audio file
  AudioSample audioFile;
  
  
  // Constructor
  // params are drawCenter X, drawCenterY, Width, Height, imageFileName, FramesInFile, AudioFileName
  // use is as varname = new RectButton(X,Y, W, H, Image, frames, Sound)
  RectButton (int centerX, int centerY, int disWidth, int disHeight, String iFile, int frames, String aFile)
  { 
    // Assignments
    buttonX = centerX;
    buttonY = centerY;
    buttonWidth = disWidth;
    buttonHeight = disHeight;
    imageFile = iFile;
    buttonFrames = frames -1;
    audioFile = minim.loadSample(aFile);
    
    // Image Construction Goodies:
    // Load Image file for sprite sheet
    imageSheet = loadImage(imageFile);
    
    // figure out real frame number
    frameSize = imageSheet.width / frames;
    
    // defines the size of the sprite 'window' on the file
    finalImage = createImage(buttonWidth, buttonHeight, ARGB);
    
    // syntax .copy(from file, upper left x of frame, uper left y, w of source draw, height of draw, 0, 0, dest x size, dest y size)
    finalImage.copy(imageSheet, frameSize * counter, 0, frameSize, imageSheet.height, 0, 0, buttonWidth, buttonHeight);   
    
  }
  
  
  // <instance>.display() should go in draw, or in a sweeper function or array that goes into draw.
  void display()
  {
    // This just needs to have very little going in here. Most the work is done either in .click() or 
    // in the constructor.
    imageMode(CENTER);
    image(finalImage, buttonX , buttonY);  
  }
  
  // <instance>.click() should go in mousePressed or in a sweeper function or array that goes in mousePressed
  int click()
  {
    // localize to button area.
    if (mouseX > buttonX - (.5 * buttonWidth) && mouseX < buttonX + (.5 * buttonWidth) &&
      mouseY > buttonY - (.5 * buttonHeight) && mouseY < buttonY + (.5 * buttonHeight))
    {
    
      // logic to determine where you are both in the button functions and the sprite sheet.
      if (counter < buttonFrames)
      {
        counter += 1;
      }
      else
      {
        counter = 0;
      }
      
      // updates the image display
      finalImage.copy(imageSheet, (frameSize * counter), 0, frameSize, imageSheet.height, 0, 0, buttonWidth, buttonHeight);
      
      // play the button audio
      if (soundOn)
      {
      audioFile.trigger();
      }
    }
    
  // returns the counter value to the program so it can assoicate it with some goodie or another.
  return counter;
  }
}

// class  CircleButton
// This class creates a circular button that takes in the cordinates of the button's
// center, the width and height of the button, the name of the button's sprite strip, the number
// of sprites in the sprite strip, and the name of the audio file to play when the button is pressed.
// The button returns an int that is equal to the frame of the sprite strip and updates sprite
// shown, and plays a sound. Presumes that the sprite strip is a single row.

class CircleButton
{
  // variable declaration.... is this classed or instanced?
  // button location
  int buttonX, buttonY;
  
  // button size and file slices
  int buttonWidth, buttonHeight, buttonFrames, buttonRadius;
  
  // filename for image
  String imageFile;
  
  // counter for current frame. Starts at frame 0.
  int counter = 0;
  
  // for determination of source image size.
  int frameSize;
  
  // image files
  PImage imageSheet, finalImage;
  
  // Audio file
  AudioSample audioFile;
  
  // Constructor
  // params are drawCenter X, drawCenterY, Radius, imageFileName, FramesInFile, AudioFileName
  // use is as varname = new CircleButton(X, Y, R, Image, frames, Sound)
  CircleButton (int centerX, int centerY, int disRad, String iFile, int frames, String aFile)
  {
    // Assignments
    buttonX = centerX;
    buttonY = centerY;
    buttonRadius = disRad;
    buttonWidth = buttonRadius *2;
    buttonHeight = buttonRadius *2;
    imageFile = iFile;
    buttonFrames = frames -1;
     audioFile = minim.loadSample(aFile);
    
    // Image Construction Goodies:
    // Load Image file for sprite sheet
    imageSheet = loadImage(imageFile);
    
    // figure out real frame number
    frameSize = imageSheet.width / frames;
    
    // defines the size of the sprite 'window' on the file
    finalImage = createImage(buttonWidth, buttonHeight, ARGB);
    
    // syntax .copy(from file, upper left x of frame, uper left y, w of source draw, height of draw, 0, 0, dest x size, dest y size)
    finalImage.copy(imageSheet, frameSize * counter, 0, frameSize, imageSheet.height, 0, 0, buttonWidth, buttonHeight);   
    
  }
  
  
  // <instance>.display() should go in draw, or in a sweeper function or array that goes into draw.
  void display()
  {
    // This just needs to have very little going in here. Most the work is done either in .click() or 
    // in the constructor.
    imageMode(CENTER);
    image(finalImage, buttonX , buttonY);  
  }
  
  // <instance>.click() should go in mousePressed or in a sweeper function or array that goes in mousePressed
  int click()
  {
    // TODO: localize to button area.
    if (dist(mouseX, mouseY, buttonX, buttonY) < buttonRadius)
    {
    
      // logic to determine where you are both in the button functions and the sprite sheet.
      if (counter < buttonFrames)
      {
        counter += 1;
      }
      else
      {
        counter = 0;
      }
      
      // updates the image display
      finalImage.copy(imageSheet, (frameSize * counter), 0, frameSize, imageSheet.height, 0, 0, buttonWidth, buttonHeight);
      
      // play the button audio
      if (soundOn)
      {
      audioFile.trigger();
      }
      
    }
  // returns the counter value to the program so it can assoicate it with some goodie or another.
  return counter;
  }
}

// Helper functions - these just move things out of methods that would otherwise be all sorts
// of full with things. If I were doing a bigger project, I'd likely make this a class and
// have it fed the tool number and spit out output to the desired methods.


// Tool functions- These functions all have different instructions for 
// how to draw when the mouse button is depressed and the mouse moved.
// please play with them plenty!! =) Check the descriptions in the
// tool picker function to see what each one does! =)
void tool1(float x,float y, float px, float py) 
{
  strokeWeight(5);
  line(px, py, x, y);
  return;
}

void tool2(float x,float y, float px, float py) 
{
  line(px, py, x, y);
  return;
}

void tool4(float x,float y, float px, float py) 
{
  float randomX = random(25);
  float randomY = random(25);
  pushMatrix();
  translate(x,y);
  rotate(random(py));
  
  // This constraining allows occassional drawing outside of the draw area.
  // However, a tighter contrain would have either required not being able to
  // use a large portion of the draw area for this tool or would require a lot
  // of logic that I don't have time for in the score of getting this project
  // done.
  if (mouseX > (border + 20) && mouseX < (width - (border + 20))
    && mouseY > (bottomBorder + 20) && mouseY < (height - (bottomBorder + 20)) &&
    pmouseX > (border + 20) && pmouseX < (width - (border + 20))
    && pmouseY > (bottomBorder + 20) && pmouseY < (height - (bottomBorder +20)))
   { 
    rect(0 +randomX, 0 +randomY, 8, 8); 
   }
  popMatrix();
  return;
}


void tool5(float x,float y, float px, float py) 
{
  float randomX = random(25);
  float randomY = random(25);
  pushMatrix();
  translate(x,y);
  rotate(random(py));
  
  // This constraining allows occassional drawing outside of the draw area.
  // However, a tighter contrain would have either required not being able to
  // use a large portion of the draw area for this tool or would require a lot
  // of logic that I don't have time for in the score of getting this project
  // done.
  if (mouseX > (border + 20) && mouseX < (width - (border + 20))
    && mouseY > (bottomBorder + 20) && mouseY < (height - (bottomBorder + 20)) &&
    pmouseX > (border + 20) && pmouseX < (width - (border + 20))
    && pmouseY > (bottomBorder + 20) && pmouseY < (height - (bottomBorder +20)))
   { 
    ellipse(0+random(25),0+random(25),8,8);
   } 
  popMatrix();
  return;
}

void tool6(float x,float y, float px, float py)
{
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}

void tool7(float x,float y, float px, float py)
{
  line(px, py, x, y);
  line((width / 2 + ((width / 2) -px)),py,( width / 2 + ((width/2)-x)),y);
  return;
}

void tool8(float x, float y, float px, float py) 
{
  line(px, py, x, y);
  line(px, ((height -bottomBorder) / 2 + ((height / 2)- py)), x, ( (height -bottomBorder) /2 + ((height / 2)- y)));
  return;
}

void tool9(float x,float y, float px, float py)
{
  strokeWeight(1);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}

void toolPicker() 
// Deals with handling what tool is being used to draw. I could have done this with iteration
// if I were less lazy, but at least I've got it all in one spot in this function here.


{
  // This logic constrains the draw to within the bordered area. 
  if (mouseX > border && mouseX < (width - border)
    && mouseY > bottomBorder && mouseY < (height - bottomBorder) &&
    pmouseX > border && pmouseX < (width - border)
    && pmouseY > bottomBorder && pmouseY < (height - bottomBorder))
  {
      
    if (output == 1) 
    {
      // This is a basic colored line, colors determined by the color mode.
      tool1(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
      
    }
    
    if (output == 2) 
    {
      // This is a line that changes size based on the mapped value in mouseDragged()
      tool2(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    }
    
    if (output == 3) 
    {
      // This is a line this is simple black or white, based on screen color.
      tool1(mouseX, mouseY, pmouseX, pmouseY);
      colorless = true;   
    }
    
    if (output == 4) 
    {
      // This tool draws squares that follow the mouse around closely
      tool4(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      } 
    }
    
    if (output == 5) 
    {
      // This tool draws circles that follow the mouse around closely
      tool5(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    }
    
    if (output == 6) 
    {
      // This tool causes symmetry across both the x and the y axis.
      tool6(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    }
    
    if (output == 7) 
    {
      // This tool copies all output along the X axis.
      tool7(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    }
    
    if (output == 8) 
    {
      // This tool copies all output along the Y axis.
      tool8(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    }
    
    if (output == 9) 
    {
      // This tool is like tool 6, but with a very fine stroke set.
      // Is a very good tool for drawing details over rapid strokes,
      // which come out nicely if the contrast on speed is set to something nice.
      tool9(mouseX, mouseY, pmouseX, pmouseY);
      
      // Turns off corlorless mode, if active.
      if (colorless == true)
      {
        colorless = false;
      }
    
    }
  }

}
  
void photoIcon() {
  // This function decides which image to draw for the screenshot icon on the
  // application, based on the state of the photoTaken bool. it uses a counter that
  // it updates once per call to the function, which is itself called once per
  // draw() refresh, so it in essence is a way of useing the draw as a timer to show 
  // the 'flash' version of the camera icon. 
  
  // This tells the program what to do if the counter is above the max amount I 
  // decidided on for a pause. In this case, it will set the photoTaken Bool to
  // false, and reset the counter.
  if (counter > 40)
  {
    photoTaken = false;
    counter = 0;
  }
  
  // what to do if the bool is true and the counter is less then 0 -
  // which is display the dummy button icon for the 'flash' camera
  // and incriment the counter once per call.
  if (photoTaken == true)
  {
    screenShotTaken.display();
    counter += 1;
  }
  
  // what to do if the bool is false. This is pretty much what should be considered the default.
  if (photoTaken == false)
  {
     screenShotButton.display();
  }
}


  


void draw()
{
  // draw method calls from button classes. These are what makes the buttons draw themselves.
  backgroundButton.display();
  clearButton.display();
  colorButton.display();
  brushButton.display();
  exitButton.display();
  soundButton.display();
  
  // This helper function uses a dummy second button call to overwrite the take screen shot
  // button with a screen shot taken button for a set number of calls to the draw() method.
  photoIcon();
  
  // GUI Frame Draw:
  image(frame, (width/2), (height/2));
  
}

void mouseDragged() 
{
  
  // There's a lot of locals for mouseDragged() as it will be handinding the majority of the
  // user input. I call off of the variables with the names "start<foo>" because as you mode
  // swap they will be associated with different parts of the HSB interface.
  float startHue = map(mouseX, 0, width, 0, 400); // mapped to half of screen width
  float startSaturation = map(mouseY, 0, height, 0, 400); // mapped to half of screen height
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY); //need this to be mapped for speed.
  float startBrightness = map(speed, 0, 10, 0, 400);
  
  // this is for the tools that alter the width of the line drawing
  float StartLineWeight = map(speed, 0, 10, 0, 10);
  StartLineWeight = constrain(StartLineWeight, 0, 10);
  
  // The outer if statement deals with if it's drawing with simple black/white lines or not.
  if (colorless == false)
  {
    
   // this logic deals with the associations between the three parts of the HSB color mode
   // and the mouse input types. I had to include the logic here because otherwise it was
   // giving me big cows about things not existing.
   if (modeToggle == 1)
     {
       stroke(startHue, startSaturation, startBrightness);
     }
   if (modeToggle == 2)
     {
       stroke(startBrightness, startHue, startSaturation);
     }
   if (modeToggle == 3)
     {
       stroke(startSaturation, startBrightness, startHue);
     }
   if (modeToggle == 4)
     {
       stroke(startHue, startBrightness, startSaturation);
     }
   if (modeToggle == 5)
     {
       stroke(startBrightness, startSaturation, startHue);
     }
   if (modeToggle == 6)
     {
       stroke(startSaturation, startBrightness, startHue);
     }
    
  strokeWeight(StartLineWeight);
  }
  
  // determines the color based on the background color of the screen.
  if (colorless == true)
  {
    if (screenColor == 0)
    {
      stroke(400);
    }
    if (screenColor == 400)
    {
      stroke(0);
    }
  }
  
  // This calls the function toolPicker, which handles all the associations between how the 
  // sketch draws things and the mouseDragged function.
  toolPicker();
}


// The mousepressed here is for testing modes 
void mousePressed()
{
  // only checks if press outside draw area to reduce needless calls.
  if (!(mouseX > (border) && mouseX < (width - (border ))
      && mouseY > (bottomBorder) && mouseY < (height - (bottomBorder)) &&
      pmouseX > (border) && pmouseX < (width - (border))
      && pmouseY > (bottomBorder) && pmouseY < (height - (bottomBorder))))
      {
        // place returns in intigers to allow for more then one check on the call with out
        // triggering any unexpected results.
        int backgroundReturn = backgroundButton.click();
        int clearReturn = clearButton.click();
        int colorReturn = colorButton.click();
        int brushReturn = brushButton.click();
        int exitReturn = exitButton.click();
        int soundReturn = soundButton.click();
        int screenShotReturn = screenShotButton.click();
        
        
        // Dealing with clear screen logic:
        // if the return from clearButton doesn't match the last known value... clear screen.
        if (clearReturn != screenClearHandler)
        {
          // Update the screen clear handler
          screenClearHandler = clearReturn;
          
          //update 
          background(screenColor);
         
        }
        
        // Dealing with background color logic:
        // if the return from backgroundButton doesn't match the last known value... change background color.
        if (backgroundReturn != screenColorHandler)
        {
          // Update the background color handler.
          screenColorHandler = backgroundReturn;
         
          // changes the background colors around. 
          if (screenColor == 400)
          {
            screenColor = 0;
          }
          else
          {
            screenColor = 400;
            
          }
          background(screenColor);
        }
        
        // Set the color mode. Has a constraint for now because of mockup buttons I have access too. can replace
        // with update inside the logic when that's taken care of.
        if (colorReturn <6)
        {
          // updates modeToggle
          modeToggle = (colorReturn + 1);
        }
        
        // Dealing with exit logic. If the button is pressed... exit.
        if (exitReturn != 0)
        {
          // Exits the app
          exit();
        }
        
        // Set the draw mode. Thanks to the toolPicker() function, I don't have to do a lot here.
        output = (brushReturn + 1);
        
        // Deals with the sound being on or off.
        if (soundReturn != soundToggleHandler)
        {
          // Flips the bool to the alternate state
          soundOn = !(soundOn);
          // updates soundToggleHandler
          soundToggleHandler = soundReturn;
        }
        
        // Takes care of screen shots being taken.
        if (screenShotReturn != screenShotHandler)
        {
          // update flag for the graphic for the camera button:
          // my button class wasn't made with consderation of how the camera button 
          // should work. So I had to do some vodo here to make it update based on 
          // time progression rather than what click has occured last.
          photoTaken = true;
          
          // updates screenShotHandler
          screenShotHandler = screenShotReturn;
          
          // defines the photo area.
          int rightBorder = width -  (2 * border);
          int lowerBorder = height - (2 * bottomBorder);
          
          // makes the new image
          PImage screenSave = get(border, bottomBorder, rightBorder, lowerBorder);
          
          // saves it to file
          screenSave.save(""+ year() + "-" + month() + "-" + day() + " " + hour() + "." + minute() + "." +  second() + ".jpg");
          
 
        }
        

      }
      

}



