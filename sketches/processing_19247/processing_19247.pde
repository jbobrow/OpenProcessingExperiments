
// DMA 28 · TWO · RESPOND
// do you ever see annoying little things flying in front of you ? do they freak you out ?
// the annoying little thing flying in front of these eyes sure freak them out
// move the thing faster to freak them out more ! for some reason they follow the thing
// click the thing and the eyes close, pretending the thing is no longer there
// if you click the thing real fast, perhaps your own eyes will start to freak out

PShape li;
PShape ri;
PShape msk;
PShape eye;
PShape over;

float vx = 0;
float vy = 0;
float lvx = 0;
float lvy = 0;

void setup() {
 size(640, 480); 
 li = loadShape("li2.svg");
 ri = loadShape("ri2.svg");
 msk = loadShape("mask.svg");
 eye = loadShape("eyes.svg");
 over = loadShape("over.svg");
 
 // cursor
 noCursor();
 strokeWeight(1);
 stroke(255);
 
}

void draw() {
  background(0);
  
  smooth();
  
    float lx = map(mouseX, 0, width, 60, 180);
    float rx = map(mouseX, 0, width, 380, 520);
    float y = map(mouseY, 0, height, 120, 220);
  
  // left iris
      //shape(li, lx, y);
    
    vx = random(-8, 8);
    vy = random(-8, 8);
 
    shape(li, lx+vx,y+vy);
    
  // right iris
    shape(ri, rx+vx, y+vy);
    
  // mask
    shape(msk, 0, 0);
    
    
  // annoying thingy
    lvx = random(-20, 20);
    lvy = random(-20, 20);
  
    noSmooth();
    strokeCap(SQUARE);
    line(mouseX+lvx, mouseY+lvy, pmouseX+lvx, pmouseY+lvy);
    smooth();
    
  // eyes
    shape(eye, 0, 0);
    
  // over
    if (mousePressed == true) {
        shape(over, 0, 0);
        
        //float b = dist(mouseX, mouseY, pmouseX, pmouseY);
        //filter(BLUR, b/80);
        filter(INVERT);
    }
    
}

