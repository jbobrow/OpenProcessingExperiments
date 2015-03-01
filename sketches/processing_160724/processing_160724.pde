
int minDiam = 10;
int maxDiam = 100;
int diam;
int increment = 5;

void setup() {
  size(640, 480);
  diam = minDiam;
  fill(255);
  background(0,0,255);
}

void draw () {
}

void mouseDragged() {
   rect(mouseX, mouseY, diam/2, diam*4);
   fill (#239593); 
   diam = diam + increment;
   if (diam > maxDiam || diam < minDiam) {
     increment = -increment;
     
     if (mousePressed){
       rect(mouseX, mouseY, diam/2, diam*4);
     fill(#9900FF);
   }
   }
}


