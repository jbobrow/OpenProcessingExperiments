
//variables
float rotation = 0;
float maxSize = 0.5;
float minSize = 0.1;
float currSize = 0.1;
float ease = 0.1;

void setup(){
   size(600,600);
   background(255);
 
  //default ellipse fill & stroke 
   fill(255,255,255,1.99999999);
   stroke(0,0,0,126);
}

void draw(){
  
  //fills background with white
   fill(255,255,255,20);
   rect(-2, -2, 604, 604);
   fill(255,255,255,2);
  
   if (mousePressed) {
     //grows size of black hole
     currSize+=((maxSize-currSize)*ease);
     drawBlackHole(mouseX,mouseY, currSize);
   }
}

//draws elipses that fade on top of eachother
void drawBlackHole(float x, float y, float size) {
    //centers pen
    translate(x,y);
    //loops through 10 times
    for(int i=0; i<10; i++) {
      //rotates semi-randomly to add vaiation to the black hole
      rotation += random(0.05,0.1);
      rotate(rotation);
      ellipse(0,0,random(1,300*size),400*size);
      rotate(rotation+90);
      ellipse(0,0,random(1,300*size),400*size);
    }
}

void mouseReleased() {
  //resets black hole size
  currSize = minSize;
}


