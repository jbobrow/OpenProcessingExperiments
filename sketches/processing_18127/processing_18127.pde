
class Logger {

  
  
  PFont font;
  int lines;
  String[] data;
  color[] colors;
  float x,y,w,spacing,size,h;
  int index;
  int direction;
  color c;
  
  
  Logger(PFont font, float size, float x, float y, float w, float h, color c) {
    this.font = font;
    this.lines = floor(h/(size+2));
    this.size = size;
    data = new String[lines];
    colors = new color[lines];
    for ( int i=0; i < data.length; i++) {
      data[i] = new String();
      colors[i] = c;
    }
    this.x = x;
    this.y = y;
    this.spacing = size + 2;
    this.w = w;
    this.h = h;
    this.direction = direction;
    this.c = c;
  }
  
  

  void upward() {
    direction = -1;
  }
  
  void downward() {
    direction = 0;
  }


  void post(String string) {
    index = (index + 1) % lines;
    data[index] = string;
    colors[index] = c;
    
  }
  
  void post(String string,color c) {
    index = (index + 1) % lines;
    data[index] = string;
    colors[index] = c;
  }


  void draw() {
    textFont(font,size);
    textAlign(LEFT,TOP);
    float ly = y;
  
    if ( direction == -1 ) {
      for ( int i=0; i < data.length; i++) {
       
        int j = (index + 1 + i) % lines;
        fill(colors[j]);
        text(data[j],x,ly,w,spacing);
        ly = ly + spacing;
      }
     
    } else {
       for ( int i=0; i < data.length; i++) {
        int j = ((index - i) + lines) % lines;
        fill(colors[j]);
        text(data[j],x,ly,w,spacing);
        ly = ly + spacing;
      }
      
    }
  }
}


