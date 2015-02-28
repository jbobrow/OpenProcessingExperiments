
// These arrays are going to store the squares coordinates
int[] squareX = new int[10];
int[] squareY = new int[10];

// Stores which square is being dragged
// Starts with a number, otherwise it would start with zero and the first one one be dragged
int draggingSquare = -1;

// These vars will store the temporary position of the square as it is dragged
int tempSquareX;
int tempSquareY;

// Those are layout variables and they won't change
int squareSize = 20;     // That is the size of the square
int shadowDistance = 3;  // This is the distance of the dropped shadow

// These are the motion variables used when the square goes back to its initial position
float value = 0;
float targetValue = 0;

void setup(){
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CORNER);

  // Setting random intial positions for our squares
  for(int i = 0; i < squareX.length; i ++){
    squareX[i] = int(random(50, width - 50));
    squareY[i] = int(random(50, height - 50));
  }
}

// Drawing the gradient background
void gradientBackground(){
  float hue; 
  for(int i = 0; i <= height; i ++){
    hue = map(i, 0, height, 180, 150);
    stroke(hue, 100, 100);
    line(0, i, width, i);
  }
}

void mousePressed(){
  // Do the loop to check if any square is being clicked
  for(int i = 0; i < squareX.length; i ++){
    // If the user clicks over one of the squares
    if(squareX[i] < mouseX && mouseX < squareX[i] + squareSize &&
       squareY[i] < mouseY && mouseY < squareY[i] + squareSize){
      
      // Sets this as the current square being dragged
      draggingSquare = i;
    }
  }
}

void mouseReleased(){
  // Resets the draggingSquare variable
  //draggingSquare = -1;
  tempSquareX = mouseX - squareSize/2;
  tempSquareY = mouseY - squareSize/2;
  value = 1;
}

// Drawing the squares
void drawSquares(){
  noStroke();
  for(int i = 0; i < squareX.length; i ++){

    // Draws all squares, except for the one being dragged
    if(i != draggingSquare){
            
      // Draws the actual ellipseangle
      fill(340, 100, 100);
      ellipse(squareX[i], squareY[i], squareSize, squareSize);
    
    // If there is s square being dragged
    }else{
      float x;
      float y;
      float brightness;
      
      // If it is still being dragged, draw it on the mouse coordinates
      if(mousePressed){
        x = mouseX - squareSize/2;
        y = mouseY - squareSize/2;
      
      // If the user releases it, starts to go back to the initial position
      }else{
        //Easing
        value += (targetValue - value) * 0.4;
        x = map(value, 0, 1, squareX[draggingSquare], tempSquareX);
        y = map(value, 0, 1, squareY[draggingSquare], tempSquareY);
        
        // If it's close enough to the initial position, resets the dragging
        if(value < 0.01){
          draggingSquare = -1;
        }
      }
      if(draggingSquare >= 0){
        brightness = map(dist(x, y, squareX[draggingSquare], squareY[draggingSquare]),
                         0, width/2, 10, 100);
                         println(brightness);
      }else{
        brightness = 0;
      }
      
      // Line
      noFill();
      stroke(340, 100, 100, brightness);
      line(x + squareSize/2, y + squareSize/2, squareX[i], squareY[i]);

      // Shadow
      fill(340, 100, 100, 50);
      noStroke();
      ellipse(x + shadowDistance, y + shadowDistance, squareSize, squareSize);
      
      // ellipse
      fill(340, 100, 100);
      noStroke();
      ellipse(x, y, squareSize, squareSize);
    }
  }
}

void draw(){
  background(255);
 
  gradientBackground();
  
  drawSquares(); 
}


