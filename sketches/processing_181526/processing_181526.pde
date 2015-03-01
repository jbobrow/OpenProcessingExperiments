
/* CHAD P. HALL - EXERCISE 3: TIME

Small circle rotates at 60rpm (once every 1 second)
Medium circle rotates at 6rpm (once every 10 seconds)
Large circle rotates at 1rpm (once every 60 seconds)

ATTRIBUTIONS
// Concept inspired by Lali Puna's "Silver Light - EP" cover artwork
// Circle animation derived from Chapter 7 of "Getting Started with Processing" by Casey Reas & Ben Fry

Visualize the passing of 60 seconds.
Your animation should be compelling, 
should also effectively communicate range and status 
-- a viewer should:
  be able to "read" your creation
  have a reasonably good sense of how much time has elapsed and/or remains. 
  (It is up to you to determine what constitutes "a reasonably good sense".)
*/

/* -- SET UP GLOBAL INTEGERS ------*/
  float diam = 18; //smallest circle diameter
  float time = millis(); //current time
  
  float smangle = radians(270); //angle starting point for small circle
  float mdangle = radians(270); //angle starting point for small circle
  float lgangle = radians(270); //angle starting point for small circle
  float smspeed = 0.1; //speed for small circle is one rotation per second
  float mdspeed = smspeed/10; //speed for medium circle is one rotation per 10 seconds
  float lgspeed = mdspeed/6; //speed for large circle is one rotation per 60 seconds
  // float offset = 320;
  float scalar = diam; //defines arc path of circle movement
  
  //DEFAULT COLORS
  float white = 255;
  float gray = 76; //about 30% black
  
  float currentCol;
  float destCol;
  float smdampen = 0.4;
  

void setup() {
  
  size(640, 360); //define the canvas/window size
  smooth();
  noStroke();
  
  currentCol = gray;
  destCol = white;
  
}

void draw() {
  background(white); //make background white
  stroke(gray); //add stroke
  strokeWeight(1); //stroke width
  noFill(); //remove fill from circles


  /* -- LINES -------------------- */
/*  
  stroke(gray); //change stroke color
  line(54, 63, 54, height - 27); // draw vertical line; first from the right
  line(126, 54, 126, height - 18); //draw vertical line; second from the right
*/  
  
  /* -- RIGHT-SIDE FILL CIRCLES -- */
/*  
  for(int i = 72; i<333; i = i + 28){ //begin loop
    ellipse(27, i, diam, diam); //draw outlined small circles
  } //end loop
  
  
  for(int j = 72; j<342; j = j + 50){ //begin loop
    ellipse(90, j, diam * 2, diam * 2); //draw outlined medium circles
  } //end loop
*/
  
/* ATTEMPT AT STEPPED CIRCLE FILLS 
  for(int i = 72; i <= 63 + (28 * (time / 1000)); i = i + 28){ //begin loop // i < 333
    fill(gray);
    ellipse(27, i, diam, diam); //draw small circles
  } //end loop

    //Draw one circle
    //wait one second
    //draw two circles /time
*/ 

  /* -- PATH CIRCLES ----------- */
  fill(white); //fill with white
  
  //large circle
  ellipse(396, 198, diam * 24, diam * 24); //draw biggest circle path
  ellipse(180, 198, diam * 4, diam * 4); //draw biggest circle marker
  
  //medium circle
  ellipse(396, 198, diam * 16, diam * 16); //medium circle
  ellipse(252, 198, diam * 2, diam * 2); //draw medium circle marker
  
  //small circle
  ellipse(396, 198, diam * 11, diam * 11); //small circle
  ellipse(297, 198, diam, diam); //draw smallest circle marker

/*  ATTEMPT #1: Fill circle after every pass
  currentCol = millis() % 255; // Geoff's attempt: current Color = millis and the remainder after dividing by 255
  fill(currentCol); //fill will currentCol
  ellipse(297, 198, diam, diam); //draw smallest circle marker
*/ 

/* ATTEMPT #2: 
  if (millis() > time + 1000) {  //if time is greater than the last time it ran plus one second
    fill(currentCol); //fill with current color
    ellipse(297, 198, diam, diam); //draw smallest circle marker
    currentCol = currentCol + (destCol - currentCol) * smdampen; //next step in the fade process
    time = millis();
  }
  else {
    fill(currentCol);
    ellipse(297, 198, diam, diam); //draw smallest circle marker
  }
*/

  
  /* -- MOVING CIRCLES ---------- */
  fill(gray); //fill circles with gray
  noStroke(); //remove stroke
  
  //large circle
  float o = 396 + sin(lgangle) * (scalar * 12); //x value is changes based off of sin() and arc of circle
  float p = 198 + cos(lgangle) * (scalar * 12); //y value is changes based off of cos() and arc of circle
  ellipse(o, p, diam * 4, diam * 4); //draw largest moving circle
  lgangle += lgspeed; //lgangle = lgangle + lgspeed - moves circle to next point when drawn again
  
  //medium circle
  float m = 396 + sin(mdangle) * (scalar * 8); //x value is changes based off of sin() and arc of circle
  float n = 198 + cos(mdangle) * (scalar * 8); //y value is changes based off of cos() and arc of circle
  ellipse(m, n, diam * 2, diam * 2); //draw medium moving circle
  mdangle += mdspeed; //mdangle = mdangle + mdspeed - moves circle to next point when drawn again
  
  //smallest circle
  float x = 396 + sin(smangle) * (scalar * 5.5); //x value is changes based off of sin() and arc of circle
  float y = 198 + cos(smangle) * (scalar * 5.5); //y value is changes based off of cos() and arc of circle
  ellipse(x, y, diam, diam); //draw smallest moving circle
  smangle += smspeed; //smangle = smangle + smspeed - moves circle to next point when drawn again
  
  
  /* -- RECTANGLES --------------- */
  
  fill(gray); //fill with dark gray
  rect(0, 18, 126, 18); //draw uppper-left rectangle
  rect(width - 126, height - 36, 126, 18); //draw bottom-right rectangle
  
  
  println(time); //print current millis() in terminal
}



