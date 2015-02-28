
/////////////////////////////////////////////////////////
///////////written by Daniel 15/8/11/////////////////////
/////////////////////////////////////////////////////////

/*left click for the ellipses to become out of control when 
the mouse doesnt move. Once moved you gain control for a short
time before the ellipses run away when you stop. To regain full
control, right click. ENJOY! */

    float x = 0;
    float y = 0;
    float diamX = 0;
    float diamY = 0;
    float mX = 0;
    float mY = 0;
    float v2 = 0;
    float v1 = 0;
    float xx = 0;
    float yy = 0;

void setup (){
    size (1000,1000);
    background (255);
    loop ();
    smooth ();
    frameRate (1000);
}
void draw()
{
    x = 700;
    y = 400;
    xx = 70;
    yy = 40;
    diamX = random (15);
    diamY = random (15);
    mX = random (15);
    mY = random (15);
    v1 = random (300);
    v2 = random (300);
 
    //noLoop();
    fill (0);
    //ellipse (x,y,10,10);
    ellipse (mouseX + mX*2,mouseY + mY*2,diamX,diamY);
    fill (255,255,255,20);
    rect (0,0,1000,1000);
  
  /*if (mousePressed) {   
     fill (255,0,0);
     ellipse (mouseX + xx*2,mouseY + yy*2 ,diamX,diamY);
   }*/
 
///////////////////////mouse functions//////////////////////////
  
if (mouseButton == RIGHT) {
    fill (0);
    ellipse (mouseX + mX*2,mouseY + mY*2,diamX,diamY);
  }
     /* }
if(mouseButton == RIGHT ) {
    fill (0);
    ellipse (mouseX,mouseY,diamX,diamY);
  }  */  

if (mouseButton == LEFT) {
    mouseX += v2 * 0.14 * cos(v1);
    mouseY += v2 * 0.14 * sin(v1);
    stroke(0);
  }
if (x > v1+11) {
    if (abs(xx) == xx) xx *= -1.0;
    x = v1-11;
  }
if (x < -11) {
    if (abs(xx) != xx) xx *= -1.0;
    x = 11;
  }
if (y < -11) {
    if (abs(yy) != yy) yy *= -1.0;
    y = 11;
  }
if (x > v2+11) {
    if (abs(yy) == yy) yy *= -1.0;
    xx *= 0.6;
    y = v2-11;
  }
}
/*/ trying to figure how to contain the spiratic movements to 
within the box,almost like a particle system and have them 
bounce back. ^^my attempt haha /*/

