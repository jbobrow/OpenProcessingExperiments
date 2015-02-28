
//Drawing machine:
// My drawing machine creates a grid of lines dependent on the 
//random lenght of horizontal lines. One set of lines extend from the left
//side of the drawing and a second set extend from the right side of the
//drawing. Both sets have random lengths from their respective origins.
//The vertical lines react to the length of the horizontal lines and are
//anchored at the endpoint of each of the horizontal lines. The horizontal 
//line tone change depending on the length of the lines. The vertical line
//tones are dependent on the horizontal line that they correspond to. 
//Each click of the mouse results in a new drawing. 


void setup() {

  size(600, 400);
}

void draw() {
}
void mousePressed() { //the mousePressed function allows for the drawing to be generated on command
  background(random(100, 150)); //The background resets the drawing when the mouse is pressed and the color is random between the values of(100,150)

  for (int y = 0; y< height; y+=20) { //this loop sets the y int as 0 with restrictions of the height of the drawings and an interval of 20
    float rndwidth = random(width); //float rndwidth will define the length of a line at distance (random(width)) from origin x=0 
    stroke(0, 0, rndwidth/2, 80);//The stroke color is also dependent on the length of the line.
    strokeWeight(4);
    line(0, y, rndwidth, y);//line with length (rndwidth) will begin at origin x=0 and continue to (rndwidth)
    strokeWeight(1);
    line(rndwidth, 0, rndwidth, height);//This defines a vertical line spaning the height of the drawing from the point rndwidth (correlating to length of horizontal lines)
  }



  translate(width, 0); //the translation moves the origin to the top right of the drawing
  for (int x = 20; x>-height; x-=20) { //similar to the loop above but this defines the line as starting from the new origin and moving in a negative direction
    float rndwidth = random(width);
    stroke(255, rndwidth/2, 0, 80);//same stroke color concept as above
    strokeWeight(4);
    line(0, -x, -1*rndwidth, -x );//this line originates at the new upper right origin and is horizontal. It spans a negatize distance (-1*rndwidth)
    strokeWeight(1);
    line(-1*rndwidth, 0, -1*rndwidth, height); //this vertical line corresponds to the second loop with correlation to the horizontal distance (-rndwidth)
   
  }
}


