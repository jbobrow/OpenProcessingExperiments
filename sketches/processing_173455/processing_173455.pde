
/*
 * STUDENTS:  Modify the populateCoordinates() method (near the end
 * of this sketch) so that the nested for() loops generate coordinates
 * suitable for placing the red square in the grid to generate a "Z"
 * pattern.  
 * 
 * Note that coordinates are in the row-major format, which
 * means (row, col) -- NOT (x,y).  The first 5 sets of coordinates
 * should be (0,0); (0,1); (0,2); (0,3); and (0,4).
 */
 
int winSize = 500;
int numSq = 10;
int sqSide = winSize/numSq;

ArrayList<Coordinates> redLocations = new ArrayList<Coordinates>();

void setup() {
    size(500,500);
    populateCoordinates(redLocations);
    frameRate(8); //number of times to re-draw() per second
}

void draw() {
    background(128);
    drawGrid();
    if ( redLocations.size() > 0 ) {
        Coordinates redLoc = redLocations.remove(0);
        drawRedBox( redLoc );
    } else {
        noLoop();
    }
}

void drawGrid() {
    stroke(0);
    
    //horizontal lines
    for(int y = 0 ; y <= winSize ; y+=sqSide) {
        line(0,y,width,y);
    }
    
    //vertical lines
    for(int x = 0 ; x <= winSize ; x+=sqSide) {
        line(x,0,x,height);
    }
}

void drawRedBox(Coordinates loc) {
    int x = loc.col * sqSide;
    int y = loc.row * sqSide;
    fill(255,0,0);
    rect(x,y,sqSide,sqSide);
}

/*
 * BEFORE MODIFYING THE METHOD BELOW, MAKE SURE YOU CAREFULLY
 * READ THE COMMENTS AT THE TOP OF THIS SKETCH ABOUT ROW-MAJOR
 * COORDINATES!
 */
void populateCoordinates(ArrayList<Coordinates> locs) {
    
    /* REMOVE THESE MULTI-LINE COMMENTS ONCE YOU START WORKING!
    
    for(int row = ??? ; ??? ; ???) {
        for(int col = ??? ; ??? ; ???) {
            Coordinates newLoc = new Coordinates(row,col);
            locs.add(newLoc);
            
            print("("+row+","+col+"); ");
        }
    }
    println();
    
    REMEMBER TO REMOVE THIS LINE! */
    
}

class Coordinates {
    int row, col;
    
    Coordinates(int r, int c) {
        row = r;
        col = c;
    }
}

