

PFont font;



star[] starCollection = new star [201];

//declare

star mystar;


void setup(){
  size (600,300);
  smooth();
  strokeWeight(.5);
  
  //initial
  for (int i=0; i<starCollection.length; i++){
 starCollection[i] = new star(random(0, width), random(0,height),0);
  

}}


void draw(){
  


 background(#812424);
 smooth();
 fill(255,150);
font = loadFont("Helvetica-Light-48.vlw");
textFont(font, 18);
text("H   a   p   p   y       H   o   l   i   d   a   y   s", 160, 150);
 fill(255,150);
textFont(font, 12);
text("from stanley+susy...formo.co", 410, 270);
text("2   0   1   3        -        2   0   1   4", 410, 290);


//call func
for (int i=0; i<starCollection.length; i++){
starCollection[i].run();


}
}



class star {
  //prop
  float x =0;
  float y =0;
  float d =0;
  float speedx = 0;
  float speedy = .2;
  float skalaD = .1;
  float r= 0;

  //const
  star(float _x, float _y, float _d) {

    x=_x;
    y=_y;
    d=_d;
  
  }

  //func

  void run() {
 
    display();
    move();
    bounce();
    skala();
 isi();

   
  }


  void display() {

    beginShape();
    vertex(x, y);
    vertex(x-d, y+(3*d));
    vertex(x-(4*d), y+(4*d));
    vertex(x-d, y+(5*d));
    vertex(x, y+(8*d));
    vertex(x+d, y+(5*d));
    vertex(x+(4*d), y+(4*d));
    vertex(x+d, y+(3*d));
    vertex(x, y);
    endShape();
  }

  void move() {

    x += speedx;
    y += speedy;
  }
  void bounce() {

    if (y>height) {

      y=0;
    }
  }
  void skala() {

    d += skalaD;
    if (d>random (0, 15)) {
      d=0;
    }
  }

  void isi() {

    fill (random (100, 255), 0, 0);
  }
  

}



