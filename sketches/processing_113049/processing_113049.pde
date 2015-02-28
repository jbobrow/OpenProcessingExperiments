
Waffle[] waffleArray;
int[] firstPartners;
int[] secondPartners;
int numWaffles;
float currentWaffleX;
float currentWaffleY;
float firstConnectX;
float firstConnectY;
float secondConnectX;
float secondConnectY;

void setup() {
    smooth();
    size(800, 800);

    // Number of waffles. Modify.
    numWaffles = 10;

    // Create arrays for waffle objects and partners.
    waffleArray = new Waffle[numWaffles];
    firstPartners = new int[numWaffles];
    secondPartners = new int[numWaffles];

    // Fill waffleArray with waffles.
    // Fill firstPartners and secondPartners with numbers between 0 and numWaffles.
    for (int i = 0; i < numWaffles; i++) {
        waffleArray[i] = new Waffle();
        firstPartners[i] = int(random(0, numWaffles));
        secondPartners[i] = int(random(0, numWaffles));
    }
}

void draw() {

    background(36, 83, 197);



    // Draw each waffle from the waffleArray
    for (int i = 0; i < numWaffles; i++) {
        // Why do update and display have to be in this order for syncronicity?
        // Is it conventional to arrange them this way?
        waffleArray[i].update();
        waffleArray[i].display();
    }
    
    // Connect each waffle to two other random waffles
    connect();  
}

void connect() {
    // Connect each to another two random waffles
    // For firstConnect use the values from firstPartners[i]
    // For secondConnect use the values from secondPartners[i]
    for (int i = 1; i < numWaffles; i++) {
        // Create variable for the xy pos of both the 'current' and 'previous' waffles
        // Variables created to make the code easier to follow
        currentWaffleX = waffleArray[i].currentLocation.x;
        currentWaffleY = waffleArray[i].currentLocation.y;
        firstConnectX = waffleArray[firstPartners[i]].currentLocation.x;
        firstConnectY = waffleArray[firstPartners[i]].currentLocation.y;
        secondConnectX = waffleArray[secondPartners[i]].currentLocation.x;
        secondConnectY = waffleArray[secondPartners[i]].currentLocation.y;
        // Draw the line
        stroke(250);
        line(currentWaffleX, currentWaffleY, firstConnectX, firstConnectY);
        line(currentWaffleX, currentWaffleY, secondConnectX, secondConnectY);
    }
}

class Waffle {
    float x;
    float y;
    PVector currentLocation;
    PVector location;
    PVector velocity;
    PVector acceleration;
    PVector mouse;
    float size;
    float multValue;
    float velocityLimit;

    Waffle() {

        // Isolated so better 'randomness' can be implemented.
        size = random(20, 50);
        x = width/2+random(-400, 400);
        y = height/2+random(-400, 400);
        multValue = random(.75, 1.5);
        velocityLimit = (17);


        // Set PVectors
        location = new PVector(x, y);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        
    }

    void display() {
        noStroke();
        fill(250);
        ellipse(location.x, location.y, size, size);
    }

    // Is this the correct way to pass a PVector out of an object?
    // Is this the correct syntax for accessing the x or y value of a PVector passed out of an object.
    // PVector location() {
    //  return(location);
    // }

    void update() {
        // Set acceleration to the vector between the waffle and the mouse
        mouse = new PVector(mouseX, mouseY);
        acceleration = PVector.sub(mouse, location);

        // Normalize the vector and multiply by 0.2 (controls the magnitude of the acceleration)
        acceleration.normalize();
        acceleration.mult(multValue);

        // Update the changes
        velocity.add(acceleration);
        velocity.limit(velocityLimit);
        location.add(velocity);

        // Why do I have to do this?
        currentLocation = location.get();
        
    }
}
