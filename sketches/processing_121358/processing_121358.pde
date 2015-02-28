
int numFrames = 22;
int frame = 0;
PImage[] img2 = new PImage[numFrames];

PImage img1,img3;

//snow//
ParticleSystem ps;

//river//
float yoff = 0.0;

//music//
//import ddf.minim.*;
//Minim minim;
//AudioPlayer player;
 

float x;
float y;
float t;

float a;
float b;
float va;
float vb;


int red = 0;
int green = 0;
int blue = 255;

//teacher//
Eye e1;

//---------------------------------------------------------------------//

void setup() {
  noCursor();
  
  img2[0] = loadImage("bird1.gif");
  img2[1] = loadImage("bird2.gif");
  img2[2] = loadImage("bird3.gif");
  img2[3] = loadImage("bird4.gif");
  img2[4] = loadImage("bird5.gif");
  img2[5] = loadImage("bird6.gif");
  img2[6] = loadImage("bird7.gif");
  img2[7] = loadImage("bird8.gif");
  img2[8] = loadImage("bird9.gif");
  img2[9] = loadImage("bird10.gif");
  img2[10] = loadImage("bird11.gif");
  img2[11] = loadImage("bird12.gif");
  img2[12] = loadImage("bird13.gif");
  img2[13] = loadImage("bird14.gif");
  img2[14] = loadImage("bird15.gif");
  img2[15] = loadImage("bird16.gif");
  img2[16] = loadImage("bird17.gif");
  img2[17] = loadImage("bird18.gif");
  img2[18] = loadImage("bird19.gif");
  img2[19] = loadImage("bird20.gif");
  img2[20] = loadImage("bird21.gif");
  img2[21] = loadImage("bird22.gif");

  
  
  size(1000, 800);
  img1 = loadImage("processing1.jpg"); 

 //snow//
  ps = new ParticleSystem(new PVector(width/2,-8));
 
 //music// 
  //minim = new Minim(this);
  //player = minim.loadFile("Candlegravity_-_05_-_Aalborg_Pulse.mp3");
  //player.play();
  
 //ball//
  frameRate(30);
  x = 175;
  bally = 530;
  t = 0;
  
 //bird//
  a=300;
  b=300;

 //teacher//  
  e1 = new Eye( 835, 401, -350);
  img3= loadImage("teacher.gif");
  
}

//---------------------------------------------------------------------//

