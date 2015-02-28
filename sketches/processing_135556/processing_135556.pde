

Strings[] s;
int HowMany;

void setup() {
  size(1000, 480);
  background(255);
  HowMany=250;
  s= new Strings [HowMany];

for(int i=0;i<HowMany;i++){
  s[i]= new Strings();
}

}

void draw() {
  //background(255);
  fill(255, 150);
  rect(0,0,width,height);
  for (int i=0;i<HowMany;i++) {
    s[i].update();
    s[i].display(i,HowMany);
    
  }
}

class Strings {
  float x;
  float theta;
  float friction;
  float os;
  float Ugap;
  float Uhowmany;
  float xstring;
  float strength;

  Strings() {
    x=0;
    friction=0.99;
    strength=20;
  }

  void display(float gap, float howmany) {

    //guitar strings
    noFill();
    stroke(map(abs(os), 0, strength, 0, 255), map(abs(os), 0, strength, 0, 255), 0);
    x= map(sin(theta), -1, 1, -os, os);
    theta+=PI/30;
    os=os*friction;
    xstring =width/howmany*gap;
    bezier(xstring, 0, xstring+x*2, height/3/2, xstring+x*2, height*2/3/2, xstring, height/2);

    if (os<0.1) os=0;
    Ugap=gap;
    Uhowmany = howmany;




    // pendulum line
    fill(0);
    stroke(0);
    line( xstring, height/2, xstring, height*4/5-abs(x*5));

    // pendulum
    noStroke();
    fill(0, map(abs(os), 0, strength, 0, 255), 0);
    ellipse(xstring, height*4/5-abs(x*5), 5, 5);


    // partition
    noStroke();
    fill(map(abs(os), 0, strength, 0, 255));
    ellipse(xstring, height/2, 5, 5);
    noFill();


    //rects
    fill(0);
    rectMode(CENTER);
    rect(xstring, height*4/5+abs(x*3), 5, 5);
    noFill();
    rectMode(CORNER);
    stroke(0);
    strokeWeight(map(abs(x), 0, strength, 1, 9));
    line(xstring, height*4/5+abs(x*3), xstring, height);
    strokeWeight(1);
  }

  void update() {
    //if (abs(mouseX-pmouseX)>0.1 && mouseX>width/Uhowmany*Ugap-5 && mouseX<width/Uhowmany*Ugap+5 && mouseY<height/2) os=20;

    if (mouseY<height/2) {
      if ((xstring<pmouseX&& xstring>mouseX)) {
        os=strength;
      } else if (xstring>pmouseX&& xstring<mouseX) {
        os=strength;
      }
    }
  }
} 

