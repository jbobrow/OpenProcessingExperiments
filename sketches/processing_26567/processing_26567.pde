

// code made by Z3191798_ BITNA HAN
 
/* Reference
 Learning Processing
 Daniel Shiffman
 http://www.learningprocessing.com*/
  
 /* Reference
Processing A Programming Handbook for Visual Designers and Artist
Casey Reas and Ben Fry
*/
 
/* Reference
www.processing.org*/
 
//making flower -
 
 
float radius = random(50,100);
float angle = 1;
float i=0;
 
float value = random(30) ;

float R = random (0, 255);
float G = random (0, 255);
float B = random (0, 255); //random colour 
 
float r;
float g;
float b;
 
float c;
float m;
float y;
 
void setup(){
   
  size(600,600);
  colorMode (RGB);
  background(255);
  frameRate(2000);
  strokeWeight(1);
  smooth();
}
 
 
void draw(){
   
  angle++; //increase angle
 
  float flow= radians(angle);
  float a = mouseX-radius * cos(flow*0.2);
  float b = mouseY-radius * sin(flow*0.09); // flowers leaves
 
  noFill();
  stroke(255,5);
  point(a+3, b);
 
  stroke(R,G,B,3);
  line(a,b, 300, 300);

}

// random colour
void mouseMoved()
{
  value = value + 5;
  if (value > 200)
  {
  R= random(100,200)+r-c;
  G= random(80,150)+g-m;
  B= random(160,190)+b-y;
  }
}


void keyPressed(){
  switch(key)
  {
  case 'r':
  r +=10; break;
  case 'g':
  g +=10;  break;
  case 'b':
  b +=10; break;
   
  case 'c':
  c -=10; break;
  case 'm':
  m -=10; break;
  case 'y':
  y -=10; break;
   
  }
  
  if ((key == 'r') || (key == 'R')) //resetting key'r' pressed
    setup();
    
    if ((key=='f') || (key == 'F')){
      noStroke();
    fill(255, 100);
    rect(0, 0, width, height); ////fading out key'f' pressed
  }
}

