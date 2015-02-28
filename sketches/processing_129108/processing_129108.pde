
int canvasWidth = 600;
int canvasHeight = 600;
int boxSize = 10;
int numLines = 15;
float breakThroughPercent = .4;

void setup() {
    size(canvasWidth, canvasHeight);
    background(random(255), random(255), random(255));
    
    //divide canvas into squares by setting spaces
    int cols = canvasWidth/boxSize;
    int rows = canvasHeight/boxSize;
    boolean[][] spaces = new boolean[cols][rows];
    //set border of spacing
    for (int i=0; i<cols; i++) {
        spaces[i][0] = true;
        spaces[i][rows-1] = true;
    }
    for (int i=0; i<rows; i++) {
        spaces[0][i] = true;
        spaces[cols-1][i] = true;
    }
    
    //create spacing lines
    for (int i=0; i<numLines; i++) {
        int startDirection = int(random(4));//clockwise from left: 0=left, 1=top...
        int x = int(random(1,cols-1));
        int y = int(random(1,rows-1));
        if (startDirection == 0) {
            x = 0;
        } else if (startDirection == 1) {
            y = 0;
        } else if (startDirection == 2) {
            x = cols-1;
        } else if (startDirection == 3) {
            y = rows-1;
        }
        boolean isDrawingLines = true;
        while (isDrawingLines) {
            spaces[x][y] = true;
            if (startDirection == 0) {
                x += 1;
            } else if (startDirection == 1) {
                y += 1;
            } else if (startDirection == 2) {
                x -= 1;
            } else if (startDirection == 3) {
                y -= 1;
            }
            if (spaces[x][y] == true) {
                if ((x == cols-1) || (y == rows-1) || (x == 0) || (y == 0)) {
                    isDrawingLines = false;
                } else {
                    if (random(0,1) > breakThroughPercent) {
                        isDrawingLines = false;
                    }
                }
            }
        }
    }
    
    //show where lines were drawn
    for (int x=0; x<cols; x++) {
        for (int y=0; y<rows; y++) {
            if (spaces[x][y] == true) {
                stroke(0,0,0,0);
                fill(0);
                rect(x*boxSize, y*boxSize, boxSize, boxSize);
            }
        }
    }
}
