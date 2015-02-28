
// Drawing text character by character to create a gradient 

void setup() {
  size(300, 100);
  // if we're only going to use one font, we can skip using a PFont variable
  // altogether like this  
  textFont(createFont("Impact", 80));  
}

void draw() {
  background(0);  
  
  // two colors
  color c1 = color(130, 161, 28);
  color c2 = color(242, 249, 186);
  
  String word = "gradient";
  
  // convert the string Word to an array of 'char' variables
  // using the String class's 'toCharArray()' method 
  char[] letters = word.toCharArray();  
  
  // calculate the starting position of "x" based on the width 
  // of the entire word so that it appears centered in the end
  float x = (width - textWidth(word)) / 2;
  
  for (int i=0; i < letters.length; i++) {    
    // get a value between 0 and 1 based on "i" 
    float a = map(i, 0, letters.length, 0, 1);
    // use lerpColor to get a blend of c1 and c2 using 'a' 
    color mix = lerpColor(c1, c2, a);
    fill(mix);
    // draw each letter individually
    text(letters[i], x, height-20);
    // use textWidth on each letter to calculate how much to add to x 
    // and end up in the right spot for the next letter 
    x += textWidth(letters[i]); 
  }
}
