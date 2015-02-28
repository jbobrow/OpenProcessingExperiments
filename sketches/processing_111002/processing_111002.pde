
// Derived from the last job, this one implements 
// interactivity by drawing lines and circles according 
// to the mouse position, and speckles the typed letters 
// across the screen.
// Pressing Enter the screen is saved, and pressing the 
// DELETE key, the sketch is restarted and a new pattern 
// is displayed, and on mouse's click the color pattern is changed.

// colours patterns
color[] blues = {#518BD1, #6338E8, #8AE8E1, #1ADEC3, #835ADE};
color[] reds = {#DE624E, #D65322, #E7E8E1, #E83316, #DE2753};
color[] yellows = {#FFFA9F, #D6C52D, #FF8E0F, #ABE821, #DE9927};
color[][] colours = {blues, reds, yellows};

// picking random color pattern. Within draw() this will be used
color[] currentColours = colours[int(random(3))];
color bgColor = currentColours[int(random(0,5))];

void setup() {
  size(800, 600);
  background(bgColor);
  //noLoop();
}

void draw() {   
  fill(#2C2C2C);
  noStroke();
  rect(-1, -1, width+2, 40);
  rect(-1, height-19, width+2, 20);
  fill(#B9B9B9);
  textSize(17);
  textAlign(CENTER, CENTER);
  text("click and move the mouse around, type to pop the letters, DELETE restart and ENTER saves", 400, 20);
}

void mouseMoved()
{  
    stroke(currentColours[int(random(0,5))], random(20,80));
    strokeWeight(int(random(21)));
    //noStroke();
    line(mouseX, mouseY, 
             int(random(-width/2, width*1.2)), int(random(-height/2, height*1.2)));
    
  float circleSize = random(10,300);
  //fill(currentColours[int(random(0,5))], random(0,10));
  noFill();
  stroke(currentColours[int(random(0,5))], random(10,60));
  ellipse(mouseX, mouseY, circleSize, circleSize);
}

void mousePressed()
{
  currentColours = colours[int(random(3))];
  bgColor = currentColours[int(random(0,5))];
  redraw();
}

void keyReleased()
{
  if (key == DELETE || key == BACKSPACE) {
    background(bgColor);
  }
  else if (key == ENTER) {
    saveFrame("screenshot.png");
  }
  else {
    fill(currentColours[int(random(0,5))], random(90,100));
    textSize(int(random(100, 200)));
    textAlign(CENTER, CENTER);
    text(key, int(random(width)), int(random(height)));  
  }
}


