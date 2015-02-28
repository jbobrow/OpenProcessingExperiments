
/**
* Notes:
* Quick exercise in subtle color shifts and text transparency.
* Everything is driven by a simple counter that resets when the mouse button is clicked.
 */

PFont fontA;
float duskColor = 60.; //fill value for word "Dusk"
int lastTime = 0;

  
void setup() 
{
  size(400, 400);
  //background(102);
  noStroke(); //what's the command to disable borders on objects?
  

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("BankGothic-Medium-48.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);

 
}

void draw() {
  int currentTime = millis();
  if (currentTime > lastTime+60) {
   updateFill();
  // updateSky();
    lastTime = currentTime;
  }
  
  //draw earth
//color earth = color(0, 0, 100);
fill(0, 0, 100. - duskColor * 0.05);
rect(0, height/1.625, width, height); //tried changing size of rect using duskColor float but motion was always choppy

//draw sky
//color sky = color(0, 10, 150);
fill(0, 10. - duskColor * 0.035, 150. - duskColor * 0.035);
rect(0, 0, width, height/1.625);
 
//"dusk"  
 fill(duskColor, duskColor, duskColor, 50 - duskColor * 0.1); // Use fill() to change the value or color of the text
  textAlign(CENTER, CENTER);
  text("DUSK", width/2, height/1.655);
  
  
  //"dusk"  2
 fill(duskColor - 30., duskColor - 30., duskColor - 30., 30 - duskColor * 0.1); // Use fill() to change the value or color of the text
  textAlign(CENTER, CENTER);
  text("DUSK", width/1.98, height/1.645);

}

void updateFill()
{
   
 duskColor += 0.5;
// println(duskColor);
}

void mousePressed() {
  duskColor = 60.; //how to make the animation begin again when mouse is pressed?
}


