
/*
* Press a for brush 1, a conventional brush
* Press s for brush 2, a diamond/ring pattern brush
* Press d for brush 3, a crazy brush!
* Press f for brush 4, a conventional but color-changing brush
* Press r with any brush to reset the canvas/change the background to a random color
* Press + while using brush 1 or 4 to increase the stroke width
* Press - while using brush 1 or 4 to decrease the stroke width
*/

int currentBrush = 1;
int strokeWidth = 5;
color brushColor = color(random(255), random(255), random(255));
PImage ring;
PImage dmnd;
PImage dmndBlue;
PImage dmndPurple;
PImage dmndPink;
PImage dmndYellow;
PImage dmndRed;

void setup() {  // this is run once.   
    size(500, 500); 
    background(255);

    ring = loadImage("http://i.imgur.com/DEUWyGK.png");
    dmnd = loadImage("http://i.imgur.com/sNYO1VR.png");
    dmndBlue = loadImage("http://i.imgur.com/wUkb3J7.png");
    dmndPurple = loadImage("http://i.imgur.com/AEWC89i.png");
    dmndPink = loadImage("http://i.imgur.com/fqFJE81.png");
    dmndYellow = loadImage("http://i.imgur.com/TN7PPjT.png");
    dmndRed = loadImage("http://i.imgur.com/FlbW6gJ.png");
} 

void draw() {  // this is run repeatedly.  

    if (keyPressed) {
        
        if (key == 'a') {
            currentBrush = 1;
        }
        if(key == 's') {
            currentBrush = 2;
        }
        if(key == 'd') {
            currentBrush = 3;
        }
        if(key == 'f') {
            currentBrush = 4; 
        }
        if(key == '+') {
            strokeWidth = strokeWidth + 1;
        }
        if(key == '-') {
            strokeWidth = strokeWidth - 1;
        }
        if(key == 'r'){
            background(random(255),random(255),random(255));
        }
    }
    
    if (mousePressed == true) {
        if (mouseButton == LEFT) {
            if(currentBrush == 1) {
                strokeWeight(strokeWidth);
                stroke(brushColor);
                line(pmouseX, pmouseY, mouseX + 1, mouseY + 1);
                }
                
            if (currentBrush == 2) {
                image(ring, pmouseX + 5, pmouseY + 5, random(-150, 150), random(-150, 150));
                image(dmnd, pmouseX - 20, pmouseY - 20, 50, 50);
                image(dmndBlue, pmouseX - 60, pmouseY - 60, 50, 50);
                image(dmndPink, pmouseX + 20, pmouseY - 55, 50, 50);
                image(dmndYellow, pmouseX - 60, pmouseY + 20, 50, 50);
                image(dmndRed, pmouseX +20, pmouseY + 20, 50, 50);
                //image(dmndPurple, pmouseX + 10, pmouseY + 10, random(-40, 40), random(-40, 40));
                }
                
            if (currentBrush == 3) {
                strokeWeight(random(5));
                stroke(random(200), random(180), random(255));
                fill(random(200), random(180), random(255), 30);
                rect(random(pmouseX), random(pmouseY), mouseX - random(100), mouseY + random(100));
                rect(random(pmouseX), random(pmouseY), mouseX - random(100), mouseY - random(100));
                ellipse(random(pmouseX), random(pmouseY), mouseX - random(100), mouseY + random(100));
                ellipse(random(pmouseX), random(pmouseY), mouseX - random(100), mouseY - random(100));
                }
                
            if(currentBrush == 4) {
                strokeWeight(strokeWidth);
                stroke(random(255),random(255),random(255));
                line(pmouseX, pmouseY, mouseX + 1, mouseY + 1);
                }
            }
        }
    }

