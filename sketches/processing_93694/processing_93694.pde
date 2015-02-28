
//Ayla El-Moussa
//Object 
//March 19th 
Jumping jumping;
 
  void setup () {
    size (300, 600);
    jumping = new Jumping();
    smooth();
  }
 
  void draw() {
    jumping.display();
  }
 
 
class Jumping {
 
 
  int x=0;
  int y=0;
  int a=1;
  int b=1;
Jumping() {}
 
 
  void display() {
    fill(255, 2, 166);
    stroke(random(255), random(0), random(164));
    rect(x, y, 40, 30);
    ellipse(30,y,40,30);
    ellipse(x,y,50,60);
    x=x+1*a;
    y=y+1*b;
 
    if (x<=0)
    {
      a=a*-1;
      fill(255);
    }
    if
      (x+20>=300) {
      a=a*-1;
    }
 
    if (y<=0)
 
    {
      b=b*-1;
    }
    if  (y+10>=height) {
      b=b*-1;
    }
  }
 
}

