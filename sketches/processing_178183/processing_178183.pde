
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

