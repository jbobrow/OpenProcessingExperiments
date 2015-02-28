
ArrayList<Cob> cobs;
Cob cob;
color c;
int h,s,hh,ww;
color back;
int m,mill,ncobs;
float r,d;
boolean followMouse = true;

void setup() {
  size(600,600);
  colorMode(HSB,360,100,100);
  back = #660000;
  noStroke();
  followMouse;
  r = random(8);
  hh = height/2;
  ww = width/2;
  d = sqrt(width*width+height*height);
  h = (int) random(255);
  s = (int) random(255);
  smooth();
  cobs = new ArrayList<Cob>();
  while (r<=d) {
     r+=random(10,32);
     cob = new Cob(ww,hh,r,color(random(360),random(39,100),random(14,85)));
     cobs.add(cob);
  }
  ncobs = cobs.size();
}
 
void draw() {
  background(back);
  if (followMouse) {
    moveMouse();
  }
  for (int i=m-1;i>=0;i--) {
     cobs.get(i).display();
   } 
}

void mousePressed() {
  followMouse = !followMouse;
}

void moveMouse() { 
 m = (int)(ncobs*sqrt(sq(mouseX-ww)+sq(mouseY-hh))/ww); 
 if (m>=ncobs) {
   m = ncobs;
 }
}

// Cob stands for "Colored OBject"
class Cob {
  PVector center = new PVector();
  float r;
  color col;
  
  Cob(float cX, float cY, float r, color col) {
    this.center.x = cX;
    this.center.y = cY;
    this.r = r;
    this.col = col;
  }
 
  void changeColor() {
    this.col = color(random(360),random(100),random(100));
  }
  
  void display() {
    fill(col);
    ellipse(center.x,center.y,r,r);
  }
}

void keyPressed() {
  switch(key) {
  case ' ': 
    setup();  
    break;
  case 's':
    mill = millis();
    save("pt"+str(mill)+".jpg");
    break;
  default:
    println("unknown key");   // Does not execute
    break;
  }
}


