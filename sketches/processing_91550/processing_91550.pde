
ArrayList<ghost> ghosts = new ArrayList<ghost>();
ghostFactory factory = null;
int score = 0, shot = 0, life = 3, cooldown = 0, superPac = 0;
PImage pacman;

void setup() {
  size(600, 620);
  background(0);
  factory = new ghostFactory();
  for (int i = 0; i < 5; i++) {
    ghosts.add(new ghost(i));
  }
  pacman = factory.newGhost(0);
}

void draw() {
  stroke(255);
  background(0);
  text("Score:" + score, 25, 25);
  text("Lives:" + life, 25, 50);
  if (superPac > 0){
    text("SuperPac enabled. Time remaining: " + superPac, 25,75);
  }

  
  //text("SuperPac:" + superPac, 25, 75);
  if (shot > 0) {
    line(mouseX, 0, mouseX, height);
  }
  for (ghost g: ghosts) {
    g.update();
  }
  image(pacman, mouseX - 12.5, height - 50);
  if (life == 0) {
    textSize(20);
    text("Game Over", width/2, height/2);
    noLoop();
  }
  cooldown --;
  shot --;
  superPac --;
}

void mousePressed() {
  if (cooldown < 0) {
    shot = 2;
    cooldown = 10;
  }
}
class superPacItem extends ghost {
  public superPacItem(int index) {
    super(index);
  }
  @Override
    public void update() {
    if (pow(mouseX - x, 2) < 400 && y > height - 50) {
      superPac = 1000;
      instantiate();
    }
    fill(random(0x0000FF) + 0xFFFF00);
    ellipse(x, y, 25, 25);
    fill(255);
    y += speed;
  }
}
class ghost {
  public float x, y, speed;
  public PImage c;
  public int index;
  public ghost(int index) {
    this.index = index;
    this.x = random(width);
    this.y = 0;
    this.c = factory.newGhost((int)(random(1)*4 + 1));
    this.speed = random(2) + log((score + 1))/5;
  }
  public void update() {
    if (shot > 0 && abs((x + 12.5) - mouseX) < 25) {
      ellipse(x, y, 10, 10);
      score++;
      instantiate();
    }
    if (abs((x + 12.5) - mouseX) < 25 && y > height - 75) {
      if (superPac > 0) {
        score += 10;
        life ++;
        instantiate();
      } 
      else {
        score -= 5;
        life --;
        instantiate();
      }
    }
    if (this.y > height - 50) {
      life --;
      instantiate();
    }
    image(c, x, y);
    this.y += speed;
  }

  public void instantiate() {
    float c = random(100);
    if (c < 3) {
      ghosts.set(index, new superPacItem(index));
    } 
    else {
      ghosts.set(index, new ghost(index));
    }
    
  }
}
class ghostFactory {
  PImage[] ghostFactory;
  public ghostFactory() {
    ghostFactory = new PImage[] {
      loadImage("pacman.png"), loadImage("ghostred.png"), loadImage("ghostblue.png"), loadImage("ghostorange.png"), loadImage("ghostpink.png")
      };
    }
    public PImage newGhost(int type) {
      return ghostFactory[type];
    }
}

