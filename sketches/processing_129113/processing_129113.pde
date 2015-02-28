
int canvasWidth = 800;
int canvasHeight = 600;
int squareSize = 15;

int rows = canvasHeight/squareSize;
int cols = canvasWidth/squareSize;

void setup() {  
    size(canvasWidth,canvasHeight);
    
    
    for (int c=0; c<cols; c++) {
        for (int r=0; r<rows; r++) {
            int x = c*squareSize;
            int y = r*squareSize;
            fill(random(255));
            stroke(0,0,0,0);
            rect(x,y,squareSize,squareSize);
        }
    }
}

void draw() {
    int x = int(random(cols))*squareSize;
    int y = int(random(rows))*squareSize;
    fill(random(255));
    stroke(0,0,0,0);
    rect(x,y,squareSize,squareSize);
}
