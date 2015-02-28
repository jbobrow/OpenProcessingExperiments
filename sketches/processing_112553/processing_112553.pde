
Waffle w;
Waffle[] waffleArray;
int numWaffles;
color[] colors = { #eb0606, #eb9206, #5dce43, #8be085, #375bef, #8dabf7 };
int currentWaffleColor;

void setup(){
    size(500, 500);
    background(0);
    numWaffles = 100;

    // Create an array with spaces for numWaffles waffles.
    waffleArray = new Waffle[numWaffles];

    // Go through all 100 waffles by increasing the index and give them x and y values.
    int index = 0;
    for (int x = 0; x<10; x++) {
        for (int y = 0; y<10; y++)
        waffleArray[index++] = new Waffle(x*50, y*50);      
    }

    // Go through the waffle array and randomize all the waffles.
    for (int i = 0; i<numWaffles; i++) {
        waffleArray[i].randomize();
    }
}

void draw(){
}

void mousePressed() {


    // Set the currentWaffleColor to the waffle which returns a value of 1
    for (int i = 0; i<numWaffles; i++) {
        if (waffleArray[i].check() == 1) {
            currentWaffleColor = waffleArray[i].getColor();
            }   
        }

    // If you click a black waffle, then randomize the grid,
    // otherwise change the colors of all like-colored waffles to black.
    for (int i = 0; i < numWaffles; i++) {
        if (currentWaffleColor == #000000) {
            waffleArray[i].randomize();
        } else if (waffleArray[i].getColor() == currentWaffleColor) {
            waffleArray[i].nullify();
        }
    }


    // Redraw the waffles with their new colors to register the changes from above
    for (int i = 0; i<numWaffles; i++) {
        waffleArray[i].redraw();
    }
}

class Waffle {
    int xpos;
    int ypos;
    int width = 50;
    color c;
    color current;

    Waffle(int _xpos, int _ypos) {
        xpos = _xpos;
        ypos = _ypos;
    }

    // Draws a grid of waffles with random colours.
    void randomize() {  
        c = colors[floor(random(0, colors.length))];
        fill(c);
        rect(xpos, ypos, width, width);
    }

    // Redraws the grid of waffles without changing the colours.
    void redraw() {
        fill(c);
        rect(xpos, ypos, width, width);
    }

    // Returns 1 if the waffle is clicked, 0 if it is not.
    int check() {   
        // If the mouse is inside of the waffle object then return 1, else retun 0.
        if (xpos < mouseX && mouseX < (xpos + width) && ypos < mouseY && mouseY < (ypos + width)) {
            return (1);
        } else { 
            return(0); 
        }
    }

    // Returns the colour of the current waffle
    color getColor() {
        return c;
    }

    // Sets the color to black
    void nullify() {
        c = #000000;
    }
}
