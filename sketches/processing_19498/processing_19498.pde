
Circ mycirc1;
Circ mycirc2;

float angle;
//float frequency = 0.0925;//random(0.125 ,0.25);

Circ [] mycircs = new Circ[150];

void setup() {
  size(900,500);
  for(int i =0; i < mycircs.length; i ++) {
    mycircs[i] = new Circ(width/2 + random(10,50),height/2+random(10,50),random(10,30),random(-50,50),random(-40,40),random(3,10),random(-0.25,0.125));
  }

  smooth();
}

void draw() {
  background(193,191,133);
  
  mycircs[1].display();
  mycircs[1].spin();
  for(int i=0; i<mycircs.length;i++) {
    mycircs[i].move();
    mycircs[i].spin();
  }
}

void mouseDragged() {
}


class Circ { //a class for a circ object

  float x1, y1, diam, a, b;
  float opacity;
  float wid;
  float frequency;
  

  Circ(float _x1, float _y1, float _diam, float _a, float _b, float _wid, float _freq ) {//constructor for the circ

    x1 = _x1;
    y1 = _y1;
    a = _a;
    b = _b;
    wid = _wid;
    
    diam = _diam;
    frequency = _freq;
  }

  void display() {
    fill(255,0,0);
    //ellipse(x1,y1,diam,diam);
    stroke(255,0,0);
    //line(x1,y1,0,height/2);
  }

  void move() {
    x1 = mouseX;
    y1= mouseY;  
   
   
    
    
   // stroke(255,30);  
   // fill(255,opacity);
    noFill();
    //line(x1-a,y1-b,900,height/2);
    //ellipse(x1-a, y1-b, wid, wid);

    //    if(mousePressed ==true) {
    //      a = a*1.5;
    //      b = b*1.5;
    //    }

    if(keyPressed == true) {
      if(keyCode == UP) {
        a = a*1.25;
        b = b*1.25;
      }
    }

    if(keyPressed == true) {
      if(keyCode == DOWN) {
        a = a/1.25;
        b = b/1.25;
      }
    }
  }

  void spin() {
    float px,py;
    float radius;
     float d;
    
    
    d = dist(x1,y1,x1-a,y1-b);
    
    opacity = map(d,0,300,255,75);
    radius = diam/2;
    
    px = x1 +cos(radians(angle))*(radius);
    py = y1 +sin(radians(angle))*(radius);
    
    angle += frequency;
    fill(150,0,0, opacity);
    ellipse(px+a,py+b,wid,wid);
    stroke(255,40);
    line(px+a, py+b,0,height/2);
    line(px+a,py+b,width,height/2);
  }
}

