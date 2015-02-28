
PFont myFont;
String word[]= {
  "N", "o", "I", "m", "a", "g", "e"
};
int value = 0;
PImage b;
int together = 0;
int mouse = 0;

int x[] = { 
  100, 150, 250, 280, 360, 410, 460
};
int y[] = { 
  300, 300, 300, 300, 300, 300, 300
};


void draw() {
  background(value);
  for (int i = 0; i < 7; i = i+1) {
    text(word[i], x[i], y[i]);
  }
  if (together ==1 && mouse== 0)
    image(b, 0, 0, 720, 576);
}
void mouseReleased() {
  mouse = 0;
} 
void mouseDragged() 
{ 
  mouse=1;
  together=1 ;
  for (int i = 0; i < 7; i = i+1) {
    if (pmouseX <x[i]+35 && pmouseX >x[i]-15 && pmouseY<y[i]+35&& pmouseY>y[i]-25 ) {
      x[i]=x[i]+mouseX-pmouseX; 
      y[i]=y[i]+mouseY-pmouseY ;
    }  
    else {
      together=0;
    }
  } 
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void setup() {
  size(720, 576);
  myFont = createFont("Impact", 100);
  textFont(myFont);
  int value = 0;

  b = loadImage("bin.jpg");
}


