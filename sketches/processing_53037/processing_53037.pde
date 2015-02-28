
// sketch inspired by the Vector Tutorial at
// processing.org

PVector poz, speed, velocity;
labda[] l;
int n=3;

void setup() {
  size(500,500);
  smooth();
  //frameRate(15);
  uj();
  background(random(255),random(255),random(255));
}

void uj() {
  l = new labda[n];
  for (int i=0; i<l.length; i++) {
    l[i] = new labda();
  } 
}

void draw() {
  for (int i=0; i<l.length; i++) {
    l[i].update();
    l[i].display();
  }
  
}

class labda {
  int r,g,b;
  boolean RR,GG,BB;
  PVector poz, speed, velocity;
  labda() {
    velocity=new PVector(0,0.1);
    poz=new PVector(random(width),random(height));
    //speed=new PVector(random(6)-3,random(6)-3);
    speed=new PVector(random(4)-2,random(4)-2);
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
    RR=true;
    GG=true;
    BB=true;
  }
  
  void update() {
    //eger es tarsai
    PVector mouse=new PVector(mouseX,mouseY);
    PVector irany;
    irany=PVector.sub(mouse,poz);
    irany.normalize();
    irany.mult(0.3);
    
    speed.add(irany);
    speed.limit(7);
    //speed.add(velocity);
    poz.add(speed);
     
    if(RR) {r++;} else {r--;}
    if (r>260) {RR=false;}
    if (r<0) {RR=true;}
    
    if(GG) {g++;} else {g--;}
    if (g>260) {GG=false;}
    if (g<0) {GG=true;}
    
    if(BB) {b++;} else {b--;}
    if (b>260) {BB=false;}
    if (b<0) {BB=true;}
    
    /*if ((poz.x > width) || (poz.x < 0)) {
      speed.x=speed.x * -1; 
    }
    if ((poz.y > height) || (poz.y < 0)) {
      speed.y=speed.y * -1; 
    }  
    */
  }
  
  void display() {
    fill(r,g,b);
    ellipse(poz.x,poz.y,8,8);
  }
}

void mouseClicked() {
 uj(); 
}

void keyPressed () {
    if (keyCode == ENTER) {
    uj();
    background(random(255),random(255),random(255));
  }
}


