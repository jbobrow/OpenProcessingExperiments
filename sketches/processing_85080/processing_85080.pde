
int l = 20000;
float px[] = new float[l*19];
float py[] = new float[l*19];
color b;
float m = 3;
float n = 2;
int a=6;
int iro=50;



void setup() {
  size(500, 500);
  background(0);
  smooth();

  
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = 0; i < l; i++) {
    px[i] = random(width/a);
    py[i] = random(height/a);
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l+1; i < l*2; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a) ;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*2+1; i < l*3; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a);
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*3+1; i < l*4; i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*4+1; i < l*5; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*5+1; i < l*6; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*6+1; i < l*7; i++) {
    px[i] = random(width/a);
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*7+1; i < l*8; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*8+1; i < l*9; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*9+1; i < l*10; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*10+1; i < l*11; i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*11+1; i < l*12; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*12+1; i < l*13; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*13+1; i < l*14 ;i++) {
    px[i] = random(width/a);
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*14+1; i < l*15; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*15+1; i < l*16; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*16+1; i < l*17 ;i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*17+1; i < l*18; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*18+1; i < l*19; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
}



void draw() {  
  if (mousePressed) {
    background(0);
    rotatePoints(mouseX - 50, mouseY, LEFT);
    rotatePoints(mouseX + 50, mouseY, RIGHT);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = 0; i < l; i++)
      set((int)px[i], (int)py[i], b);       
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l+1; i < l*2; i++)
      set((int)px[i], (int)py[i], b);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*2+1; i < l*3; i++)
      set((int)px[i], (int)py[i], b);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*3+1; i < l*4; i++)
      set((int)px[i], (int)py[i], b);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*4+1; i < l*5; i++)
      set((int)px[i], (int)py[i], b);   
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*5+1; i < l*6; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*6+1; i < l*7; i++)
      set((int)px[i], (int)py[i], b);   
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*7+1; i < l*8; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*8+1; i < l*9; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*9+1; i < l*10; i++)
      set((int)px[i], (int)py[i], b);   
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*10+1; i < l*11; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*11+1; i < l*12; i++)
      set((int)px[i], (int)py[i], b);   
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*12+1; i < l*13; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*13+1; i < l*14; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*14+1; i < l*15; i++)
      set((int)px[i], (int)py[i], b);   
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*15+1; i < l*16; i++)
      set((int)px[i], (int)py[i], b);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*16+1; i < l*17; i++)
      set((int)px[i], (int)py[i], b); 
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i = l*17+1; i < l*18; i++)
      set((int)px[i], (int)py[i], b);
    b = color(random(0,255),random(0,255),random(0,255),iro);
    for(int i =l*18+1; i < l*19; i++)
      set((int)px[i], (int)py[i], b);
  }  
}

void keyPressed(){
  reset();
}



void rotatePoints(int x, int y, int dir) {
  for(int i = 0; i < l*19; i++) {
    float mx = px[i]-float(x);
    float my = py[i]-float(y);
    float r = dist(px[i]/m, py[i]/m, x/m, y/m);
    r*=r/50;
    float tx = 0;
    float ty = 0;
    if(dir==LEFT) {
      tx = cos(1/r*n)*mx-sin(1/r*n)*my;
      ty = sin(1/r*n)*mx+cos(1/r*n)*my;
    }
    else{
      tx = cos(-1/r*n)*mx-sin(-1/r*n)*my;
      ty = sin(-1/r*n)*mx+cos(-1/r*n)*my;
    }
    tx += float(x);
    ty += float(y);
    px[i] = tx;
    py[i] = ty;
    if(px[i]>width)
      px[i] = 0;
    if(px[i]<0)
      px[i] = width;
    if(py[i]>width)
      py[i] = 0;
    if(py[i]<0)
      py[i] = width;
  }
}

void reset(){
  
  background(0,60);
  
 b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = 0; i < l; i++) {
    px[i] = random(width/a);
    py[i] = random(height/a);
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l+1; i < l*2; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a) ;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*2+1; i < l*3; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a);
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*3+1; i < l*4; i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*4+1; i < l*5; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*5+1; i < l*6; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*6+1; i < l*7; i++) {
    px[i] = random(width/a);
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*7+1; i < l*8; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*8+1; i < l*9; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*9+1; i < l*10; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*10+1; i < l*11; i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*11+1; i < l*12; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*12+1; i < l*13; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*13+1; i < l*14 ;i++) {
    px[i] = random(width/a);
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*14+1; i < l*15; i++) {
    px[i] = random(width/a)+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*15+1; i < l*16; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*16+1; i < l*17 ;i++) {
    px[i] = random(width/a)+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i =l*17+1; i < l*18; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
  b = color(random(0,255),random(0,255),random(0,255),iro);
  for(int i = l*18+1; i < l*19; i++) {
    px[i] = random(width/a)+width/a+width/a+width/a+width/a+width/a;
    py[i] = random(height/a)+height/a+height/a+height/a+height/a+height/a;
    set((int)px[i], (int)py[i], b);
  }
}
  


