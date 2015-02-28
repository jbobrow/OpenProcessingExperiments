

// this is a font class referance
PFont font;
//this is a image referance
PImage bg;

void setup() {
  //when using a background image it is important the screen size is the same as the image
  size(500, 407);

  // load the font wich is located in the data folder
  font = loadFont("AmericanTypewriter-Condensed-48.vlw");

  // set the font we are using and the size
  textFont(font, 18);

  // creata Pimage from the local image in the data file
  bg = loadImage("photo_frame_7.jpg");
  
  //set the backgorund image
  background(bg);

  // we want this to refreash once every second, for slower refreash use a decimal
  frameRate(1);
}

void draw() {
  //refreash the screen with the background image
  background(bg);
  
  //load the bbc uk news page
  String[] page = loadStrings("http://www.bbc.co.uk/news/uk/");

  //print to console the number of lines
  println(page.length);
  
  // chop up line 563 where ever we see an right angle bracket 
  String[] bits = page[563].split(">");
  
  //the first split takes off everthing from the left of the string we want
  // this second split takes off everything from the left
  bits = bits[1].split("<");
  println(bits[0]);
  
  // now we have our sting lets put it in a sensible variable name
  String headline = bits[0];
  
  // after the lecture this changed and if you look at the console text
  // you can see that the html code for a comma looks a bit wild
  // this is a common problem and easily rectified with the string replaceAll function
  headline=  headline.replaceAll("&#039;","'");
  
  //set the fill color for the text and render the string
  fill(50);
  text(headline, 100, height/2);
}


