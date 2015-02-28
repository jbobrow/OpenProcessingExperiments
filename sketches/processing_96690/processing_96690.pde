
int rollResult, currentDie;
PImage d4blue, d6blue, d8blue, d10blue, d12blue, d20blue, d100blue, dicebw;
PFont bookman;

void setup() {
    size(930, 600);
    smooth();

    rollResult = 0;
    currentDie = 0;

    d4blue   = loadImage("images/d4blue.png");
    d6blue   = loadImage("images/d6blue.png");
    d8blue   = loadImage("images/d8blue.png");
    d10blue  = loadImage("images/d10blue.png");
    d12blue  = loadImage("images/d12blue.png");
    d20blue  = loadImage("images/d20blue.png");
    d100blue = loadImage("images/d100blue.png");
    dicebw   = loadImage("images/dicebw.png");

    bookman  = loadFont("BookAntiqua-Bold-48.vlw");
}

void draw() {
    drawDice();
    drawText();
    if (currentDie != 0)
        drawButtons();
    drawRollResult();
}

void drawDice() {
    background(255);
    image(dicebw, 0, 0);
    if (currentDie == 4 || touchingD4()) {
        image(d4blue, 300, 400);
    }
    if (currentDie == 6 || touchingD6()) {
        image(d6blue, 200, 200);
    }
    if (currentDie == 10 || touchingD10()) {
        image(d10blue, 0, 0);
    }
    if (currentDie == 20 || touchingD20()) {
        image(d20blue, 0, 200);
    }
}

void drawText() {
    stroke(0);
    strokeWeight(3);
    fill(0, 0, 0, 0);
    rect(630, 20, 280, 560); 
    line(630, 65, 910, 65);

    strokeWeight(1);
    rect(625, 15, 290, 570);
    //line(630, 60, 910, 60);
    //line(630, 70, 910, 70);

    fill(0);
    textFont(bookman);
    textSize(32);
    text("Polyhedral Dice", 650, 50);

    textSize(14);
    text("Current Die:", 650, 100);

    if (currentDie != 0) {
        text("D" + currentDie, 740, 100);
    }
    else {
        text("none", 740, 100);
    }
}

void drawButtons() {
    //roll button
    stroke(0);
    strokeWeight(3);
    if (touchingRollButton()) 
        fill(0, 250, 250);
    else
        fill(200);
    rect(650, 120, 240, 100);

    textFont(bookman);
    textSize(32);
    fill(0);
    text("Roll!", 735, 180);
}

void drawRollResult() {
    fill(0);
    textFont(bookman);
    textSize(32);
    text("Result: " + rollResult, 650, 280);
}


void mouseClicked() {
    if (touchingD4()) {
        currentDie = 4;
    }
    else if (touchingD6()) {
        currentDie = 6;
    }
    else if (touchingD10()) {
        currentDie = 10;
    }
    else if (touchingD20()) {
        currentDie = 20;
    }
    else if (touchingRollButton()) {
        // roll the dice!
    }
}

boolean touchingD4() {
    return (300 <= mouseX && mouseX <= 500 && 400 <= mouseY && mouseY <= 600);
}

boolean touchingD6() {
    return (200 <= mouseX && mouseX <= 400 && 200 <= mouseY && mouseY <= 400);
}

boolean touchingD10() {
    return (100 <= mouseX && mouseX <= 300 && 0 <= mouseY && mouseY <= 200);
}

boolean touchingD20() {
    return (0 <= mouseX && mouseX <= 200 && 200 <= mouseY && mouseY <= 400);
}

boolean touchingRollButton() {
    return (650 <= mouseX && mouseX <= 890 && 120 <= mouseY && mouseY <= 220);
}


