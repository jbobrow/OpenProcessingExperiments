

class Walker {
  PVector location;
  PVector noff;
  ArrayList<PVector> history;

  Walker() {
    location = new PVector(width/2, height/2);
    noff = new PVector(lunu+random(width),lunu+random(height));
    history = new ArrayList<PVector>();
   }

  void display() {
      if(lunu>0.0){
      fill(lunu,lunu);  
      stroke(50);
//      stroke(lunu,lunu);
    }
    else{
      noFill();  
      stroke(50);
    } 
    smooth();
    strokeWeight(0.8);
    constrain(location.x,0,width);
    constrain(location.y,0,height);
    ellipse(location.x, location.y,8,8);
    beginShape();
    stroke(50);
    strokeWeight(0.1);
    noFill();
    for (PVector v: history) {
      strokeWeight(0.2);
      vertex(v.x, v.y);
    noFill();

    }

    endShape();
        
        PVector start = (PVector) history.get(0);
    stroke(40);
    strokeWeight(0.5);
    constrain(start.x,0,width);
    constrain(start.y,0,height);
    
    ellipse(start.x,start.y,8,8);
   
 } 

  void walk() {
    constrain(location.x,0,width);
    constrain(location.y,0,height);
    
    location.x = map(noise(noff.x),0,1,0,width);
    location.y = map(noise(noff.y),0,1,0,height);
    
    noff.add(0.0003+lunu/10000,0.0003+lunu/10000,0);
     history.add(location.get());
    if (history.size() > 100000) {
      history.remove(50);
    }
  }
}

import ddf.minim.*;
import ddf.minim.analysis.*;

int choice=0;
float lunu;
int trigger=0;

Walker w;
Walker x;
Walker y;
Walker z;
Walker a;
Walker b;
Walker c;
Walker d;
Walker e;
Walker f;
Walker g;
Walker h;
Walker i;
Walker j;
Walker k;
Walker l;
Walker m;
Walker n;

PFont ff;

Minim minim;
AudioPlayer player;
FFT fft;


void setup() {

  size(1600,900 );
  frameRate(30);
  
  w = new Walker();
  x = new Walker();
  y = new Walker();
  z = new Walker();
  a = new Walker();
  b = new Walker();
  c = new Walker();
  d = new Walker();
  e = new Walker();
  f = new Walker();
  g = new Walker();
  h = new Walker();
  i = new Walker();
  j = new Walker();
  k = new Walker();
  l = new Walker();
  m = new Walker();
  n = new Walker();
  
  minim = new Minim(this);
  player = minim.loadFile("we shall overcome (pete seeger).mp3",1024);
//  int lupu=int(random(12,160))*1000;
//  timer = new Timer(lupu);
//  timer.start();
//  if (timer.isFinished()) {
//   trigger=1;
   player.play();
   fft = new FFT( player.bufferSize(), player.sampleRate() );
//   timer.start();
//  }
//  else{
//    trigger=0;
//  }
  

}

void draw() {
  
    smooth();
    background(20);
//    println(PFont.list());
    ff = createFont("Courier New", 24);
    textFont(ff);
    textSize(12);
    fill(150);
//    text("PAST:", 15, 30); 
//    stroke(60);
//    strokeWeight(1);
//    fill(20);
//    ellipse(60,25,8,8);
//    fill(150);
//    text("PRESENT:", 15, 45);
//    stroke(120);
//    strokeWeight(1);
//    fill(20);
//    ellipse(80,40,8,8);
//    fill(150);
    text("VITAMIN C:", 15, 30); 
    

 //fill(255,5);
// rect(0,0,width,height);

  // Run the walker object

float bubu=0.0;
//if(trigger==1){
fft.forward( player.mix );
for(int i = 0; i < fft.specSize(); i++)
  {
  // draw the line for frequency band i, scaling it up a bit so we can see it
  //  line( i, height, i, height - fft.getBand(i)*8 );
    bubu=map(fft.getBand(i), 0,0.07,0,255);
    }
    
    lunu=bubu;
//  } 
    fill(lunu,lunu);
    stroke(50);
    ellipse(100,26,8,8);
    if(lunu==0){
      stroke(100);
      line(10,55,160,55);
    }
    w.walk();
    x.walk();
    y.walk();
    z.walk();
    a.walk();
    b.walk();
    c.walk();
    d.walk();
    e.walk();
    f.walk();
    g.walk();
    h.walk();
    i.walk();
    j.walk();
    k.walk();
    l.walk();
    m.walk();
    n.walk();
    w.display();
    x.display();  
    y.display();
    z.display();
    a.display();
    b.display();
    c.display();
    d.display();
    e.display(); 
    f.display(); 
    g.display(); 
    h.display();
    i.display();
    j.display();
    k.display();
    l.display();
    m.display();
    n.display(); 
    
//    println(lunu);

}



