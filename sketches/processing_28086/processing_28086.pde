
class Circle {
  
  private int x, y;
  private Circle next;
  private AudioPlayer audio;
  private boolean exploded = false;
  
  private List<Particle> particles = new ArrayList<Particle>();
  
  public Circle(int x, int y, String audio) {
    this.x = x;
    this.y = y;
    this.audio = minim.loadFile(audio);
    this.audio.play();
  }
  
  public void add() {
    if (next == null) {
      next = new Circle(mouseX, mouseY, names[(int) random(names.length)]);
    } else{
      next.add();
    }
  }
  
  public void draw() {
    if (!exploded) {
      fill(0, 10, 255, 100);
      stroke(0);
      ellipse(x, y, 20, 20);
    } else {
      for (Particle particle : particles) {
        particle.update();
      }
    }
    
    stroke(0);
    strokeWeight(0.2);
    if (next != null) {
      line(x, y, next.x, next.y);
      next.draw();
    }
  }
  
  public void drawLine() {
    if (next != null) {
      next.drawLine();
    } else {
      line(x,y,mouseX,mouseY);
    }
  }
  
  public void play() {
    if (exploded) {
      if (next != null) {
        next.play();
      }
    } else {
      audio.play();
    }
  }
  
  public boolean isPlaying() {
    if (exploded) {
      if (next != null) {
        return next.isPlaying();
      } else {
        return true;
      }
    }
    return audio.isPlaying();   
  }
  
  public void explode() {
    if (exploded) {
      if (next != null) {
        next.explode();
      }
    } else {
      exploded = true;
      for (int i = 100; i >= 0; i--) {
        particles.add(new Particle(x,y));
      }    
    }
  }
  
}

