
Bubbles[] b = new Bubbles[10]; //declaring an array of bubbles

//group 1 of ripples, center right
Ripple waterRip1;

//group 2 of ripples, top left
Ripple waterRip2;

//group 3 ripples, at bottom
Ripple waterRip3;

//group 4 ripples, position controlled by mouse
Ripple waterRip4;

void setup (){
  size(800,600);
  background(30);
  frameRate(10);
  
  //Creating objects
  for (int i = 0; i < b.length; i++){
    b[i] = new Bubbles();
  }
  
  //represents color of ripple as well as position and speed
  //of group 1, ripples on center right
  waterRip1 = new Ripple(color(#21B766, 45), 10, 25, 10);

  //represents color of ripple as well as position and speed
  //of group 2, ripples on top left
  waterRip2 = new Ripple(color(#21B72A, 35), 10, 25, 1);

  //represents color of ripple as well as position and speed
  //of group 3, ripples at bottom
  waterRip3 = new Ripple(color(#2195B7, 40), 10, 25, 5);

  //represents color of ripple as well as position and speed
  //of group 4
  waterRip4 = new Ripple(color(#2303FF, 50), 10, 25, 1);
}

void draw(){
  fill(30,20);
  rect(0,0,width,height);
  for (int i = 0; i < b.length; i++){
    b[i].move();
    b[i].display();
    
    for (int j = 0; j < b.length; j++){
      if((b[i].collide(b[j]))){
        b[i].col();
      }else{
        b[i].nocol();
      }
    }
  }
  
  //group 1
  waterRip1.mov();
  waterRip1.display();

  //group 2
  waterRip2.mov();
  waterRip2.display2();

  //group 3
  waterRip3.mov();
  waterRip3.display3();

  //group 4
  waterRip4.mov();
  waterRip4.display4();
}


class Bubbles{
  
  float x,y;
  int s;
  color c = color(200,50);
  
  Bubbles(){
    x = random(width);
    y = random(height);
    s = 20;
  }
  
  void display () {
    stroke(100,100,100,175);
    noFill();
    ellipse(x,y,s,s);
    ellipse(x+5,y-5,5,5);
  }
  
  void move() {
    int opt = int(random(5));
    if (opt == 0){
      x = x + s;
    }else if (opt == 1){
      x = x - s;
    }else if (opt == 2){
      y = y + s;
    }else{
      y = y - s;
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void col(){
    c = color (0,200,0,100);
    fill(c);
    text("pop",x,y);
  }
  void nocol(){
    c = color(200,50);
  }
  
  boolean collide(Bubbles b0){
    float d = dist(x,y,b0.x,b0.y);
    if ((d>0) && (d<s*5)){
      return true;
    }else{
      return false;
    }
  }
}
    
class Ripple {
  color c; //color
  float xpos; //position on the x   
  float ypos; //position on the y   
  float speed; //speed


    Ripple(color wC, float rxpos, float rypos, float rspeed) {
    c = wC;
    xpos = rxpos;
    ypos = rypos;
    speed = rspeed;
  }

  float circ = 5; // controls number of ripples(rings)
  float sc = random(width); //scale of ellipse
  float r = random(1, 5); //controls number of ripples (rings)

  //group 1 ripples on right
  //controls position and repetition of ripples
  void display() {
    for (int i = 0; i<circ; i++) {
      stroke(c, random(0, 20));
      noFill();
      ellipse(600, 300, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;

      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -100; //controls fading of circles
      }
    }
  }
  //group 2 ripples on top left
  //controls position and repetition of ripples
  void display2() {
    for (int i = 0; i<circ; i++) {
      stroke(c,random(0,20));
      noFill();
      ellipse(100, 100, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;

      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -100; //controls fading of circles
      }
    }
  }

  //group 3 ripples at bottom
  //controls position and repetition of ripples
  void display3() {
    for (int i = 0; i<circ; i++) {
      stroke(c, random(0,20));
      noFill();
      ellipse(300, 550, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;

      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -100; //controls fading of circles
      }
    }
  }

  //group 4 controlled by mouse
  //controls position and repetition of ripples
  void display4() {
    for (int i = 0; i<circ; i++) {
      stroke(c, random(0,20));
      noFill();
      //position and scale of ellipse controled by mouse
      ellipse(mouseX, mouseY, sc, sc); 

      //controls movement 
      sc=sc+r;

      // keeps ripples on a loop
      if (sc>width+10) {
        sc = -100; //controls fading of circles
      }
    }
  }
  void mov() {
    display();
    xpos = xpos + 10;
  }
}



