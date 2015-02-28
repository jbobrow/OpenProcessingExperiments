
size(600,600);
strokeWeight(1); // first stroke weight
int startPos = 0; // allows us to change start position later
int endPos = 120; // allows us to change end position later
float strokeW = 1; // A float is a number with a decimal point

while(endPos <601) { // stops the drawing past the edge of the canvas

  for (int i = 1; i < 400; i ++){ // parameters for a for loop
    
    line(startPos, i, endPos-40, i + i/2); // first line, looped upwards
    line(startPos + 80, i + i/2, endPos, i*1.2); // second line, looped upwards
  }
    
   strokeW -= 0.18; // makes each column thinner towards the right
   strokeWeight(strokeW); // implements stroke weight change
   startPos += 120; // moves start x co-ordinate of first line
   endPos += 120;  // move end y co-ordinate of second line

}




