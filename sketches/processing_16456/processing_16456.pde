
 /**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
PFont fontA; 
PImage a;  // Declare variable "a" of type PImage
int countyes; 
int countno; 
int backdrop; 
int mousexval;
int mouseyval;
float coverage;
boolean mousemode;

void setup() {
  a = loadImage("shape10.png");  // Load the image into the program  
  fontA = loadFont("AgencyFB-Reg-20.vlw");
  textAlign(CENTER);
  countno = 0; countyes = 0; mousemode = false;
  size(a.width, a.height);
  loadPixels();
  backdrop = pixels[0];

  // Set the font and its size (in units of pixels)
  textFont(fontA, 20);}

void draw() {
  a.loadPixels();
  loadPixels();
  rectMode(CENTER);
  mousexval = int(mouseX/5)*5;
  mouseyval = int(mouseY/5)*5;
  if (mousePressed && !mousemode)
  {
    mousemode = false;
    if(mouseX < a.width && mouseY < a.height && mouseX >= 0 && mouseY >= 0)
    {
      if (pixels[mousexval+(mouseyval*width)] == backdrop)
      {
        if (a.pixels[mousexval+(mouseyval*a.width)] < -1) 
        {
          fill(0); 
          stroke(0);
          countyes++;
        }
        else
        {
          fill(255); 
          stroke(255);
          countno++;
        }
        rect( mousexval, mouseyval,4,4);
      }
    }
  }
  if (!mousePressed) 
    mousemode = false;
  
  rectMode(CORNER);
  stroke(255);
  fill(255);
  rect(0,a.height-25,280,25);
  fill(0);
  textAlign(LEFT);
  coverage = ((countyes+countno)*25);
  coverage /= a.width*a.height;
  coverage = float(int(coverage*10000))/100;
  
  text("hits: "+countyes+"  misses: "+countno+"  coverage: "+coverage, 10,a.height-7);
}

