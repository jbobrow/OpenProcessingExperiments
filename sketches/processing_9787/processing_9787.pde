
int[] memMouse =  new int[4];
int[] nowMouse =  new int[4];
int[] thenMouse =  new int[4];

int little = 5;
int middle = 10;
int big    = 25;

int mouseX1;
int mouseY1;
int mouseX2;
int mouseY2;

int paletteSelector = int(random(10));
color[] thisColor = new color[5];

// bool array to turn brusshes on and off  
boolean[] brushActive = new boolean[10];

void setup() {
  size(800, 450);
  letterBox(60, 40, 60 ,40);
  background(colorFromPalette());
    stroke(colorFromPalette());
  fill(colorFromPalette());
 
  frameRate(60);
}

void draw() {
  
  letterBox(60, 40, 60 ,40);
  
  stroke(colorFromPalette());
  fill(colorFromPalette());
  
  paletteShow(420, 50);
  
  updateNowMouse();
  updateMemMouse();
}



