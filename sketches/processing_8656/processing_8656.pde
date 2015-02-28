
/*drawing software prototype 4

press and hold left mouse button to draw, 
middle to refresh and the hold right to draw with diffrent line thickness
use arrow keys to change and mod colors.
shift for varying thickness.

march 2010
meto
*/

float a;
float b; 
float c;


void setup() {
  size(900,500);
  background(255);
  frameRate(250);
             }

void draw() {
  if (mousePressed){
  line(mouseX,mouseY,pmouseX,pmouseY);
            }
else {
  }
}

void mousePressed () {
  
  // am trying to include page refresh function
 
  if (mouseButton == CENTER) {  
  background(a);
  a=random(210,255);
  }
  else {
  }

  //now trying to change stroke quality 

  if (mouseButton == RIGHT) {
    strokeWeight(b);
    b=random(1,9);
  }
  else {
    strokeWeight(1);
  }
}  

// now trying to incorporate key and color

void keyPressed () {
  if (keyCode == UP){
  stroke(225,0,0);
  }
  else if (keyCode == RIGHT) {
    stroke(0,225,0);
  }
                                     /* multi colored lines with the arrow keys */
  else if (keyCode == LEFT) {
    stroke(0,0,225);
  }                                    
  else if (keyCode == DOWN){
    stroke(0);
  }


// now trying variations


  if (keyCode == SHIFT) {       // code taken from originals line varying thickness
 
  c = abs(pmouseX-mouseX); 
  if (c >10)  {                

    strokeWeight(50);              
    
  }                                     /* press and hold shift while moving mouse*/ 
  else 
  {
 
    strokeWeight (c);       
  }
  line(pmouseX,pmouseY,mouseX,mouseY);
  }

}




