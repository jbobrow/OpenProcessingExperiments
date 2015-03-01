
// ==================================================================================== //
// -----------------------------------PLAYER CLASS ------------------------------------ //
// ==================================================================================== //

// This 'class' is like a blueprint for an object that we're going to use in our 
// game. It saves us writing the same code every time we want another of something.
// In this example we might only want one player, but if we add another, we can 
// probably use most of the same methods. And imagine if we had lots of enemy objects,
// we could make one blueprint 'class' and then create lots of them at different 
// positions! 

class Player {

    PVector velocity = new PVector (0, 0);
    PVector position;

    float playerSpeed = 6f;

    // This method will draw the player to the screen, we will need to 
    // call it during every draw() cycle to make sure the player's position
    // gets updated
    void display() {
    
        // Here we draw the player ->
        rectMode(CENTER);
        fill(255, 20, 147);                                 
        rect(position.x, position.y, 20, 20); 
           
        // Then we update the player position. We have to use .add() because
        // we're adding two Vectors rather than just two numbers.
        position.add(velocity);                 
        
        // There's something call we can do to prevent our player going missing when he  
        // leaves the screen! Whenever his position is less than 0 or greater than the width 
        // or height of the screen, we can set it to the opposite side! height and width
        // are built in, so we don't have to set them. (They correspond to the numbers in
        // setup() when we call size(x, y).     
        
        if (position.x < 0) {
            position.x = width;
        }
        if (position.x > width) {
            position.x = 0;
        }
        if (position.y < 0){
            position.y = height;
        }
        if (position.y > height) {
            position.y = 0;
        }
    }
}

// ==================================================================================== //
// -------------------------------- MAIN GAME METHODS --------------------------------- //
// ==================================================================================== //

// We need to give the computer a list of objects we're going to create,
// here we can simply list them outside of any method and make them during 
// the setup() method

Player myPlayer;

// Now we can create our two most important methods! Remember, setup gets called 
// once first and then the draw method gets called repeatedly over and over.

void setup() {
    size(500, 500);                                     // Set the background size
    myPlayer = new Player();                            // Create a new player based on the blueprint
    myPlayer.position = new PVector(100, 400);          // Set the players starting position
}

void draw() {
    background(200, 200, 200);                          // Set the background colour (red, green, blue)
    myPlayer.display();                                 // Draw the player
}

// ==================================================================================== //
// ------------------------------------ CONTROLS -------------------------------------- //
// ==================================================================================== //

// 1. This built-in method gets called every time a key is pressed.
// First we have to check which key it was using the built-in variable
// 'key', then depending on whether the player wants to move up, down,
// left or right, you can change the velocity of the player

void keyPressed() {
    if (key == 'a') {
        myPlayer.velocity.x = -myPlayer.playerSpeed;
    }
    if (key == 'd') {
        myPlayer.velocity.x = myPlayer.playerSpeed;
    }
    if (key == 'w') {
        myPlayer.velocity.y = -myPlayer.playerSpeed;
    }
    if (key == 's') {
        myPlayer.velocity.y = myPlayer.playerSpeed;
    }
}

// 2. This built-in method gets called every time a key is released. 
// We need to set the velocity to 0, to make sure the player stops 
// moving when they're not holding down a key!

void keyReleased() {
    if (key == 'a') {
        myPlayer.velocity.x = 0;
    }
    if (key == 'd') {
        myPlayer.velocity.x = 0;
    }
    if (key == 'w') {
        myPlayer.velocity.y = 0;
    }
    if (key == 's') {
        myPlayer.velocity.y = 0;
    }
}


// ==================================================================================== //
// ==================================================================================== //
// ==================================================================================== //
