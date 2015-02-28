
///MIDTERM v.01

ArrayList bulb;
PImage logo; //upload logo image


void setup() {
  size(800, 300);
  logo= loadImage("ledplux1.png");
  
  bulb = new ArrayList();
  smooth();
  //50 light
  for (int i=0; i<50; i++) {
    bulb.add(new bulb());
    
  
    
  }
}

void draw() {

  background(0);
  image(logo,width/2,height/2);
  for (int i=0; i<bulb.size(); i++) {
    bulb b = (bulb) bulb.get(i);
    b.animate();
    b.display();
    b.Revert();



    println("blinklight");
  }
}
class bulb {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float r;
  float g;
  float b;
  float diam;


  bulb() {

    x = random(20, 370);
    y =random(20, 80);
    diam = random(10, 30);
    xspeed = random(2, 5);
    yspeed = random(1, 2.8);
    r = 255;
    g = 255;
    b = 255;
  }

  void animate() {
    //move ellipse
    x+=xspeed;
    y+=yspeed;
  }

  void display() {

    noStroke();
    fill(r, g, b);
    ellipse(x, y, diam, diam);
    println("color");
  }
  void Revert() {

    //change direction and color when bulb hits boundaries
    //RIGHT wall
    if (x>width-12) {
      xspeed*=-1;
      r=15;
      b=170;
      g=170;
      fill(r, g, b);
      ellipse(x, y, diam, diam);
    }
    //LEFT wall
    if (x<12) {
      xspeed*=-1;
      r=119;
      b=2;
      g=210;
      fill(r, g, b);
      ellipse(x, y, diam, diam);
    }

    //BOTTOM wall
    if (y>height-12) {
      yspeed*=-1;
      r=255;
      b=0;
      g=215;
      fill(r, g, b);
      ellipse(x, y, diam, diam);
    }
    //TOP wall
    if ( y<12) {
      yspeed*=-1;
      r=228;
      b=10;
      g=102;
      fill(r, g, b);
      ellipse(x, y, diam, diam);
    }

    //mouse pressed, black
    if (mousePressed) {
      r=255;
      b=255;
      g=255;
      fill(r, g, b);
      ellipse(x, y, diam, diam);
    }
  }
}


