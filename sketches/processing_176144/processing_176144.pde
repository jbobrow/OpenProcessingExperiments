
float colourdegrees = 0;

class RainbowLine {
  int x, y, px, py;
  float off;
  RainbowLine() {
    x=mouseX;
    y=mouseY;
    px=pmouseX;
    py=pmouseY;
    off=colourdegrees;
  }
  void draw() {
    stroke( (colourdegrees+off)%360, 97, 100);
    ellipse(x, y, px, py);
  }
}

ArrayList RainbowLines;

void setup() {
  size(600,600);
  strokeWeight(8);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(215,58,56);
  RainbowLines = new ArrayList();
}

void draw() {
  background(215,58,56);
  // Add new line?
  if (mousePressed){
    RainbowLines.add( new RainbowLine() );
  }
  // Cycle colors.
  colourdegrees+=1.5;
  colourdegrees%=360;
  // Render all lines  
  for( int i = 0; i < RainbowLines.size(); i++ ){
    RainbowLine t = (RainbowLine) RainbowLines.get(i);
    t.draw();
  }
  // Limit ArrayList size (optional)!
  while( RainbowLines.size() > 28 ){
     RainbowLines.remove(0);
  }
}

void keyPressed(){
  if( key == ' ' ){
    RainbowLines = new ArrayList();
  }
}





