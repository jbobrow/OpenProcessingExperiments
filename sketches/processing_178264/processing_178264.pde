
int spacing;
int _h;
int _w;

void setup() {  //setup function called initially, only once
    size(900, 1000);
    background(240);  //set background white
    fill(48);
    colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
    spacing = 50;
    _h = 100;
    _w = width-100;
    noLoop();
    noStroke();
}

void cantor(int x, int y, int len, int s, int h) {
    if(len > 0) {
      h = 1;  
      s = 50;
      rect(x,y,len, h);
        y += h+s;
        len /= 3;
        
        
        cantor(x,       y, len, s, h);
        cantor(x+len*2, y, len, s, h);
    }
    if(len <= 0)
      return;
}

void draw() {  //draw function loops 
    cantor(50,50,_w,spacing, _h);   
}
