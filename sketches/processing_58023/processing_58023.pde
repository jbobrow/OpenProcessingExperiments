
PFont fontA;
void setup() 
{
  size(200, 200);
  background(0);
  smooth();
  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. A font must first be created
  // using the 'Create Font...' option in the Tools menu.
  // Font used was Raleway-thin
  fontA = loadFont("Raleway-Thin-48.vlw");
  textAlign(CENTER);

  // Set the font and its size (in units of pixels)
  //original was 50, increased it to 95
  textFont(fontA, 95);

  // Only draw once
  noLoop();
} 

void draw() 
{
  // Set the gray value of the letters
  fill(255);

  // Set the left and top margin
  int margin = 6;
  int gap = 30;
  translate(margin*1.5, margin*2);

  // Create a matrix of letterforms
  int counter = 0;
  for(int i=0; i<margin; i++) {
    for(int j=0; j<margin; j++) {
      char letter;

      // Select the letter
      int count = 65+(i*margin)+j;
      if(count <= 90) {
        letter = char(65+counter);
        //Chosen specfic letters to stand out
        //Did that by changing the colour to gold
        //The result is suppose to show the word 'smile'
        if(letter == 'S' || letter == 'M' || letter == 'I' || 
          letter == 'L' || letter == 'E') {
          fill(238, 201, 0);
        } 
        //Changed colour value to grey with transparency
        else {
          fill(255,255,255,70);
        }
      } 
      //Changed colour vaule to grey with transparency 
      else {
        fill(255,255,255,70);
        letter = char(48+counter);
      }

      // Draw the letter to the screen
      text(letter, 15+j*gap, 20+i*gap);

      // Increment the counter
      counter++;
      if(counter >= 26) {
        counter = 0;
      }
    }
  }
}
void keyPressed() {
  saveFrame("PS3_03image.jpeg");
}

