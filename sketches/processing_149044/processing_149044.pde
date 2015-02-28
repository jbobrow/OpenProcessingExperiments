
//GROSS SOBBING I DUN CARE ANYMOREOEEOR
//hi

int collisions = 0;
float score = 1;
Wall wall1 = new Wall(1000);
Wall wall2 = new Wall(1500);
private boolean firstScreen = true;
private boolean gameStart = false;
private boolean gameEnd = false;

public class Wall {
  private float x;
  private float y;
  private int w = 30; //width of rectangle
  private int h = 230; //height of rectangle
  private int velocity = 8;

  public Wall(float pos) {
    x = pos;
    y = random(0, 270);
  }

  public void render() {
    fill(0);
    rect(x, y, w, h);
  }

  public void move(Walrus a) {
    x = x - velocity;
    for (float i = y; i <= h + y; i = i + h/10) { //checks for collision points every 1/10 pixels of height
      if (collision(new PVector(x, i), a) == true) {
        collisions++;
        if (collisions > 3) { //??????????? >:3
          gameStart = false;
          gameEnd = true;
        }
        x = x + 1000;
        resetY();
      }
    }
  }

  public float getX() {
    return x;
  }

  public void resetX() {
    x = 1000;
  }

  public void resetY() {
    y = random(0, 270);
  }
}

public class Walrus {
  private int m; //size of walrus
  private int e; //size of eyes
  private int x;
  private int y;
  private int clra; //color1
  private int clrb; //color2
  private int clrc; //color3


  public Walrus(int s) { //for first walrus only
    m = s;
    x = mouseX;
    y = mouseY;
    e = 4;
    clra = (int)(Math.random()*256);
    clrb = (int)(Math.random()*256);
    clrc = (int)(Math.random()*256);
  }

  public Walrus(int s, int d, int b) { //second gen walruses
    m = s/d;
    e = 4 - d;
    if (b == 1) { //mid walrus
      x = mouseX + m*2;  
      y = mouseY;
    } else if (b == 2) { //bot walrus
      x = mouseX;
      y = mouseY + m*2;
    } else if (b == 3) { //top walrus
      x = mouseX;
      y = mouseY - m*2;
    }
    clra = (int)(Math.random()*256);
    clrb = (int)(Math.random()*256);
    clrc = (int)(Math.random()*256);
  }

