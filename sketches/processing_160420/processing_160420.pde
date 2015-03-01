
// Trying to create some shapes, rectangles and ellipses, but using a different style of drawing.
// This is a first try to draw something in a way that resemble to be human drawed
// Traits imprecise and with different colors to simulate different pressures of the pen alternates to compose the perimeter of the form 
// Palette is made with shades of gray to simulate a pen or a pencil but it can be easly replaced with colors.
// Slow framerate help to see shapes drawn
// Press any key to restart from a white canvas.

// define number of different lines used to draw any shape.
public static final int SHAPE_LINES = 20;

// Palette
color [] palette = {
  #D0D0D0, #B0B0B0, #909090, #707070, #505050,
  #404040, #303030, #202020, #101010, #000000
};

// Setup function, define size of canvas and framerate.
void setup() {
  size(800,600);
  frameRate(10);
  initialState();
}

// Initialize all to a clear start state.
// useful to restart with any mouse click
public void initialState() {
  background(255);
}

// Draw function
void draw() {
// This commented lines can be uncommented to slowly fade background  
/*  
  fill(255,255,255,10);
  noStroke();
  rect(0,0,width,height);
//*/  
  // we dont need fill
  noFill();
  // Choose if next shape can be a rect or an ellipse
  if (random(1)<0.5) {
    // Random placed rect
    handMadeRect(random(width + 200) - 200, random(height + 200) - 200, random(100, 300), random (100,300));
  } else {
    // Random placed ellipse
    handMadeEllipse(random(width + 200) - 200, random(height + 200) - 200, random(100, 300), random (100,300));
  }
}

// on any mouse button pressure, re-init the sketch.
void mousePressed() {
  initialState();
}

// draw an "hand Made like" rect
public void handMadeRect(float x, float y, float w, float h) {
  // for each line i have to draw
  for (int i = 0; i < SHAPE_LINES; i++) {
    // pick a random color
    color c = palette[int(random(palette.length))];
    stroke(c);
    strokeWeight(random(2));
    // determine a random stroke
    if (random(1) < 0.5) {
      // Vertical line
      if (random(1) < 0.5) {
        // line at x coords 
        line(x + random(-3,3), y + random(-10, h+10), x + random(-3,3), y + random(-10, h+10));  
      } else {
        // line at x + w coords
        line(x + w + random(-3,3), y + random(-10, h+10), x + w + random(-3,3), y + random(-10, h+10));  
      }
    } else {
      // horizontal line
      if (random(1) < 0.5) {
        // line at y coords 
        line(x + random(-10, w+10), y + random(-3,3), x + random(-10, w+10), y + random(-3,3));  
      } else {
        // line at y + w coords
        line(x + random(-10, w+10), y + w + random(-3,3), x + random(-10, w+10), y + w + random(-3,3));  
      }
    }
  }
}

// Draw an "hand made like" ellipse.
public void handMadeEllipse(float x, float y, float w, float h) {

  // for each line i have to draw
  for (int i = 0; i < SHAPE_LINES; i++) {
    // pick a random color
    color c = palette[int(random(palette.length))];
    stroke(c);
    strokeWeight(random(2));
    // determine a random stroke, angle start on any value between 0 an TWO_PI (TWO_PI is a full circular or 360 degree angle in radiant)
    float angleStart = random(TWO_PI);
    // The stroke lenght, in radiant, is determined by an angle between 0,2 and HALF_PI (HALF_PI is 90 degree in radiant) 
    float angleEnd = angleStart + random(0.2, HALF_PI);
    // Draw the arc.
    arc(x + random(-3,3), y + random (-3,3), w + random(-3,3), h+random(-3,3), angleStart, angleEnd);
  }
}
