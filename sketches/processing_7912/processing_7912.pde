
String [] StrArray; 
  // Here's an array called 'StrArray' of strings ie lines
  // of characters (in this case words).
int blobFill = 255;
  // Here's the blobFill variable, starting at 255 (white).
int textFill = 0;
  // Here's the textFill variable, starting at 0 (black).

void setup() {
  // run once
  size(600,600);
  background (0);
  noStroke();
  smooth();
  frameRate(18);
    // Slow the drawing down a bit.
  fill(blobFill);
    // Colour the fill with the variable 'blobFill'. 
  StrArray = loadStrings("affirmations.txt");
    // Load the text file 'affirmations' as the set of strings called StrArray
  
//    for (int i=0; i<StrArray.length; i++) {
//    println(StrArray[i]);
//  }
}

void draw (){ 
  // Run, code, run! (And keep running.)
  if (mousePressed == true) {
    // When the mouse is pressed, run this function. If the mouse is held down,
    // keep drawing.
  drawBlob(mouseX,mouseY,60); 
    // Run the drawBlob function using the mouse-click coordinates 
    // for 'xpos' and 'ypos' and 60 as input for 'blobSize'. 
 boolean allBlobbed = checkPixels();
    // here is a variable called allBlobbed. It's true if checkPixels returns true,
    // ie if all the pixels are blobFill-coloured.
  if (allBlobbed){
    // if allBlobbed is true, ie the pixels pass the test, ie they are all coloured
    // according to the current blobFill...
//    println("hello");
      // print 'hello' in the text window below.
    blobFill = 255-blobFill;
      // Invert the blob fill colour.
    affirm();
      // Run the 'affirm' function.

  }
} 
}

void drawBlob(int xpos, int ypos, int blobSize) { 
  // Run a function with three variables for 
  // xpos, ypos and blobSize. By their names we 
  // can anticipate that the variables are for 
  // position and size of the thing being created.

  for (int i = 0; i<10; i++) { 
    // Let's do something ten times in a row.
  float circlewidth = random(60,160); 
    // The name of this variable suggests that the ten
    // things will be circles, or - since they are filled
    // - spots, of a size between 60 and 160 pixels. 
  ellipse (xpos + random(-blobSize,blobSize),
    ypos + random(-blobSize, blobSize),
    circlewidth,circlewidth);
      // Yep, we're doing spots. The instruction is to draw each of the ten spots
      // at a position and of a size yet to be determined. We do know, however, 
      // that both the size and position of each of the ten spots will vary –
      // the position because a random number gets added to the x coordinate, 
      // and the size because circlewidth is itself a variable. 
  }
}
 


   

boolean checkPixels(){ 
   // Run a test called checkPixels – to return either true or false.
loadPixels(); 
   // Load the pixel information from the display window in to the pixel array.
for (int i = 0; i < width*height; i++){ 
   // One time for every pixel...
   color c = pixels[i]; 
      // read the colour from the array; c is the colour of each pixel.
   if (c != color(blobFill)) { 
      // If the pixel's colour is not that of the blob's fill, do as follows:
      return false; 
        // Fail the checkPixels test. |Does it keep checking pixels after the
        // first fail?| Does this stop the 
    }
  }
  return true;
    // if the for loop runs through, ie isn't stopped by the false return,
    // then checkPixels is true.
}

void affirm(){
  // run the 'affirm' function as follows.
  fill(textFill);
    // Colour the text with 'textFill'.
  PFont font; 
    // Here is the variable 'font' which is a PFont type of variable.
  font = loadFont("Cochin-48.vlw"); 
    // Load the font I created for this sketch.
  textFont(font); 
    // Set the font to be as above ie Cochin-48.
  int whichAffirmation = int(random(StrArray.length));
    // pick a number from 0 to 9 and convert it to an integer. | Why does it
    // need converting? Random numbers can be integers can't they?|
    textAlign(CENTER, CENTER);
      // center the text horizontally and vertically
    text (StrArray[whichAffirmation],100,100, 400, 400);
      // Display the selected affirmation. |I don't know why we need the x and y
      // coordinates to be 100, 100 – the centre alignment should require them to be
     // 300, 300 yea? but if they're 300, 300, the words are too far over.|
   textFill = 255-textFill;
     // invert the text fill colour.
  }

