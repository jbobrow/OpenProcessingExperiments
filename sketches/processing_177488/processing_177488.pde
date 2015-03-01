
/*
Attempt at a rudimentary mirror drawing game
 How to use it :
 1) Start by drawing what you feel like in the upper part of the screen by clicking and dragging your mouse.
 2) When you are done, you have to draw in mirror in the lower part, as best as you can to match what you previously sketched.
 It will probably look ugly, but it is somewhat fun ; try it, it is not that easy.
 3) Save your art/scribble by pressing "S".
 4) Well, you can also not follow these rules and do whatever you like with it!
 */

// global variables : none

// setup
void setup () {
  size(900, 900);
  colorMode(HSB, 360, 100, 100, 100); 
  background(360); //white
}

void draw () {
  if (keyPressed == false) { // normal mode if you don't press any key
    if (mouseY <= height/2) { // in the upper part of the screen
      if (mousePressed) { // you draw by clicking
        line(0, height/2, width, height/2); // the "mirror" line ; I'd have put it in the setup if the assignment didn't require an initial blank canvas
        strokeWeight(10);
        stroke(250, 250); // light grey
        point(mouseX, mouseY); // draw your sketch point by point
      }
    } else { // in the lower part of the screen (mirror)
      if (mousePressed) { // you also draw by clicking
        strokeWeight(5); // but the points are more precise
        stroke(125, 285, 38, 50); // green color so you can see what you are doing on top of the previous sketch
        point(mouseX, height-mouseY); // what you draw is mirrored in the upper part of the screen.
      }
    }
  } else { // BONUS MODE! : hold any key (well, avoid 'S' if you can) to switch to this mode : vertical mirror
    if (mouseX <= width/2) { // in the left part of the screen
      if (mousePressed) { // 
        line(width/2, 0, width/2, height); 
        strokeWeight(10);
        stroke(250, 250); 
        point(mouseX, mouseY); 
      }
    } else { // in the right part of the screen (mirror)
      if (mousePressed) { 
        strokeWeight(5); 
        stroke(125, 285, 38, 50); 
        point(width-mouseX, mouseY); // what you draw is mirrored in the left part of the screen.
      } //(you can even combine the two modes for added difficulty)
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); // save your work
}

/*
 If an advanced user reads this:
 I tried to make the drawing of the first part (grey points) erasable to the user by pressing a key before saving it.
 I searched processing forums and reference and understood that I needed to create a different layer/buffer in which I could
 store this part to make it independant and clear() it afterwards. And for this it seemed that I had to use a Pgraphics object with  :
 PGraphics pg; in the global variables
 pg = createGraphics( width, height/2); in the setup
 and in draw :
 pg.beginDraw();
 pg.stroke();
 pg.point();
 pg.endDraw();
 image(pg.get(0,0,width,height/2), 0,0);
 But I could not make it work properly.
 If someone has any tip about this, it would be greatly appreciated, thanks!
 */

