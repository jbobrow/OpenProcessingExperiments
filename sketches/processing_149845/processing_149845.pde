
/* Shim Sang Joon 
 201420086 
 */

/*import ddf.minim.*;
 
 Minim minim;
 AudioInput input;
 */


float c1, c2;     
float c1a = 1;   
float c2b = -1;  
float sW;

float x = 600, y = 600;
float x2 = 1, y2 = 1;
float xSpeed = 1, ySpeed = 2; 
float xSpeed2 = 1, ySpeed2 = 1;

boolean switchStroke = false;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

//===========================================
void setup() { 
  size(displayWidth, displayHeight);

  //minim = new Minim (this); ----- erase //
  //input = minim.getLineIn (Minim.MONO, 512);

  if (backGround) {
    background(#eeeeee);  
    stroke(0, 10);
  }
  if (!backGround) { 
    background(0);
    stroke(255, 30);
  }  
  title();
} 

//===========================================
void draw() { 
  //float d = input.mix.level();
  //sW = sW*0.9 + d*0.9;
  //sW=map(d, 0, 1, 1, 10);
  //strokeWeight(sW);

  noFill();

  if (mousePressed) {
    cursor(CROSS);
    x=lerp(x, mouseX, 0.01);
    y=lerp(y, mouseY, 0.01);
  }
  else {
    noCursor();
    x = x + xSpeed; 
    y = y + ySpeed;
  }

  x2 = x2 + xSpeed2;
  y2 = y2 + ySpeed2;

  if ((x > width) || (x < 0)) { 
    xSpeed = xSpeed * -1;
  } 
  if ((y > height) ||(y < 0)) { 
    ySpeed = ySpeed * -1;
  }
  if ((x2 > width) || (x2 < 0)) {
    xSpeed2 = xSpeed2 * -1;
  }
  if ((y2 > height) || (y2 <0 )) {
    ySpeed2 = ySpeed2 * - 1;
  } 

  if (switchStroke) {
    if (backGround) stroke(255, 10);
    if (!backGround) {
      stroke(c1, 255, c2, 30);
      c1 = c1 + c1a; 
      c2 = c2 + c2b;
    }
  }
  if (!switchStroke) {
    if (backGround) stroke(0, 10);
    if (!backGround) stroke(255, 30);
  }

  if (c1 < 0 || c1 > 255) { 
    c1a *= -1;
  } 
  if (c2 < 0 || c2 > 255) { 
    c2b *= -1;
  } 

  bezier(x, y, width-x, y2, x2, height-y, x2, y2);
}

//===========================================
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') switchStroke = !switchStroke;
  if (keyCode==BACKSPACE) setup();
  if (keyCode==TAB) {
    backGround = !backGround;
    setup();
  }
}
//===========================================
void title() { 
  if (backGround) fill(0);
  else fill(255);
  textAlign(RIGHT);
  text("Shim Sang Joon, iDrawing, Dynamic Media, 2014", width-50, height-20);
  textAlign(LEFT);
  text("TAB=black/color, BACKSPACE=clean, 1=Strokecolor Change ", 50, height-20);
}
