
class Food { //Class for food
  PVector location; //Location of the food
 
  Food() { //Creates a new food
    this.location = new PVector((int)random(SCREEN_SIZE/segmentSize)*segmentSize, (int)random(SCREEN_SIZE/segmentSize)*segmentSize); //Sets food location to a random location
  }
  
  void renderFood() { //Renders the food
    fill(255, 0, 0); //Fills red
    stroke(255); //Borders with white
    rect(this.location.x, this.location.y, segmentSize, segmentSize); //Draws the food
    
    if(!pauseState && this.location.x == segments.get(0).location.x && this.location.y == segments.get(0).location.y) { //If the head of the snake is on the food and the game is not paused
      food = new Food(); //Moves the food
      addSegmentNextUpdate = true; //Adds a segment
      score++; //Increments the score
    }
  }
}

