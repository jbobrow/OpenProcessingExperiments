

/* 
 Move mouse to draw.
 'S' key to change color.
 'A' key to clear.
 'D' and 'C' keys to change width.
 */


int wid, len;
boolean aPressed, sPressed, dPressed, cPressed, zPressed, xPressed, qPressed;



void setup()
{
  size(700, 700);
  wid = 20;
  len = 20;
  noStroke();
  smooth();
  background(0);
  aPressed = sPressed = dPressed = zPressed = xPressed = qPressed = false;
}

void draw()
{

  /*fill(random(1+300), random(1+300), random(1+300));*/

  ellipse( mouseX, mouseY, wid, len);

  if (aPressed) background(0);
  
  if (aPressed) fill(255);

  if (sPressed) fill(random(1+300), random(1+300), random(1+300));

  if (dPressed) wid = wid + 1;

  if (cPressed) wid = wid - 1;

  if (zPressed) len = len + 1;

  if (xPressed) len = len - 1;
  
  if (qPressed) background(random(300), random(300), random(300));

  if (wid < 10) wid = wid + 1;

  if (wid > 100) wid = wid - 1;

  if (len < 10) len = len + 1;

  if (len > 200) len = len - 1;
  
  
  text(" Move mouse to draw.'S' key to change color.'A' key to clear.'D' and 'C' keys to change width.", 0, 670);
  text("'Z' and 'X' keys to change length.'Q' key to change background color", 0, 690);
  text("<(^^<) Property of Kenny Ma (>^^)>", 500, 690);
  text("(Idea givenaaaaaaa by Kenvin Nguyen)", 510, 670);

}



void keyPressed()
{
  if (key == 'a') aPressed = true;

  if (key == 's') sPressed = true;

  if (key == 'd') dPressed = true;

  if (key == 'c') cPressed = true;

  if (key == 'z') cPressed = true;

  if (key == 'x') cPressed = true;
 
  if (key == 'q') qPressed = true;
}

void keyReleased()
{
  if (key == 'a') aPressed = false;

  if (key == 's') sPressed = false;

  if (key == 'd') dPressed = false;

  if (key == 'c') cPressed = false;

  if (key == 'z') zPressed = false;

  if (key == 'x') xPressed = false;
  
  if (key == 'q') qPressed = false;
}



