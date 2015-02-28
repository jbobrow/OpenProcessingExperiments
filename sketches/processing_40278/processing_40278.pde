
//Font variable
PFont f;
//Make window size 200 x 200
void setup() {   
    size(200, 200);
    f = loadFont("Amienne-48.vlw");
    stroke(235, 250, 73);
}

//Draws 4 diagonal yellow lines from center; Making an X
void draw() {
  background(155, 239, 247);
       strokeWeight(10);
        line(100, 100, 175, 175);
        line(100, 100, 25, 175);
        line(100, 100, 25, 25);
        line(100, 100, 175, 25);

        //Draws a yellow circle in the middle
        fill(235, 250, 73);
        ellipse(100, 100, 75, 75);         
        
        //Draws 4 yellow triangles
        
        triangle(100, 175, 75, 125, 125, 125);
        triangle(100, 25, 75, 75, 125, 75);
        triangle(25, 100, 75, 75, 75, 125);
        triangle(175, 100, 125, 75, 125, 125);
        
        //Prints "Sun!" in white in middle
        textAlign(CENTER);
        textFont(f, 36);
        fill(225);
        text("Sun!", 100, 100);
}


