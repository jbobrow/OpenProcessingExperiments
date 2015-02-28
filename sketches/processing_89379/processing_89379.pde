
PImage trees;
String message = "gusts";
float x, y; // X and Y coordinates of text
float angle = 0.0;

void setup() {
  size(500, 500);
  textFont(createFont("Arial", 36));
  textAlign(CENTER, CENTER);
  trees = loadImage("tree.jpg");
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(100, 100, 200);
  rect(0, 0, width, height);
  image(trees, 0, 0);

    pushMatrix();
    textAlign(CENTER);
    fill(000);
    scale(0.6);
    translate(width, height/2);
    rotate(angle);
    translate(width, height);
    rotate(angle);
    text("gusts", width/3, height/3);
    translate(width, height);
    rotate(angle);
    text("gusts", 2*width/3, 2*height/3);
    translate(width, height);
    rotate(angle);
    text("gusts", width/3, 2*height/3);
    translate(width, height);
    rotate(angle);
    text("gusts", 2*width/3, height/3);
    if (mousePressed){
    angle += 0.05;
    }
    else{angle +=0.01;}
    popMatrix();
 
}



