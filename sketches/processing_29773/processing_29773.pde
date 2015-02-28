
float line1X;
float line1Y;
float line2X;
float line2Y;
float line3X;
float line3Y;
float line4X;
float line4Y;
float line5X;
float line5Y;
float line6X;
float line6Y;

int timer = 0;

float s;
float a;

PFont font;

int mode = 0;

void setup() {
  size(800, 480);
  smooth();
  noCursor();
  ellipseMode(CENTER);
  textAlign(CENTER);

  font = loadFont("SynchroLET-100.vlw");


  line1X = int(random(0, width/6));
  line1Y = int(random(0, 12)) * 40;
  line2X = int(random(width/6, 2*width/6));
  line2Y = int(random(0, 12)) * 40;
  line3X = int(random(2*width/6, 3*width/6));
  line3Y = int(random(0, 12)) * 40;
  line4X = int(random(3*width/6, 4*width/6));
  line4Y = int(random(0, 12)) * 40;
  line5X = int(random(4*width/6, 5*width/6));
  line5Y = int(random(0, 12)) * 40;
  line6X = int(random(5*width/6, 6*width/6));
  line6Y = int(random(0, 12)) * 40;
  s = 1;
  a = .0025;
}

void mousePressed() {
  if(mode == 0) {
    mode = 1;
  }
  else if(mode == 2) {
    reset();
    mode = 1;
  }
}

void reset() {
  timer = 0;
  s = 1;
  line1X = int(random(0, width/6));
  line1Y = int(random(0, 350));
  line2X = int(random(width/6, 2*width/6));
  line2Y = int(random(0, 350));
  line3X = int(random(2*width/6, 3*width/6));
  line3Y = int(random(0, 350));
  line4X = int(random(3*width/6, 4*width/6));
  line4Y = int(random(0, 350));
  line5X = int(random(4*width/6, 5*width/6));
  line5Y = int(random(0, 350));
  line6X = int(random(5*width/6, 6*width/6));
  line6Y = int(random(0, 350));
}

void draw() {
  println(s);
  background(0);
  noStroke();

  // Start Screen
  if (mode ==0) {
    fill(19, 211, 187, 50);
    textFont(font, 70);
    text("DODGE BALL", 400, 200);
    textFont(font, 69);
    text("DODGE BALL", 400, 200);
    textFont(font, 68);
    text("DODGE BALL", 400, 200);
    textFont(font, 67);
    text("DODGE BALL", 400, 200);
    textFont(font, 66);
    text("DODGE BALL", 400, 200);
    fill(19, 211, 187);
    textFont(font, 24);
    text("use mouse to control ball and avoid", 400, 230);
    text("oncoming walls", 400, 250);
    fill(255, 253, 82, 70);
    textFont(font, 34);
    text("To Start Game Click Mouse", 400, 290);
    textFont(font, 33.5);
    text("To Start Game Click Mouse", 400, 290);
    textFont(font, 33);
    text("To Start Game Click Mouse", 400, 290);
  } 
  else if( mode == 1) {

    // Circle
    fill(19, 211, 187, 100);
    float mx = constrain(mouseX, 25, width - 25);    
    ellipse(mx, 450, 50, 50);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 45, 45);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 40, 40);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 35, 35);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 30, 30);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 25, 25);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 20, 20);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 15, 15);
    fill(19, 211, 187, 100);
    ellipse(mx, 450, 10, 10);

    //LINES
    s = s + a;
    strokeWeight(2.5);

    // Line 1
    line1Y = line1Y+s;
    if (line1Y > 470) {
      line1X = int(random(0, width/6));
      line1Y = random(-50, 0);
    }
    if (circleLineIntersect(line1X, line1Y, line1X+150, line1Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line1X, line1Y, line1X+150, line1Y);
 
   

    // Line 2
    line2Y = line2Y+s;
    if (line2Y > 470) {
      line2X = int(random(width/6, 2*width/6));
      line2Y = random(-50, 0);
    }
    if (circleLineIntersect(line2X, line2Y, line2X+150, line2Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line2X, line2Y, line2X+150, line2Y);

    // Line 3
    line3Y = line3Y+s;
    if (line3Y > 470) {
      line3X = int(random(2*width/6, 3*width/6));
      line3Y = random(-50, 0);
    }
    if (circleLineIntersect(line3X, line3Y, line3X+150, line3Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line3X, line3Y, line3X+150, line3Y);

    //Line 4
    line4Y = line4Y+s;
    if (line4Y > 470) {
      line4X = int(random(3*width/6, 4*width/6));
      line4Y = random(-50, 0);
    }
    if (circleLineIntersect(line4X, line4Y, line4X+150, line4Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line4X, line4Y, line4X+150, line4Y);

    //Line 5
    line5Y = line5Y+s;
    if (line5Y > 470) {
      line5X = int(random(4*width/6, 5*width/6));
      line5Y = random(-50, 0);
    }
    if (circleLineIntersect(line5X, line5Y, line5X+150, line5Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line5X, line5Y, line5X+150, line5Y);

    //Line 6
    line6Y = line6Y+s;
    if (line6Y > 470) {
      line6X = int(random(5*width/6, 6*width/6));
      line6Y = random(-50, 0);
    }
    if (circleLineIntersect(line6X, line6Y, line6X+150, line6Y, mouseX, 450, 25) == true) {
      mode = 2;
    } 
    else {
      stroke(255, 253, 82);
    }
    line(line6X, line6Y, line6X+150, line6Y);



    timer += 1;
    fill(19, 211, 187);
    textFont(font, 16);
    text(timer, 20, 15);
  }

  else if(mode ==2) {
    fill(255, 253, 82, 100);
    textFont(font, 95);
    text("Game Over", 400, 200);
     textFont(font, 93);
    text("Game Over", 400, 200);
     textFont(font, 91);
    text("Game Over", 400, 200);
    fill(19, 211, 187, 50);
    textFont(font, 45);
    text("Click mouse to play again", 400, 245);
    textFont(font, 44.5);
    text("Click mouse to play again", 400, 245);
    textFont(font, 44);
    text("Click mouse to play again", 400, 245);
    fill(255, 253, 82, 50);
    textFont(font, 70); 
    text(timer, 400, 315);
    textFont(font, 68); 
    text(timer, 400, 315);
    textFont(font, 66); 
    text(timer, 400, 315);
     textFont(font, 64); 
    text(timer, 400, 315);
     textFont(font, 63); 
    text(timer, 400, 315);
  }
}


