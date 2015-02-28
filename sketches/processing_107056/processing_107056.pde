
// Drawing tool // Courtesy of john ozbay // Drawing tool assignment
// http://www.openprocessing.org/sketch/69286 // 



// Instructions //

// 3 player game

// use the mouse or a drawing tablet to draw

// use the space bar to erase

// use the “s” key to save your drawing

// make sure your drawing reaches the bottom of your canvas for the next player to see it. 




boolean mouseIsDown = false;
boolean randomizer = false;
ArrayList history = new ArrayList();
float distthresh = 50;
float rndW = 5;
int turn = 1;
PImage myImage1;
PImage myImage2;
PImage myImage3;
void setup() {
    size(400, 400);
    background(255, 255, 255);
    smooth();
}
void draw() {
    float distCalc = dist(pmouseX, pmouseY, mouseX, mouseY);
    if (randomizer == true) {
        float rndW = random(5, 4);
    } else {
        float rndW = 6;
    }
    if (mouseIsDown == true) {
        if (distCalc > 5) {
            distCalc = 5;
        }
        strokeWeight(rndW - distCalc);
        line(pmouseX, pmouseY, mouseX, mouseY);
    }
}
void mouseDragged() {
    PVector d = new PVector(mouseX, mouseY, 0);
    history.add(0, d);
    for (int p = 0; p < history.size(); p++) {
        PVector v = (PVector) history.get(p);
        float joinchance = p / history.size() + d.dist(v) / distthresh;
        if (randomizer == true) {
            if (joinchance < random(1)) line(d.x, d.y, v.x, v.y);
        } else {
            if (joinchance < random(0.1)) line(d.x, d.y, v.x, v.y);
        }
    }
}
void mousePressed() {
    mouseIsDown = true;
}
void mouseReleased() {
    mouseIsDown = false;
}
void keyReleased() {
    if (key == 'r' || key == 'R') {
        randomizer = false;
    }
    if (key == ' ') {
        background(255);
    }
    if (key == 's' || key == 'S') {
        println(turn);
        if (turn == 3) {
            save("myImage3.jpg");
            turn++;
        }
        if (turn == 2) {
            save("myImage2.jpg");
            turn++;
        }
        if (turn == 1) {
            save("myImage1.jpg");
            turn++;
        }
    }
    if (turn == 2) {
        myImage1 = loadImage("myImage1.jpg");
        myImage1 = myImage1.get(0, 370, 400, 30); //Get a portion of the canvas of player 1 
        background(255);
        image(myImage1, 0, 0); //setup background with portion of image 1 for player 2
    }
    if (turn == 3) {
        myImage2 = loadImage("myImage2.jpg");
        myImage2 = myImage2.get(0, 370, 400, 30); //Get a portion of the canvas of player 1 
        background(255);
        image(myImage2, 0, 0); //setup background with portion of image 2 for player 2
    }
}
