
Cell cell[];
color c;
float h;

void setup() {
  size(16, 512);
  background(#222222);
  
  int cellCount = height/width;
  
  cell = new Cell[cellCount];
  for(int i = 0; i < cell.length; i++) {
    cell[i] = new Cell(width/2, width*(0.5+i), width*0.75, width*0.75, #EEEEEE);
  }
  
}

void draw() {  
  colorMode(HSB, 100);
  c = color(h, 50, 90);
    
  for(int i = 0; i < cell.length; i++) {
    float h = hue(c);
    c = color(h+5, 50, 90);
    cell[i].setColor(c);
    cell[i].draw();
  }
  
  if(h < 100) {
    float s = map(mouseY, 0, height, 0, 10);
    h += s;
  }
  else {
    h = 0;
  }

}
  


