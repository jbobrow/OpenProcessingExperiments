

class Particle extends VerletParticle2D {

  float timer;
  float colorChange;
  float size;
  char letter;
  float red;

  Particle(float x, float y) {
    super(x, y);
    timer=90;
    colorChange = 255;
    size = random(32,100);
    this.addForce(new Vec2D(random(-3,3), random(-3, 3)));
    letter = (char) random((int) 'A',(int) 'Z');
    red = random(255);
  }

  void display() {
    fill(red - colorChange/2,255 - colorChange,colorChange, timer);
    noStroke();
    ellipse(x, y, size, size);
    fill(255,timer);
    text(letter,x,y);
//text("Sp1R4l",x,y);
  }

  void update()
  {
    super.update();
    timer -= 0.5;
    colorChange -= 1.3;
  }

  boolean dead()
  {
    if (timer<=0.0 || sq(x) > (sq(width)+sq(height))/2 || sq(y) > (sq(width)+sq(height))/2)
    {
      return(true);
    }
    else
    {
      return(false);
    }
  }
}


