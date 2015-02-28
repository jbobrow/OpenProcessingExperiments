
//Generated By Derek Gryga
//Bubble Flinger
//         ))(   )    ( (
//        )))()()))))()())
//        ----------------
//       /                \
//      /                  \
//    ^|   (*)  ^    (*)   |^
//   ( |         \         | )
//    U)          \        (U
//      \          >      /
//        \      \\_//   /
//           \        /
//               ___

//--------------------------------------
//Variables
ArrayList particles;

float rotateRate;
float timeSec;
float degrees = 0;
float hypo = 100;
//--------------------
void setup() {
  size(1000, 1000);
  println("This is a Clock based'Bubble Flinger', which flings bubbles that change color by time");
  particles = new ArrayList();
  smooth(); 
}
//--------------------
void draw   () {
  // Big Clock
  rotate(radians(degrees))    ;
  translate(width/2,height/2) ;
  timeSec     = 59            ;
  rotateRate += 1             ;
  
  float y = sin(radians(degrees)) * hypo /4;
  float x = cos(radians(degrees)) * hypo /4;
  
  println   (minute() + ": " + second())     ;
  background(255)                            ;
  float      w = map(second(), 0, 59, 0, 360);
  float      h = map(second(), 0, 59, 0, 360);
  stroke(30,30,30)       ;
  fill(28,155,37,90)     ;
  rect      ( x, y, w, h);
  degrees =  degrees + 1 ;
}  
//Particle Emitter
   particles.add(new Particle());
  background(255);
  for(int i=0;i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
    //if (y = 100)  {
    //  yspeed = 0;
    //}
  }
  if(particles.size() > 100) {
    particles.remove(0);
  }
}
class Particle{
  float x;
  float y;
  float xspeed;
  float yspeed;
  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-1,1);
    yspeed = random(-2,0);
  }
    void run () {
      x = x + xspeed;
      y = y + yspeed;
    }
    
    void gravity() {
      yspeed += 0.1;
    }
    void display() {
      stroke(0);
      fill (139,157,255,75);
      ellipse (x,y,10,10);
    }
}
