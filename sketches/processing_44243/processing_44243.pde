
//  R.A. Robertson 2010.07 "Lissajous Draw" ~ www.rariora.org ~

PFont font; 
float x, y, seg, d, dim, space, angleX, angleY, amp, freq, xFactor, yFactor, grayVal;
boolean toggleLoop = true;

void setup() {
size (800, 600);
background(5, 10, 5);
font = createFont("Arial", 12, true);
smooth();
grayVal = 155;
seg = 200; // # segments (iterations). Used somewhat differently in draw vs for
d = 15; // diameter
dim = d; // reduce proportionally to diameter
space = 1.5; // spacing between segments
angleX = PI*.5; // Unit circle start position
angleY = PI*.5;
freq = .08; // Trig function frequency. Default = .08. Range .01 up to .1.
xFactor = 3; // Frequency multiplier. Sets essential ratios.
yFactor = 4;
amp = xFactor * 20; // Trig function amplitude. Default = 60.
x = width/2 - amp/2; // amp offsets from x and y, so this corrects offset.
y = height/2 - amp/2;
}

void draw() {

  noFill();
  stroke (grayVal, 7);

web();
  
  noFill();
  d = d - (dim/seg) % 100; // Reduce diameter proportional to # iterations
  x = x + sin(angleX) * amp; // amp * 1.8 to smooth the loops.
  y = y + sin(angleY) * amp;

  angleX = angleX + freq * xFactor; // Play with these ratios.
  angleY = angleY + freq * yFactor;

  ellipse (x, y, abs(d), abs(d));

//fill(5,10,5); noStroke();
//rect(0, 740, 60, height);
//textFont(font);
//fill(255);
//text("X = " + int(xFactor), 10, height - 40);
//text("Y = " + int(yFactor), 10, height - 20);

}

void web() {
  if (frameCount % 6000 == 0) 
  { 
    x = width/2; 
    y = height/2; 
    angleX = PI/2; 
    angleY = PI/2;
    xFactor = int(random(2, 9)); 
    yFactor = int(random(2, 9)); 
    d = 100; 
    amp = xFactor*20;
    stroke(grayVal = abs(grayVal - 155), 7);
    fill(random(125),random(125),random(125),6); 
    rect(0,0,width,height); 
  }
  if (xFactor == yFactor) {
    xFactor = xFactor + 1;
  }

}

// Mouse toggle code by amnon.owed
// http://forum.processing.org/topic/mouse-toggle-loop
// Place boolean toggleLoop = true; above setup.
void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
  if (mouseButton == RIGHT) {
    setup();
  }
}

