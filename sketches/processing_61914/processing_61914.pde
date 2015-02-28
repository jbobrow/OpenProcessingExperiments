
player player1 = null;
int playery = 460;
int playerx = 320;
int movespeed = 3;
int playerbulletspeed = 32;
int playerbulletfocus = 6;
PImage playerchar = null;
Bullet bull = null;
boolean firstMenuChoice = true;
boolean Firing = false;
boolean Focus = false;
boolean moveleft = false;
boolean moveright = false;
boolean moveup = false;
boolean movedown = false;
ArrayList<menu> titles = new ArrayList<menu>();
ArrayList<Bullet> bulletsonscreen = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
menu currmenu = null;

void setup() {
  titles.add(new TitleScreen1());
  titles.add(new TitleScreen2());
  titles.add(new TitleScreen3());
  titles.add(new TitleScreen4());
  titles.add(new TitleScreen5());
  titles.add(new TitleScreen6());
  titles.add(new TitleScreen7());
  titles.add(new TitleScreen8());
  titles.add(new TitleScreen9());
  currmenu = titles.get(0);
  size(640,480);
  currmenu.render();
}
void draw() {
  background(255);
  if( player1 == null) {
  currmenu.render();
  }
  else if ( player1 != null) {
  player1.Render();
    if( Firing == true) {
      bulletsonscreen.add(player1.getBullet());
    }
    if( bulletsonscreen.size() >= 1) {
      for(int i = 0; i < bulletsonscreen.size(); i++) {
        if( bulletsonscreen.get(i).getX() < 0 || bulletsonscreen.get(i).getY() < 0 || bulletsonscreen.get(i).getX() > 640 || bulletsonscreen.get(i).getY() > 480) {
          bulletsonscreen.remove(i);
        }
      }
    }
    if(bulletsonscreen.size() >= 1) {
      for(int i = 0; i< bulletsonscreen.size(); i++) {
        if(Focus == false) {
          bulletsonscreen.get(i).Render(playerbulletspeed);
        }
        else if(Focus == true) {
          bulletsonscreen.get(i).Render(playerbulletfocus);
        }
      }
    }
  }
} 
public abstract class menu {
 public abstract void render();
}
public class TitleScreen1 extends menu{
  PImage menu = loadImage("Reimu.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen2 extends menu{
  PImage menu = loadImage("ReimuA.JPG");
  public void render() {
    image(menu,0,0);
  }
}public class TitleScreen3 extends menu{
  PImage menu = loadImage("ReimuB.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen4 extends menu{
  PImage menu = loadImage("Sakuya.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen5 extends menu{
  PImage menu = loadImage("SakuyaA.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen6 extends menu{
  PImage menu = loadImage("SakuyaB.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen7 extends menu{
  PImage menu = loadImage("Marisa.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen8 extends menu{
  PImage menu = loadImage("MarisaA.JPG");
  public void render() {
    image(menu,0,0);
  }
}
public class TitleScreen9 extends menu{
  PImage menu = loadImage("MarisaB.JPG");
  public void render() {
    image(menu,0,0);
  }
}
void keyPressed() {
  if(player1 == null) {
    if( key == CODED && keyCode == LEFT) {
    if ( currmenu == titles.get(0)) {
        currmenu = titles.get(3);
    }
    else if ( currmenu == titles.get(3)) {
        currmenu = titles.get(6);
    }
    else if ( currmenu == titles.get(6)) {
        currmenu = titles.get(0);
    }
    else if ( currmenu == titles.get(1)) {
        currmenu = titles.get(2);
    }
    else if ( currmenu == titles.get(2)) {
        currmenu = titles.get(1);
    }
    else if ( currmenu == titles.get(4)) {
        currmenu = titles.get(5);
    }
    else if ( currmenu == titles.get(5)) {
        currmenu = titles.get(4);
    }
    else if ( currmenu == titles.get(8)) {
        currmenu = titles.get(7);
    }
    else if ( currmenu == titles.get(7)) {
        currmenu = titles.get(8);
    }
    }
    else if( key == CODED && keyCode == RIGHT) {
    if ( currmenu == titles.get(0)) {
        currmenu = titles.get(6);
    }
    else if ( currmenu == titles.get(6)) {
        currmenu = titles.get(3);
    }
    else if ( currmenu == titles.get(3)) {
        currmenu = titles.get(0);
    }
    else if ( currmenu == titles.get(1)) {
        currmenu = titles.get(2);
    }
    else if ( currmenu == titles.get(2)) {
        currmenu = titles.get(1);
    }
    else if ( currmenu == titles.get(4)) {
        currmenu = titles.get(5);
    }
    else if ( currmenu == titles.get(5)) {
        currmenu = titles.get(4);
    }
    else if ( currmenu == titles.get(8)) {
        currmenu = titles.get(7);
    }
    else if ( currmenu == titles.get(7)) {
        currmenu = titles.get(8);
    }
    }
    else if( key == 'z' || key == 'Z') {
    if ( currmenu == titles.get(0)) {
        currmenu = titles.get(1);
    }
    else if ( currmenu == titles.get(3)) {
        currmenu = titles.get(4);
    }
    else if ( currmenu == titles.get(6)) {
        currmenu = titles.get(7);
    }
    else if ( currmenu == titles.get(1)) {
        player1 = new ReimuA();
        playerchar = loadImage("Reimuplaying.GIF");
        Bullet tmp = new ReimuABullet();
        bull = tmp;
    }
    else if ( currmenu == titles.get(2)) {
        player1 = new ReimuB();
        playerchar = loadImage("Reimuplaying.GIF");
        bull = new ReimuBBullet();
    }
    else if ( currmenu == titles.get(4)) {
        player1 = new SakuyaA();
        playerchar = loadImage("Sakuyaplaying.GIF");
        bull = new SakuyaABullet();
    }
    else if ( currmenu == titles.get(5)) {
        player1 = new SakuyaB();
        playerchar = loadImage("Sakuyaplaying.GIF");
        bull = new SakuyaBBullet();
    }
    else if ( currmenu == titles.get(7)) {
        player1 = new MarisaA();
        playerchar = loadImage("Marisaplaying.GIF");
        bull = new MarisaABullet();
    }
    else if ( currmenu == titles.get(8)) {
        player1 = new MarisaB();
        playerchar = loadImage("Marisaplaying.GIF");
        bull = new MarisaBBullet();
      }
    }
    else if (key == 'x' || key == 'X') {
    if( currmenu == titles.get(1) || currmenu == titles.get(2)) {
        currmenu = titles.get(0);
    }
    if( currmenu == titles.get(4) || currmenu == titles.get(5)) {
        currmenu = titles.get(3);
    }
    if( currmenu == titles.get(7) || currmenu == titles.get(8)) {
        currmenu = titles.get(6);
    }



    }
  }
  else if( player1 != null) {
    if ( key == 'z' || key == 'Z') {
        Firing = true;
    }
    else if ( key == 'x' || key == 'X') {
        player1.Bomb();
    }
    else if ( key == CODED && keyCode == SHIFT) {
        Focus = true;
    }
    else if ( key == CODED && keyCode == LEFT) {
        moveleft = true;
    }
    else if ( key == CODED && keyCode == RIGHT) {
        moveright = true;
         
    }
    else if ( key == CODED && keyCode == DOWN) {
         movedown = true;
    }
    else if ( key == CODED && keyCode == UP) {
        moveup = true;
    }
  }
   
}


void keyReleased() {
    if ( key == 'z' || key == 'Z') {
        Firing = false;
    }
    else if ( key ==  CODED && keyCode == SHIFT) {
        Focus = false;
    }
    else if ( key == CODED && keyCode == LEFT) {
        moveleft = false;
    }
    else if ( key == CODED && keyCode == RIGHT) {
        moveright = false;
    }
    else if ( key == CODED && keyCode == UP) {
        moveup = false;
    }
    else if ( key == CODED && keyCode == DOWN) {
        movedown = false;
    }
}
  
    
public abstract class player {
  public void Bomb() {
  }
  public abstract void Render();
  public abstract Bullet getBullet();
}
public abstract class Bullet {
  public abstract void Render(int Speed);
  public abstract int getX();
  public abstract int getY();
}

public class ReimuA extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new ReimuABullet();
    }
}
public class ReimuB extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new ReimuABullet();
    }
}
public class SakuyaA extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new SakuyaABullet();
    }
}
public class SakuyaB extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new SakuyaABullet();
    }
}
public class MarisaA extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new MarisaABullet();
    }
}
public class MarisaB extends player {
    public void Render() {
        imageMode(CENTER);
        image(playerchar, playerx, playery);
        if( moveup == true) {
          playery = playery - movespeed;
        }
        if( movedown == true) {
          playery = playery + movespeed;
        }
        if( moveleft == true) {
          playerx = playerx - movespeed;
        }
        if( moveright == true) {
          playerx = playerx + movespeed;
        }
        imageMode(CORNER);
    }
    public Bullet getBullet() {
      return new MarisaABullet();
    }
}
public class ReimuABullet extends Bullet {
  public int x = playerx;
  public int y = playery - 10;
  PImage img = loadImage("ReimuABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }  
}
public class ReimuBBullet extends Bullet {
   public int x = playerx;
  public int y = playery - 10;
  PImage img = loadImage("ReimuABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
public class SakuyaABullet extends Bullet {
   public int x = playerx;
  public int y = playery - 10;
  PImage img = loadImage("SakuyaABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
public class SakuyaBBullet extends Bullet {
   public int x = playerx;
  public int y = playery - 10;
  PImage img = loadImage("SakuyaABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
public class MarisaABullet extends Bullet {
   public int x = playerx;
  public int y = playery -10;
  PImage img = loadImage("MarisaABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
public class MarisaBBullet extends Bullet {
   public int x = playerx;
  public int y = playery - 10;
  PImage img = loadImage("MarisaABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
public abstract class Enemy {
}
public class EnemyBullet extends Bullet {
   public int x = playerx;
  public int y = playery;
  PImage img = loadImage("ReimuABullet.JPG");
  public void Render(int speed) {
   imageMode(CENTER);
   image(img,x,y);
   y = y - speed;
   imageMode(CORNER);
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}