  public Walrus(int s, int d, int b, int h) { //third gen walruses
    m = s/d;
    e = 4 - d;
    if (b == 1) { //top walrus
      if (h == 1) {
        x = mouseX + m*3;  
        y = mouseY - m*4;
      } else if (h == 2) {
        x = mouseX;
        y = mouseY - m*5;
      } else if (h == 3) {
        x = mouseX;// + m*2;
        y = mouseY - m*2;
      }
    } else if (b == 2) { //mid walrus
      if (h == 1) {
        x = mouseX + m*5;
        y = mouseY;
      } else if (h == 2) {
        x = mouseX + m*4;
        y = mouseY - m*2;
      } else if (h == 3) {
        x = mouseX + m*4;
        y = mouseY + m*2;
      }
    } else if (b == 3) { //bot walrus
      if (h == 1) {
        x = mouseX + m*3;
        y = mouseY + m*4;
      } else if (h == 2) { //t
        x = mouseX;
        y = mouseY + m*5;
      } else if (h == 3) { //b
        x = mouseX;
        y = mouseY + m*2;
      }
    } 
    clra = (int)(Math.random()*256);
    clrb = (int)(Math.random()*256);
    clrc = (int)(Math.random()*256);
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public int getM() {
    return m;
  }

  public void render() {
    stroke(255);

    ellipse(x-m/2-m/3, y, m*2, m*2); //hitbox for one walrus


    fill(clra, clrb, clrc);
    ellipse(x-m+m/12, y, m*3, m*2);
    triangle(x+m/3, y+m/2.1, x+m*2/3, y+m/2.1, x+m/2, y+m*5/6);
    triangle(x-m/3, y+m/2.1, x-m*2/3, y+m/2.1, x-m/2, y+m*5/6);
    ellipse(x+m/2, y, m, m);
    ellipse(x-m/2, y, m, m);

    fill(clrc, clrb, clra); //eye color 
    ellipse(x, y-m*3/5, e, e); //eye
    ellipse(x-m/2, y-m*3/5, e, e); //eye
    //whiskers
    line(x+m*2/3, y-m/4, x+m+m/4, y-m/2);
    line(x+m*2/3, y, x+m+m/4, y);
    line(x+m*2/3, y+m/4, x+m+m/4, y+m/2);
    line(x-m*2/3, y-m/4, x-m-m/4, y-m/2);
    line(x-m*2/3, y, x-m-m/4, y);
    line(x-m*2/3, y+m/4, x-m-m/4, y+m/2);
    //fill(clra, clrb, clrc);
  }
}

public boolean collision(PVector wallLoc, Walrus a) { //a&b represent coordinates of the wall
  PVector curLoc = new PVector(a.getX(), a.getY()); //center of walruses
  int radius = a.getM();
  if (curLoc.dist(wallLoc) <= radius) {
    return true;
  } else {
    return false;
  }
}

void setup() {  //setup function called initially, only once
  size(1000, 500);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {


  if (firstScreen == true) {
    background(0);
    String txt1 = "If you are a photosensitive epileptic or bothered by flashing images/colors, please do not start the game.";
    String txt2 = "Otherwise, click anywhere on the screen to start c:";
    textSize(32);
    text(txt1, 100, 100, 900, 250);
    text(txt2, 100, 250, 900, 400);
    fill(255);
  } else if (gameStart == true) {
    score += 0.01666;
    background(0);
    String scoretxt = "" + (int)(score*100)/100;
    text(scoretxt, 10, 40);
    if ( wall1.getX() <= -30) {
      wall1.resetX();
      wall1.resetY();
    }
    wall1.render();

    if ( wall2.getX() <= -30) {
      wall2.resetX();
      wall2.resetY();
    }
    wall2.render();
    if (collisions == 1) {
      Walrus w = new Walrus(80);
      w.render();
      wall1.move(w);
      wall2.move(w);
    } else if (collisions == 2) {
      Walrus w = new Walrus(80, collisions, 1);
      Walrus a = new Walrus(80, collisions, 2);
      Walrus t = new Walrus(80, collisions, 3);
      w.render();
      a.render();
      t.render();

      ArrayList<Walrus> walri = new ArrayList<Walrus>();
      walri.add(w);
      walri.add(a);
      walri.add(t);

      for (Walrus hello : walri) {
        wall1.move(hello);
        wall2.move(hello);
      }
    } else if (collisions >= 3) {
      Walrus w = new Walrus(80, collisions, 1, 1);
      Walrus a = new Walrus(80, collisions, 2, 1);
      Walrus t = new Walrus(80, collisions, 3, 1);
      Walrus h = new Walrus(80, collisions, 1, 2);
      Walrus s = new Walrus(80, collisions, 2, 2);
      Walrus e = new Walrus(80, collisions, 3, 2);
      Walrus u = new Walrus(80, collisions, 1, 3);
      Walrus o = new Walrus(80, collisions, 2, 3);
      Walrus p = new Walrus(80, collisions, 3, 3);
      w.render();
      a.render();
      t.render();
      h.render();
      e.render();
      s.render();
      u.render();
      o.render();
      p.render();

      ArrayList<Walrus> walri = new ArrayList<Walrus>();
      walri.add(w);
      walri.add(a);
      walri.add(t);
      walri.add(h);
      walri.add(e);
      walri.add(s);
      walri.add(u);
      walri.add(o);
      walri.add(p);
      for (Walrus ihatethis : walri) {
        wall1.move(ihatethis);
        wall2.move(ihatethis);
      }
    }
  } else if (gameEnd == true) {
    background(0);
    textSize(32);
    fill(255);
    text("GAME OVER", 410, 200);
    String scoretxt = "" + (int)(score*100)/100;
    text(scoretxt, 480, 250);
  }
}

void mouseClicked() {
  firstScreen = false;
  gameStart = true;
  collisions++;
}

