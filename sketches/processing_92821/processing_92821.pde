
ParticleSystem ps; //ps for Particle System
int circleX, circleY;  // Position of circle button
int circleSize = 120;   // Diameter of circle
color circleColor; 
color baseColor;
boolean circleOver = false;
float i;
int a=1;
int b=1;
void setup() {
  ps = new ParticleSystem(new PVector(615,300));
  frameRate (40);
  size(800, 600);
  smooth(40);
  strokeWeight(10);
  //
  circleColor = color(255);
  baseColor = color(102);
  circleX = 300;
  circleY = 180;
 
 //
}
void draw() {
  background(0);
 
   update(mouseX, mouseY);
 noStroke();
 if (circleOver) {
 float i = random (-3,3);
   stroke(255);
  line(120+i, 300+i, 480+i, 300+i);//top
  line(100+i, 320+i, 100+i, 480+i);//left
  line(120+i, 500+i, 480+i, 500+i);//bottom
  line(500+i, 320+i, 500+i, 480+i);//right

  fill(255);
  //Curves
  bezier(120+i, 300+i, 100+i, 300+i, 100+i, 300+i, 100+i, 320+i);//top-left curve
  bezier(480+i, 300+i, 500+i, 300+i, 500+i, 300+i, 500+i, 320+i);//top-right curve
  bezier(100+i, 480+i, 100+i, 500+i, 100+i, 500+i, 120+i, 500+i);//bottom-left curve
  bezier(480+i, 500+i, 500+i, 500+i, 500+i, 500+i, 500+i, 480+i);//bottom-right curve

  //Eyes
  fill(255);
  ellipse(190+i, 360+i, 90, 80); //left eye
  ellipse(410+i, 360+i, 90, 80); //right eye
  stroke(0);
  //Eye Mark
  line(160+i, 340+i, 220+i, 380+i);//left mark
  line(220+i, 340+i, 160+i, 380+i);
  line(380+i, 340+i, 440+i, 380+i);//right mark 
  line(440+i, 340+i, 380+i, 380+i);
  
  //Mouth
  stroke(255);
  //Motuh Square Lines
  line(140+i, 420+i, 460+i, 420+i);//top
  line(120+i, 440+i, 120+i, 480+i);//left
  line(140+i, 490+i, 460+i, 490+i);//bottom
  line(480+i, 440+i, 480+i, 480+i);//right

  //Mouth Curves
  bezier(140+i, 420+i, 120+i, 420+i, 120+i, 420+i, 120+i, 440+i);//top-left curve
  bezier(460+i, 420+i, 480+i, 420+i, 480+i, 420+i, 480+i, 440+i);//top-right curve
  bezier(140+i, 490+i, 120+i, 490+i, 120+i, 490+i, 120+i, 480+i);//bottom-left curve
  bezier(460+i, 490+i, 480+i, 490+i, 480+i, 490+i, 480+i, 480+i);//bottom-right curve

  //Teeth
  line(192+i, 420+i, 192+i, 490+i);
  line(264+i, 420+i, 264+i, 490+i);
  line(336+i, 420+i, 336+i, 490+i);
  line(408+i, 420+i, 408+i, 490+i);

  //Pipe
  line(500+i, 350+i, 580+i, 350+i);
  line(500+i, 380+i, 610+i, 380+i);
  line(600+i, 330+i, 600+i, 310+i);
  bezier(580+i, 350+i, 600+i, 350+i, 600+i, 350+i, 600+i, 330+i); 
  bezier(610+i, 380+i, 630+i, 380+i, 630+i, 380+i, 630+i, 360+i);
  line (630+i, 360+i, 630+i, 310+i);
  ellipse (615+i, 310+i, 30, 10);

  //Bulb
  stroke(255,228,0);
  line (280+i, 300+i, 280+i, 280+i); //left line
  line (320+i, 300+i, 320+i, 280+i); //right line
  fill(255,228,0);
  bezier(280+i, 280+i, 50+i, 50+i, 550+i, 50+i, 320+i, 280+i); //bulb curve
 
  stroke(0);
  line (290+i, 300+i, 290+i, 260+i); //left filament
  bezier (290+i, 260+i, 240+i, 260+i, 290+i, 200+i, 290+i, 230+i);
  line (310+i, 300+i, 310+i, 260+i); //right filament
  bezier (310+i, 260+i, 360+i, 260+i, 310+i, 200+i, 310+i, 230+i);
  stroke(255);
  line (200+i,300+i,400+i,300+i); //repaint bulb bottom 
  
   ps.addParticle(); // running particle system
  ps.run();
  fill(255,228,0);
  textSize(25);
  text("Cargocollective.com/JunhaKimcom",400+i,580+i);
  
 } 
 
 else {stroke(255);
  line(120, 300, 480, 300);//top
  line(100, 320, 100, 480);//left
  line(120, 500, 480, 500);//bottom
  line(500, 320, 500, 480);//right

  //Curves
  bezier(120, 300, 100, 300, 100, 300, 100, 320);//top-left curve
  bezier(480, 300, 500, 300, 500, 300, 500, 320);//top-right curve
  bezier(100, 480, 100, 500, 100, 500, 120, 500);//bottom-left curve
  bezier(480, 500, 500, 500, 500, 500, 500, 480);//bottom-right curve

  //Eyes
  fill(255);
  ellipse(190, 360, 90, 80); //left eye
  ellipse(410, 360, 90, 80); //right eye
  stroke(0);
  //Eye Mark
  line(160, 340, 220, 380);//left mark
  line(220, 340, 160, 380);
  line(380, 340, 440, 380);//right mark 
  line(440, 340, 380, 380);
  
  //Mouth
  stroke(255);
  //Motuh Square Lines
  line(140, 420, 460, 420);//top
  line(120, 440, 120, 480);//left
  line(140, 490, 460, 490);//bottom
  line(480, 440, 480, 480);//right

  //Mouth Curves
  bezier(140, 420, 120, 420, 120, 420, 120, 440);//top-left curve
  bezier(460, 420, 480, 420, 480, 420, 480, 440);//top-right curve
  bezier(140, 490, 120, 490, 120, 490, 120, 480);//bottom-left curve
  bezier(460, 490, 480, 490, 480, 490, 480, 480);//bottom-right curve

  //Teeth
  line(192, 420, 192, 490);
  line(264, 420, 264, 490);
  line(336, 420, 336, 490);
  line(408, 420, 408, 490);

  //Pipe
  line(500, 350, 580, 350);
  line(500, 380, 610, 380);
  line(600, 330, 600, 310);
  bezier(580, 350, 600, 350, 600, 350, 600, 330); 
  bezier(610, 380, 630, 380, 630, 380, 630, 360);
  line (630, 360, 630, 310);
  ellipse (615, 310, 30, 10);

  //Bulb
  line (280, 300, 280, 280); //left line
  line (320, 300, 320, 280); //right line
  fill(255);
  bezier(280, 280, 50, 50, 550, 50, 320, 280); //bulb curve
  stroke(0);
  line (290, 300, 290, 260); //left filament
  bezier (290, 260, 240, 260, 290, 200, 290, 230);
  line (310, 300, 310, 260); //right filament
  bezier (310, 260, 360, 260, 310, 200, 310, 230);
  stroke(255);
  line (200,300,400,300); //repaint bulb bottom;
  
  fill (255);
  textSize (25);
  text("Imagination Generator",480,580);
  }
 
}
void update(int x, int y) {
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  } else {
    circleOver = false;
  }
}
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.-0.01);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= -10.0;
  }

  // Method to display
  void display() {
    stroke(255,228,0,lifespan);
    fill(255,228,0,lifespan);
    ellipse(location.x,location.y,random(10,20),random(10,20));
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}




// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

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
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}
