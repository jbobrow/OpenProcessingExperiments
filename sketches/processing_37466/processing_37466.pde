
//Homework5
//Nathan Trevino Programming for the Arts with Processing
//Copyright Pittsburgh PA, Carnegie Mellon University, Wed, Sept 14th 2011


final int Wd = 400;
final int Ht = 400;



void setup() {
  size(Wd, Ht);
  background(#FC7208);
  frameRate(10);
}

void draw() {


  int hx = 0;
  int hy = 0;
  float Value = hx/3;
  int MyDiam = 20;

  while (hx <= Wd) {
    hy = 0;
    while (hy <= Ht) {
      hy = hy + 10;
      MyDiam = hy / 3;
      Value = hy / 2;
      noStroke();
      fill (0, Value, 255);
      ellipse(hx, hy, MyDiam/3, MyDiam/3);
    }
    hx = hx + 20;
  }

  int i = 0;
  float ValueLine = 0;
  while (i< Wd) {
    strokeWeight(1);
    stroke(ValueLine);
    line(0, i, Wd, i);
    i += 10;
    ValueLine = ValueLine + 30;
  }
  
  if(keyCode == UP){
    rect(random(0,400),random(0,400),random(0,200),random(0,200));
  }
  else if (keyCode == DOWN){
    fill(ValueLine/2);
    rect(random(0,400),random(0,400),random(0,10),random(0,10));
  }
    
  
}

