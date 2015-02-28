
//  Original sketch found on slide 14 of
//  the interaction PDF found on the
//  wikispaces.

PImage img1;
float x = -15; // x position variable
float y = 397.0; // y position variable
float x2 = 615; // x position variable
float y2 = 185.0; // y position variable
float speed = 2.0; // value for speed
float speedx = 7.0; // value for speed
PFont font;

void setup(){
 size(600,397);
 smooth();
 noStroke();
 img1 = loadImage("traffic.jpg");
 frameRate(60);
 image(img1,0,0);
 font = loadFont("Neuton-Extrabold-48.vlw");
 textFont(font);
}

void draw(){
 tint(255, 255, 255, 50);
 image(img1,0,0);
 if (mouseX < width/2) {
     fill(226,187,109,240);
     text("bike", x, y); // draw text based on variables
     fill(95,44,17,250);
     text("car", x/1.2, y/1.2); // draw text based on variables
     x += speedx; 
     y -= speed; // increase value to move text
       if (y < 0 || x > 600){
         y = 397;
         x = -30;
       }
  }
 else if (mouseX > width/2) {
     fill(226,187,109,240);
    text("truck", x2, y2); // draw circle based on variables
    fill(70,99,69,230);
    text("bus", x2/0.9, y2/0.9); // draw circle based on variables
     x2 -= speedx; 
     y2 += speed; // increase value to move circle
       if (y2 > 397 || x2 < 0){
         y2 = 157;
         x2 = 630;
       }// move it to above top of window with a negative position
}

}


