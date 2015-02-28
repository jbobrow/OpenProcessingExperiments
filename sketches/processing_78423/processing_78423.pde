


PImage img;

PFont font;
float angle = 0.0;
float r = random(5,30);

void setup(){
size(800,800);
smooth();
 img = loadImage("ny.jpg");
 image(img, 0, 0,803,800);
 noStroke();
font = loadFont("04b08-48.vlw");
textFont(font);
}

void draw(){
 
 pushMatrix();
 translate(mouseX, mouseY);
 rotate(angle);
 fill(#333555);
 textSize(10);
 text("WIND", mouseX,height/50);
 angle += 0.01;
 popMatrix();
 translate(mouseX, mouseY);
 rotate(angle);
 fill(255,0,0);
 textSize(12);
 text("SANDY", width/20, height/20);
angle -= 0.5;
}


