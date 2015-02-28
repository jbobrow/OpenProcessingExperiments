
String message = "Punk";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
float angle=0.0;
float jitter;
PImage img;

void setup() {
  size(800, 800);
  
  // Create the font
  img=loadImage("BG.jpg");
  textFont(createFont("Sequi-Bold", 48));
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  imageMode(CENTER);
  image(img,height/2,width/2);
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(204, 120);
  rect(0, 0, width, height);
  //scale(sin(angle)+2);
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
   
    x += random(-0.5,0.5 );
    y += random(-50, 50);
    jitter = random(0.0001,0.1);
  
}

  
  fill(255);
  text("CAN'T TOUCH THIS", x, y);
   
}