//↓ snow//

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-4,4),random(-3,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }
  

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1;
  }

  void display() {
    stroke(0,lifespan);
    fill(random(255),random(255),random(255),lifespan);
    ellipse(location.x,location.y,10,10);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

//----------------------------------//


class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

//---------------------------------------------------------------------//


void draw() {
  image(img1, 0, 0);
  
  ps.addParticle();
  ps.run();
  
 //↓ river//
  fill(255,160);
  beginShape(); 
  float xoff = 0;
  for (float x = 0; x <= width; x += 15) {
    float y = map(noise(xoff, yoff), 0, 1, 650,750);
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
 //↑ river//

 //↓ ball//
  t=t+0.1;
  x = 85*sin(t)+280;
  colorMode(RGB,255);
  stroke(0);
  fill(255);
  ellipse(x,bally,70,70);
 //↑ ball//
  
 //↓ flower//
  colorMode(RGB,255);
  fill(red,green,blue,150);
  stroke(100);
  ellipse(220,290,35,20);
  ellipse(220,280,25,15);
  ellipse(207,290,25,15);

  ellipse(235,395,35,20);
  ellipse(235,385,25,15);
  ellipse(222,395,25,15);  

  
  ellipse(195,250,35,20);
  ellipse(195,240,25,15);
  ellipse(182,250,25,15); 
  
  ellipse(35,380,35,20);
  ellipse(35,370,25,15);
  ellipse(22,380,25,15);
  
  ellipse(45,555,35,20);
  ellipse(45,545,25,15);
  ellipse(32,555,25,15);
  
  ellipse(55,590,35,20);
  ellipse(55,580,25,15);
  ellipse(42,590,25,15);
 
  ellipse(950,585,35,20);
  ellipse(950,575,25,15);
  ellipse(937,585,25,15);
 
  ellipse(750,385,35,20);
  ellipse(750,375,25,15);
  ellipse(737,385,25,15);  
  
  ellipse(725,285,35,20);
  ellipse(725,275,25,15);
  ellipse(712,285,25,15);  
 
  ellipse(975,285,35,20);
  ellipse(975,275,25,15);
  ellipse(962,285,25,15);
  
  ellipse(825,235,35,20);
  ellipse(825,225,25,15);
  ellipse(812,235,25,15);
 

  colorMode(HSB,255);
  fill(red,green,blue,100);
  stroke(100);
 
  ellipse(195,415,35,20);
  ellipse(195,405,25,15);
  ellipse(182,415,25,15);

  ellipse(65,355,35,20);
  ellipse(65,345,25,15);
  ellipse(52,355,25,15);   
  
  ellipse(310,270,35,20);
  ellipse(310,260,25,15);
  ellipse(297,270,25,15);
  
  ellipse(15,580,35,20);
  ellipse(15,570,25,15);
  ellipse(2,580,25,15);
  
  ellipse(80,570,35,20);
  ellipse(80,560,25,15);
  ellipse(67,570,25,15);

  ellipse(130,605,35,20);
  ellipse(130,595,25,15);
  ellipse(117,605,25,15); 
 
  ellipse(930,555,35,20);
  ellipse(930,545,25,15);
  ellipse(917,555,25,15);  
  
  ellipse(980,561,35,20);
  ellipse(980,551,25,15);
  ellipse(967,561,25,15);

  ellipse(625,270,35,20);
  ellipse(625,260,25,15);
  ellipse(612,270,25,15);
  
  ellipse(590,290,35,20);
  ellipse(590,280,25,15);
  ellipse(577,290,25,15);
  
  ellipse(905,250,35,20);
  ellipse(905,240,25,15);
  ellipse(892,250,25,15);
  
  
  fill(255);
  stroke(100);
  ellipse(217,287,13,8);
  ellipse(307,267,13,8);
  ellipse(192,247,13,8);
  ellipse(192,412,13,8);
  ellipse(232,392,13,8);
  ellipse(62,352,13,8);
  ellipse(32,377,13,8);
  ellipse(12,577,13,8);
  ellipse(42,552,13,8);
  ellipse(52,587,13,8); 
  ellipse(77,567,13,8);
  ellipse(127,600,13,8);
  ellipse(927,552,13,8);  
  ellipse(947,582,13,8);
  ellipse(977,558,13,8); 
  ellipse(747,382,13,8); 
  ellipse(722,282,13,8);
  ellipse(622,267,13,8);
  ellipse(587,287,13,8);  
  ellipse(902,247,13,8);
  ellipse(972,282,13,8);
  ellipse(822,232,13,8);
 //↑ flower//
 
 //↓ bird// 
  frame++;
  if(frame == numFrames){
    frame = 0;
  }
  va=(mouseX-a)/4;
  vb=(mouseY-b)/4;
  a=a+va;
  b=b+vb;
  image(img2[frame],a-50,b-50);
 //↑ bird//
  
 //↓ teacher//
  e1.update(mouseX, mouseY);
  e1.display();
 //↑ teacher//
  
}

//---------------------------------------------------------------------//
//flower//
void mouseMoved(){
    red = 255*mouseX/width;
    green = 255*mouseY/height;
}

//---------------------------------------------------------------------//
//teacher//
class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
    if(angle > 0){
      if(angle < 3.02){
        angle = 3.02;
      }
  }
    if(angle <0){
      if(angle > -2.92){
        angle = -2.92;
      }
    }
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    image(img3,size/5, 0, 150, 150);
    popMatrix();
  }
}



