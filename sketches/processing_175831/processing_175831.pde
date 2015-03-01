
class Slider {
  String name;
  int x, y;
  int w, h;
  float min, max;
  float pos;
  color baseCol;
  color highlightCol;
 
  float pos() {
    return pos;
  } 
  
  Slider(String name, int x, int y, int w, int h, float min, float max, color baseCol, color highlightCol) {
    this.name=name;
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.min=min;
    this.max=max;
    this.baseCol=baseCol;
    this.highlightCol=highlightCol;
    pos = (min + max) / 2; 
  }
  
  void slide() {
    if((mouseX >= x)&&(mouseX <= x+w)&&(mouseY >= y)&&(mouseY <= y+h))
      pos = map(mouseX, x, x+w, min, max);
    }
    
  void display() {
    fill(baseCol);
    strokeWeight(5);
    stroke(0);
    rect(x,y,w,h);
    fill(highlightCol);
    rect(x,y,map(pos,min,max,0,w),h);
    textSize(15);
    fill(0);
    textAlign(CENTER);
    text(name,width/2,50);
    textSize(8);
    text(nf(pos,0,2),map(pos,min,max,x,x+w),y-10);
    strokeWeight(1);
  }
}

class Button {
  String name;
  int x, y;
  int size;
  color baseCol;
  color overCol;
  color pressCol;
  boolean over = false;
  boolean pressed = false;
  
  boolean isPressed() {
    return pressed; 
  }
  
  Button(String name,int x,int y, int size,color baseCol,color overCol,color pressCol) {
    this.name=name;
    this.x=x;
    this.y=y;
    this.size=size;
    this.baseCol=baseCol;
    this.overCol=overCol;
    this.pressCol=pressCol;
  }
  
  void over() {
    if((mouseX>=x-size)&&(mouseX<=x+size)&&(mouseY>=y-size)&&(mouseY<=y+size))
      over = true;
    else
      over = false; 
  }
  
  void pressed() {
    if(over)  pressed = true;
  }
  
  void release() {
    pressed = false;
  }
  
  void displaystop() {
    if(pressed) fill(pressCol);
    else if(over) fill(overCol);
    else fill(baseCol);
    stroke(0);
    noFill();
    ellipse(x,y,size,size);
    rect(x-size/4,y-size/4,size/2,size/2);
    textSize(10);
    text(name,x,y+size);
  }
    
  void displaypp() {
    if(pressed) fill(pressCol);
    else if(over) fill(overCol);
    else fill(baseCol);
    noStroke();
    triangle(x-size/4,y-size/4,x-size/4,y+size/4,x+size/4+5,y);
    stroke(0);
    noFill();
    ellipse(x,y,size,size);  
    textSize(10);
    text(name,x,y+size);
  }
  
  void displayf() {
    if(pressed) fill(pressCol);
    else if(over) fill(overCol);
    else fill(baseCol);
    noStroke();
    triangle(x-size/3,y-size/3,x-size/3,y+size/3,x+size/3+5,y);
    triangle(x-size/3+15,y-size/3,x-size/3+15,y+size/3,x+size/3+20,y);
    textSize(10);
    text(name,x,y+size);
  }
  
  void displayb() {
    if(pressed) fill(pressCol);
    else if(over) fill(overCol);
    else fill(baseCol);
    noStroke();
    triangle(x+size/3,y-size/3,x+size/3,y+size/3,x-size/3-5,y);
    triangle(x+size/3-15,y-size/3,x+size/3-15,y+size/3,x-size/3-20,y);
    textSize(10);
    text(name,x,y+size);
  }
}

Slider bar;
Button pp, f, b, stop;

void setup() {
  background(255);
  size(600,300);
  bar = new Slider("Current music file", 50, 100, 500, 20,0,100,color(0),color(255));
  pp = new Button("Play/Pause",width/2,175,40,color(100),color(150),color(225));
  f = new Button("Foward",width/2+75,150,30,color(100),color(150),color(225));
  b = new Button("Backward",width/2-75,150,30,color(100),color(150),color(225));
  stop = new Button("Stop",width/2,250,30,color(100),color(150),color(225)); 
}

void draw() {
  bar.display();
  pp.displaypp();
  f.displayf();
  b.displayb();
  stop.displaystop();
}

void mouseDragged() {
 bar.slide(); 
}

void mousePressed() {
  f.pressed();
  b.pressed();
  pp.pressed();
  stop.pressed();
}

void mouseReleased() {
  f.release();
  b.release();
  pp.release();
  stop.release();
}

void mouseMoved() {
  f.over();
  b.over();
  pp.over();
  stop.over(); 
}
