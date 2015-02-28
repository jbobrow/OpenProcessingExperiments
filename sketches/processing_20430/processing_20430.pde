
int triStroke = 0;
int triFill = 0;
int newPointx = 0;
int newPointy = 0;

void setup() {
 size (300, 600);
colorMode(HSB, 100);
background (10);
smooth();
  
}

void draw () {
  triStroke = int (random (100));
  triFill = int (random (10, 60));
  newPointx = mouseX ;
  newPointy = mouseY ;
  
  
}

void mousePressed () {
 stroke (triStroke, 15, 90);
 fill (triFill, 0, 0, 30);
 triangle (50, 400, 350, 400, newPointx, newPointy);
  
  
}

void keyPressed () {
 save ("drawing.jpg");
 
}

