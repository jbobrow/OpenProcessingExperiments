
// Processing with Seb_L01
// Simon's 'Planet Eye' 
// Ver. 001

// VARIABLES
PFont f;
float eyeBound, pupilAng, starD;
int starCount = 150;
String footnote = "Simon's 'Planet Eye'";

void setup() {

  size(600, 600);
  smooth();
  noStroke();
  background(#000000);

  drawStarfield();

  f = createFont("Georgia", 18, true);
  textFont(f);
  fill(#FFFFFF);
  text(footnote, 50, 550);
  
}

void draw() {

  // Draw shiny eyeball
  fill(#DDDDDD);
  ellipse(300, 300, 200, 200);
  fill(#FFFFFF);
  ellipse(305, 300, 190, 190);
  
  // Draw pupil and give it behaviour
  fill(#000000);

  if (mouseX == 0 && mouseY == 0) { // Mouse has not been moved

    // Move pupil to look at footnote    
    pupilAng = atan2(550 - 300, 50 - 300);
    
    pushMatrix();
    translate(300, 300);
    rotate(pupilAng);
    ellipse(80, 0, 40, 40);
    popMatrix();
    
  } else { // Mouse has been moved

    eyeBound = dist(mouseX, mouseY, 300, 300);

    if (eyeBound <= (100 - 20)) { // Mouse within the eyeball

      ellipse(mouseX, mouseY, 40, 40);
      
    } else { // Mouse outside the eyeball

      pupilAng = atan2(mouseY - 300, mouseX - 300);

      pushMatrix();
      translate(300, 300);
      rotate(pupilAng);
      ellipse(80, 0, 40, 40);
      popMatrix();
      
    }

    // Blink
    if (mousePressed) {

      fill(#DDDDDD);
      ellipse(300, 300, 200, 200);
      
    }

    // Debug
    // println("eyeBound = " + eyeBound);
    // println("pupilAng = " + eyeBound);
    
  }
  
}

// FUNCTIONS
void drawStarfield() {

  for (int i = 0; i < starCount; i++) {

    starD = random(5, 10);

    fill(#FFFFFF, random(100, 200));
    ellipse(random(600), random(600), starD, starD);
    
  }
  
}


