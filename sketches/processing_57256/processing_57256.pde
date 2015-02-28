
// How to work with text in Processing

size(200, 200);
background(255);
stroke(128);

fill(0); // the fill() color sets the text color 
text("Hello", 10, 20);

// The (x, y) positio of the text based on the bottom of 
// the font, not the top, as illustrated by this line:
line(10, 20, 190, 20); 

// we can make text larger by using textSize()
textSize(36);
text("Hello", 10, 64);


// to use a different font, we need to create a PFont object
PFont myFont = createFont("Times New Roman", 24);
// set the font
textFont(myFont);
text("Times", 10, 96);

// you can have multiple fonts
PFont anotherFont = createFont("Helvetica", 24);
textFont(anotherFont);

// you can also change the text alignement:
line(width/2, 128, width/2, 190);

textAlign(CENTER);
text("Center", width/2, 128);

textAlign(RIGHT);
text("Right", width/2, 155);

textAlign(LEFT);
text("Left", width/2, 175); 

// if you don't specify an (x, y) position, the text will go after the last
// text displayed
text("!!");
