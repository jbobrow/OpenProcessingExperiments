
int canvasWidth = 800;
int canvasHeight = canvasWidth;
size(canvasWidth,canvasHeight);
background(0);

stroke(0,0);
fill(255);

rect(0,0,canvasWidth/2,canvasHeight);

rect(canvasWidth/2,0,canvasWidth/4,canvasHeight/2);
fill(0);
rect(canvasWidth/4,canvasHeight/2,canvasWidth/4,canvasHeight/2);

int squareSize = canvasWidth/8;
rect(canvasWidth/2-squareSize/2, canvasHeight/4-squareSize/2, squareSize, squareSize);
fill(255);
rect(canvasWidth/2-squareSize/2, canvasHeight-canvasHeight/4-squareSize/2, squareSize, squareSize);
