
/* Vincent Hsiao
   2/28/13 PD 6
   The Astroid Invaders Game
   Game Description: Take control of a red ship and survive as long as possible against and onslaught of
   astroids and hostile enemies. Score is determined by time survived and points gained from enemy and
   asteroid destruction.
   
   Controls:
   Move: Arrow Keys
   Shoot: Space
   Bomb: B
   Point Block: Mouse
   
   Asteroids:
   Regular - regularly shaped asteroids without extreme deformations
   Spiked - capable of launching itself at high speeds if hit from the long deformed side
   Boss - a large box that is capable of hitting high damage and spawning large amounts of children asteroids
   
   Enemies:
   Mini Ship - similar to the player ship, but can only drift and shoot at the player
   Mine Layer - looks like "pants", lays star shaped mines that explode on contact
   Charger - enemy that looks like an "H" that charges up by rotating at high speeds and firing a circle of shots
   Shuriken - enemies that target the player and explode on contact, looks like rotating shurikens.
   Missile Launcher - looks like a rectangle with a small rectangular dent on one side, fires shurikens at the player.
   Hanger - spawns all the above enemies, looks like a giant missile launcher
   
   Powerups (Blue colored):
   Arrow - increase shots fired
   Sword - shots pierce through asteroids
   Star - shots slow down asteroids
   Bomb - gives 1 bomb
   Health - replenishes 500 health
   Armor - reduces damage taken - not implemented yet
   
*/


import java.util.ArrayList;

  ArrayList<Shape> shapes = new ArrayList<Shape>();
  ArrayList<EnemyShape> enemys = new ArrayList<EnemyShape>();
  ArrayList<Shape> bullets = new ArrayList<Shape>();
  ArrayList<Shape> enemybullets = new ArrayList<Shape>();
  ArrayList<PowerUp> powers = new ArrayList<PowerUp>();
  ArrayList<HitNumber> hits = new ArrayList<HitNumber>();
  Player player;
  int counter = 0;
  int explode = 0;
  int loc1 = 0;
  int loc2 = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int shots = 1;
  double spawnRate = 1;
  double score = 0;
  int finalScore = 0;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  boolean bigboom = false;
  boolean clicked = false;
  boolean space = false;
  int shootDelay = 0;
  int freezing = 0;
  int piercing = 0;
  int bombs = 5;
  int armor = 1;
  ArrayList<Explosion> explosions = new ArrayList<Explosion>();
  public static final int[][] crown = { { -25, -25 }, { -25, 25 },
      { 25, 25 }, { 25, -25 }, { 12, 0 }, { 0, -50 }, { -12, 0 } };
  public static final int[][] miniCrown = { { -12, -12 }, { -12, 12 },
      { 12, 12 }, { 12, -12 }, { 6, 0 }, { 0, -25 }, { -6, 0 } };
  public static final int[][] obliqueShape = { { -25, -25 }, { 100, -25 },
      { 50, 60 }, { 30, 55 }, { 23, 45 }, { 33, 18 }, { 0, 0 } };
  public static final int[][] shape1 = { { 0, -25 }, { 16, -16 }, { 25, 0 },
      { 16, 16 }, { 0, 25 }, { -16, 16 }, { -25, 0 }, { -16, -16 } };
  public static final int[][] shape2 = { { 0, -25 }, { 16, -16 }, { 25, 0 },
      { 16, 30 }, { 0, 25 }, { -16, 30 }, { -25, 0 }, { -16, -16 } };
  public static final int[][] shape3 = { { 0, -25 }, { 16, -16 }, { 25, 0 },
      { 16, 30 }, { 0, 250 }, { -16, 30 }, { -25, 0 }, { -16, -16 } };
  public static final int[][] point2 = { { 0, 0 } };
  public static final int[][] line2 = { { 0, -4 }, { 0, 4 } };
  public static final int[][] box = { { -2, -2 }, { 2, -2 }, { 2, 2 },
      { -2, 2 } };
  public static final int[][] mine =  { { -3, -3 }, { 0, -10 }, { 3, -3 },
    { 10, 0 }, { 3, 3 }, { 0, 10 }, { -3, 3 }, { -10, 0 } };
  public static final int[][] upArrow = { { -15, 0 }, { 0, -15 }, { 15, 0 },
      { 6, 0 }, { 6, 20 }, { -6, 20 }, { -6, 0 } };
  public static final int[][] plus = { { -7, -7 }, { -10, -20 }, { 10, -20 },
      { 7, -7 }, { 20, -10 }, { 20, 10 }, { 7, 7 }, { 10, 20 },
      { -10, 20 }, { -7, 7 }, { -20, 10 }, { -20, -10 } };
  public static final int[][] sword = { { -7, -7 }, { -10, -30 }, { 0, -40 },
      { 10, -30 }, { 7, -7 }, { 20, -7 }, { 20, 7 }, { 7, 7 }, { 7, 20 },
      { -7, 20 }, { -7, 7 }, { -20, 7 }, { -20, -7 } };
  public static final int[][] smallCrown = { { -15, -15 }, { -15, 15 },
      { 15, 15 }, { 15, -15 }, { 7, 0 }, { 0, -30 }, { -7, 0 } };
  public static final int[][] box2 = { { -200, -200 }, { 200, -200 },
      { 200, 200 }, { -200, 200 } };
  public static final int[][] bomb = { { -3, -12 }, { -3, -15 }, { 3, -15 },
      { 3, -12 }, { 8, -8 }, { 12, 0 }, { 8, 15 }, { 0, 12 }, { -8, 15 },
      { -12, 0 }, { -8, -8 } };
  public static final int[][] freeze = { { -5, -5 }, { 0, -20 }, { 5, -5 },
      { 20, 0 }, { 5, 5 }, { 0, 20 }, { -5, 5 }, { -20, 0 } };
  public static final int[][] shieldUp = { {-10,5},{10,5},{10,-5},{-10,-5}};
  public static final int[][] spinner = { { -20, -20 }, { 20, -20 },
      { 20, -15 }, { 5, -15 }, { 5, 15 }, { 20, 15 }, { 20, 20 },
      { -20, 20 }, { -20, 15 }, { -5, 15 }, { -5, -15 }, { -20, -15 } };
  public static final int[][] suiShape = { { 0, -10 }, { 10, -10 },
      { 5, -5 }, { 10, 0 }, { 10, 10 }, { 5, 5 }, { 0, 10 }, { -10, 10 },
      { -5, 5 }, { -10, 0 }, { -10, -10 }, { -5, -5 } };
  public static final int[][] hanger = { { -30, -20 }, { -20, -20 },
      { -20, -10 }, { 20, -10 }, { 20, -20 }, { 30, -20 }, { 30, 20 },
      { -30, 20 } };
  public static final int[][] hanger2 = { { -60, -40 }, { -40, -40 },
      { -40, -20 }, { 40, -20 }, { 40, -40 }, { 60, -40 }, { 60, 40 },
      { -60, 40 } };
  public static final int[][] mineLayer = { { -20, -30 }, { -10, -30 },
      { -10, 0 }, { 10, 0 }, { 10, -30 }, { 20, -30 }, { 20, 20 },
      { 30, 30 }, { -30, 30 }, { -20, 20 } };

  public void setup() {
    size(800, 800);
    background(0);

    int[][] coords = crown;
    player = new Player(new Shape(coords), 200, 200);
    player.GetHitArea().setCenter(200, 200);

  }

  public void draw() {
    this.background(10);
    stroke(255);
    this.rect(mouseX - 5, mouseY - 5, 10, 10);
    score += 0.01*spawnRate*spawnRate;
    if (space && shootDelay < 0) {
      for (int i = 0; i < shots; i++) {
        int[][] coords = box;
        Shape s = new Shape(coords);
        s.setXVelocity(Math.cos(player.getDirection() + Math.PI / 60
            * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
        s.setYVelocity(Math.sin(player.getDirection() + Math.PI / 60
            * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
        s.setRotationVelocity(0.08);
        s.setCenter(
            player.GetHitArea().getCenterX()
                + Math.cos(player.getDirection()) * 50,
            player.GetHitArea().getCenterY()
                + Math.sin(player.getDirection()) * 50);
        bullets.add(s);
      }
      shootDelay = 5;
    } else {
      shootDelay--;
    }

    if (Math.random() * 250 > 249) {
      int[][] coords = upArrow;
      int type = 0;
      if (Math.random() * 10 > 7) {
        coords = plus;
        type = 1;
      } else if (Math.random() * 10 > 5) {
        coords = sword;
        type = 2;
      } else if (Math.random() * 10 > 3) {
        coords = bomb;
        type = 3;
      } else if (Math.random() * 10 > 2) {
        coords = freeze;
        type = 4;
      }
      PowerUp s = new PowerUp(coords, type);
      s.setXVelocity(Math.random() * 2 - 1);
      s.setYVelocity(Math.random() * 2 - 1);
      double loc = Math.random() * width * 2;
      double loc2 = Math.random() * height * 2;
      if (loc > width) {
        if (loc2 > height) {
          s.setCenter(-(width - loc), -75);
        } else {
          s.setCenter(-(width - loc), height + 99);
        }
      } else {
        if (loc2 > height) {
          s.setCenter(-74, -(height - loc2));
        } else {
          s.setCenter(width + 99, loc2);
        }
      }
      s.setRotationVelocity(Math.random() / 25 - 0.02);
      powers.add(s);
    }

    if (Math.random() * 250 > 249.5) {
      if (shapes.size() < 10 + spawnRate || Math.random() * 10 > 9.9) {
        int[][] coords = shape2;
        if ((shapes.size() >= 100 || Math.random() * 10 > 9.9) && spawnRate > 10) {
          coords = box2;
        } else if (Math.random() * 10 > 8) {
          coords = obliqueShape;
        } else if (Math.random() * 10 > 6) {
          coords = shape1;
        } else if (Math.random() * 10 > 4) {
          coords = shape2;
        } else if (Math.random() * 10 > 2) {
          coords = shape3;
        }
        Shape s = new Shape(coords);
        s.setXVelocity((Math.random() * 2 - 1) * spawnRate / 2);
        s.setYVelocity((Math.random() * 2 - 1) * spawnRate / 2);
        double loc = Math.random() * width * 2;
        double loc2 = Math.random() * height * 2;
        if (loc > width) {
          if (loc2 > height) {
            s.setCenter(-(width - loc), -75);
          } else {
            s.setCenter(-(width - loc), height + 99);
          }
        } else {
          if (loc2 > height) {
            s.setCenter(-74, -(height - loc2));
          } else {
            s.setCenter(width + 99, loc2);
          }
        }
        s.setRotationVelocity(Math.random() / 25 - 0.02);
        shapes.add(s);
      }

    }
    if (Math.random() * 250 > 249.9 - spawnRate / 50) {
      int[][] coords = miniCrown;
      EnemyShape s;
      if (Math.random() * 10 > 8.5) {
        coords = spinner;
        s = new Spinner(coords, 150);
      } else if (Math.random() * 10 > 7) {
        coords = suiShape;
        s = new Suicider(coords, 20);
      } else if (Math.random() * 10 > 5.5) {
        coords = hanger;
        s = new HomingLauncher(coords, 150);
      } else if (Math.random() * 10 > 5.4 && spawnRate > 15) {
        coords = hanger2;
        s = new Hanger(coords, 400);
      } else if (Math.random() * 10 > 3.5) {
        coords = mineLayer;
        s = new MineLayer(coords, 200);
      }else {
        s = new EnemyShape(coords, 50);
      }
      s.setXVelocity(Math.random() * 2 - 1);
      s.setYVelocity(Math.random() * 2 - 1);
      double loc = Math.random() * width * 2;
      double loc2 = Math.random() * height * 2;
      if (loc > width) {
        if (loc2 > height) {
          s.setCenter(-(width - loc), -75);
        } else {
          s.setCenter(-(width - loc), height + 99);
        }
      } else {
        if (loc2 > height) {
          s.setCenter(-74, -(height - loc2));
        } else {
          s.setCenter(width + 99, loc2);
        }
      }
      s.setRotationVelocity(Math.random() / 25 - 0.02);
      enemys.add(s);
    }
    if (mousePressed) {
      if (!clicked) {
        explode = 255;
        loc1 = mouseX;
        loc2 = mouseY;
        b = (int) Math.round(Math.random() * 256);
        c = (int) Math.round(Math.random() * 256);
        d = (int) Math.round(Math.random() * 256);
        Explosion e = new Explosion(loc1, loc2, explode, b, c, d);
        explosions.add(e);
        clicked = true;
      }

    } else {
      clicked = false;
    }
    this.stroke(255, 0, 0, 255);
    for (int i = 0; i < shapes.size(); i++) {
      int size2 = 0;
      int size3 = 0;
      double[][] e = shapes.get(i).getCoords();
      int[][] f = new int[e.length][e[0].length];
      for (int j = 0; j < f.length; j++) {
        f[j][0] = (int) e[j][0] / 4 * 3;
        f[j][1] = (int) e[j][1] / 4 * 3;
        size2 += Math.abs(e[j][0]);
        size3 += Math.abs(e[j][1]);
      }
      int size4 = (size2 + size3) / (f.length);
      if (size2 < 3 || size3 < 3) {
        shapes.remove(i);
        i--;
        spawnRate += 1/((spawnRate+10)*10);
      } else {
        boolean hit = false;
        int bulletnum = 0;
        for (int k = 0; k < bullets.size(); k++) {
          if (shapes.get(i).collision(bullets.get(k))
              || bullets.get(k).collision(shapes.get(i))) {
            hit = true;
            bulletnum = k;
            
          }
        }
        if (shapes.get(i).collision(
            mouseX - shapes.get(i).getCenterX(),
            mouseY - shapes.get(i).getCenterY())
            || bigboom
            || (shapes.get(i).collision(player.GetHitArea()) || player
                .GetHitArea().collision(shapes.get(i))) || hit) {
          if (hit) {
            score += size4;
          }
          if (!bigboom) {
            spawnExplosion((int) shapes.get(i).getCenterX(),
                (int) shapes.get(i).getCenterY(), 50);
          }
          if (!(shapes.get(i).collision(
              mouseX - shapes.get(i).getCenterX(),
              mouseY - shapes.get(i).getCenterY())
              || bigboom || hit)) {
            int damage = (int) ((int) (Math.abs(shapes.get(i)
                .getXVelocity() - player.getXVelocity())
                + Math.abs(shapes.get(i).getYVelocity()
                    - player.getYVelocity()) + 1)
                * size4 + spawnRate * size4);
            player.hit(damage);
            HitNumber h = new HitNumber((int) player.GetHitArea()
                .getCenterX(), (int) player.GetHitArea()
                .getCenterY(), 255, damage);
            hits.add(h);
          }

          Shape s = new Shape(f);
          s.setXVelocity((shapes.get(i).getCenterX() - mouseX) / 10
              * (Math.random() + 0.5));
          s.setYVelocity((shapes.get(i).getCenterY() - mouseY) / 10
              * (Math.random() + 0.5));
          if (!(shapes.get(i).collision(
              mouseX - shapes.get(i).getCenterX(),
              mouseY - shapes.get(i).getCenterY())
              || bigboom || hit)) {
            s.setXVelocity((shapes.get(i).getCenterX() - player
                .GetHitArea().getCenterX())
                / 10
                * (Math.random() + 0.5));
            s.setYVelocity((shapes.get(i).getCenterY() - player
                .GetHitArea().getCenterY())
                / 10
                * (Math.random() + 0.5));
          } else if (bigboom) {
            s.setXVelocity(shapes.get(i).getXVelocity() + 1
                / (shapes.get(i).getCenterX() - mouseX) * 100
                * (Math.random() + 0.5));
            s.setYVelocity(shapes.get(i).getYVelocity() + 1
                / (shapes.get(i).getCenterY() - mouseY) * 100
                * (Math.random() + 0.5));
          } else if (hit) {
            if (freezing == 0) {
              s.setXVelocity((shapes.get(i).getCenterX() - bullets
                  .get(bulletnum).getCenterX())
                  / 10
                  * (Math.random() + 0.5));
              s.setYVelocity((shapes.get(i).getCenterY() - bullets
                  .get(bulletnum).getCenterY())
                  / 10
                  * (Math.random() + 0.5));
            } else {
              s.setXVelocity((shapes.get(i).getCenterX() - bullets
                  .get(bulletnum).getCenterX())
                  / 100
                  * (Math.random() + 0.5) / 10);
              s.setYVelocity((shapes.get(i).getCenterY() - bullets
                  .get(bulletnum).getCenterY())
                  / 100
                  * (Math.random() + 0.5 / 10));
            }
          }
          s.setCenter(shapes.get(i).getCenterX(), shapes.get(i)
              .getCenterY());
          if (!(shapes.get(i).collision(
              mouseX - shapes.get(i).getCenterX(),
              mouseY - shapes.get(i).getCenterY())
              || bigboom || hit)) {
            s.setCenter(shapes.get(i).getCenterX()
                + (shapes.get(i).getCenterX() - player
                    .GetHitArea().getCenterX()) / 2, shapes
                .get(i).getCenterY()
                + (shapes.get(i).getCenterY() - player
                    .GetHitArea().getCenterY()) / 2);
          }
          s.setRotationVelocity(Math.random() / 25 - 0.02);
          shapes.add(i + 1, s);
          Shape s2 = new Shape(f);
          s2.setXVelocity((shapes.get(i).getCenterX() - mouseX) / 10
              * (Math.random() + 0.5));
          s2.setYVelocity((shapes.get(i).getCenterY() - mouseY) / 10
              * (Math.random() + 0.5));
          if (!(shapes.get(i).collision(
              mouseX - shapes.get(i).getCenterX(),
              mouseY - shapes.get(i).getCenterY())
              || bigboom || hit)) {
            s2.setXVelocity((shapes.get(i).getCenterX() - player
                .GetHitArea().getCenterX())
                / 10
                * (Math.random() + 0.5));
            s2.setYVelocity((shapes.get(i).getCenterY() - player
                .GetHitArea().getCenterY())
                / 10
                * (Math.random() + 0.5));
          } else if (bigboom) {
            s2.setXVelocity(shapes.get(i).getXVelocity() + 1
                / (shapes.get(i).getCenterX() - mouseX) * 100
                * (Math.random() + 0.5));
            s2.setYVelocity(shapes.get(i).getYVelocity() + 1
                / (shapes.get(i).getCenterY() - mouseY) * 100
                * (Math.random() + 0.5));
          } else if (hit) {
            if (freezing == 0) {
              s2.setXVelocity((shapes.get(i).getCenterX() - bullets
                  .get(bulletnum).getCenterX())
                  / 10
                  * (Math.random() + 0.5));
              s2.setYVelocity((shapes.get(i).getCenterY() - bullets
                  .get(bulletnum).getCenterY())
                  / 10
                  * (Math.random() + 0.5));
            } else {
              s2.setXVelocity((shapes.get(i).getCenterX() - bullets
                  .get(bulletnum).getCenterX())
                  / 100
                  * (Math.random() + 0.5) / 10);
              s2.setYVelocity((shapes.get(i).getCenterY() - bullets
                  .get(bulletnum).getCenterY())
                  / 100
                  * (Math.random() + 0.5 / 10));
            }
          }

          s2.setCenter(shapes.get(i).getCenterX(), shapes.get(i)
              .getCenterY());
          if (!(shapes.get(i).collision(
              mouseX - shapes.get(i).getCenterX(),
              mouseY - shapes.get(i).getCenterY())
              || bigboom || hit)) {
            s2.setCenter(shapes.get(i).getCenterX()
                + (shapes.get(i).getCenterX() - player
                    .GetHitArea().getCenterX()) / 2, shapes
                .get(i).getCenterY()
                + (shapes.get(i).getCenterY() - player
                    .GetHitArea().getCenterY()) / 2);
          }
          s2.setRotationVelocity(Math.random() / 25 - 0.02);
          shapes.add(i + 2, s2);
          shapes.remove(i);

          if (i > shapes.size() - 3) {
            bigboom = false;
          }
          i++;
          if (hit) {
            if (piercing <= 0) {
              bullets.remove(bulletnum);
            }
          }
        } else {
          double[][] c = shapes.get(i).getCoords();
          double[][] d = new double[c.length][c[0].length];
          for (int j = 0; j < d.length; j++) {
            d[j][0] = c[j][0] + shapes.get(i).getCenterX();
            d[j][1] = c[j][1] + shapes.get(i).getCenterY();
          }
          this.stroke(200, 200, 255, 255);
          for (int j = 0; j < d.length - 1; j++) {
            line((float) d[j][0], (float) d[j][1],
                (float) d[j + 1][0], (float) d[j + 1][1]);
          }
          line((float) d[d.length - 1][0],
              (float) d[d.length - 1][1], (float) d[0][0],
              (float) d[0][1]);
          shapes.get(i).rotate();
          shapes.get(i).move();
          this.fill(255, 0, 0, 255);
          if (shapes.get(i).getCenterX() > width + 100) {
            shapes.get(i)
                .setCenter(-74, shapes.get(i).getCenterY());
          }
          if (shapes.get(i).getCenterY() > height + 100) {
            shapes.get(i)
                .setCenter(shapes.get(i).getCenterX(), -74);
          }
          if (shapes.get(i).getCenterX() < -75) {
            shapes.get(i).setCenter(width + 100,
                shapes.get(i).getCenterY());
          }
          if (shapes.get(i).getCenterY() < -75) {
            shapes.get(i).setCenter(shapes.get(i).getCenterX(),
                height + 100);
          }
        }
      }
    }
    // *************************************************************************
    for (int i = 0; i < enemybullets.size(); i++) {
      int size2 = 0;
      int size3 = 0;
      double[][] e = enemybullets.get(i).getCoords();
      int[][] f = new int[e.length][e[0].length];
      for (int j = 0; j < f.length; j++) {
        f[j][0] = (int) e[j][0] / 4 * 3;
        f[j][1] = (int) e[j][1] / 4 * 3;
        size2 += Math.abs(e[j][0]);
        size3 += Math.abs(e[j][1]);
      }
      int size4 = (size2 + size3) / (f.length);
      if (size2 < 3 || size3 < 3) {
        enemybullets.remove(i);
        i--;
      } else {
        boolean hit = false;
        int bulletnum = 0;
        for (int k = 0; k < bullets.size(); k++) {
          if (enemybullets.get(i).collision(bullets.get(k))
              || bullets.get(k).collision(enemybullets.get(i))) {
            hit = true;
            bulletnum = k;
          }
        }
        if (enemybullets.get(i).collision(
            mouseX - enemybullets.get(i).getCenterX(),
            mouseY - enemybullets.get(i).getCenterY())
            || bigboom
            || (enemybullets.get(i).collision(player.GetHitArea()) || player
                .GetHitArea().collision(enemybullets.get(i)))
            || hit) {
          if (hit) {
            score += size4;
          }
          if (!bigboom) {
            spawnExplosion((int) enemybullets.get(i).getCenterX(),
                (int) enemybullets.get(i).getCenterY(), 50);
          }
          if (!(enemybullets.get(i).collision(
              mouseX - enemybullets.get(i).getCenterX(),
              mouseY - enemybullets.get(i).getCenterY())
              || bigboom || hit)) {
            int damage = (int) ((int) (Math.abs(enemybullets.get(i)
                .getXVelocity() - player.getXVelocity())
                + Math.abs(enemybullets.get(i).getYVelocity()
                    - player.getYVelocity()) + 1)* size4 + spawnRate * (int) (Math.random()*100));
            if(enemybullets.get(i).getXVelocity() == 0 && enemybullets.get(i).getYVelocity() == 0){
              damage = (int) ((int) (Math.random()*500) + 200 + spawnRate * (int) (Math.random()*100));
            }
            player.hit(damage);
            HitNumber h = new HitNumber((int) player.GetHitArea()
                .getCenterX(), (int) player.GetHitArea()
                .getCenterY(), 255, damage);
            hits.add(h);
          }

          enemybullets.remove(i);
          i--;
          if (hit) {
            if (piercing <= 0) {
              bullets.remove(bulletnum);
            }
          }
        } else {
          double[][] c = enemybullets.get(i).getCoords();
          double[][] d = new double[c.length][c[0].length];
          for (int j = 0; j < d.length; j++) {
            d[j][0] = c[j][0] + enemybullets.get(i).getCenterX();
            d[j][1] = c[j][1] + enemybullets.get(i).getCenterY();
          }
          this.stroke(255, 128, 0, 255);
          for (int j = 0; j < d.length - 1; j++) {
            line((float) d[j][0], (float) d[j][1],
                (float) d[j + 1][0], (float) d[j + 1][1]);
          }
          line((float) d[d.length - 1][0],
              (float) d[d.length - 1][1], (float) d[0][0],
              (float) d[0][1]);
          enemybullets.get(i).rotate();
          enemybullets.get(i).move();
          this.fill(255, 0, 0, 255);
          if (enemybullets.get(i).getCenterX() < -5
              || enemybullets.get(i).getCenterX() > width
              || enemybullets.get(i).getCenterY() < -5
              || enemybullets.get(i).getCenterY() > height) {
            enemybullets.remove(i);
            i--;
          }
        }
      }
    }
    // *************************************************************************
    for (int i = 0; i < enemys.size(); i++) {
      boolean hit = false;
      int bulletnum = 0;
      for (int k = 0; k < bullets.size(); k++) {
        if (enemys.get(i).collision(bullets.get(k))
            || bullets.get(k).collision(enemys.get(i))) {
          hit = true;
          bulletnum = k;
        }
      }
      if (enemys.get(i).getClass() == Suicider.class
          && (enemys.get(i).collision(player.GetHitArea()) || player
              .GetHitArea().collision(enemys.get(i)))) {
        spawnExplosion((int) enemys.get(i).getCenterX(), (int) enemys
            .get(i).getCenterY(), 70);
        player.hit(500);
        HitNumber h = new HitNumber((int) player.GetHitArea()
            .getCenterX(), (int) player.GetHitArea().getCenterY(),
            255, 500);
        hits.add(h);
        enemys.remove(i);
        i--;
      } else if (hit) {
        spawnExplosion((int) bullets.get(bulletnum).getCenterX(),
            (int) bullets.get(bulletnum).getCenterY(), 50);
        enemys.get(i).hit(5);
        bullets.remove(bulletnum);
      } else {
        double[][] c = enemys.get(i).getCoords();
        double[][] d = new double[c.length][c[0].length];
        for (int j = 0; j < d.length; j++) {
          d[j][0] = c[j][0] + enemys.get(i).getCenterX();
          d[j][1] = c[j][1] + enemys.get(i).getCenterY();
        }
        this.stroke(200, 200, 255, 255);
        for (int j = 0; j < d.length - 1; j++) {
          line((float) d[j][0], (float) d[j][1], (float) d[j + 1][0],
              (float) d[j + 1][1]);
        }
        line((float) d[d.length - 1][0], (float) d[d.length - 1][1],
            (float) d[0][0], (float) d[0][1]);
        enemys.get(i).move(player, enemybullets, enemys);
        this.rect((int) enemys.get(i).getCenterX() - 20, (int) enemys
            .get(i).getCenterY() - 30, 40, 5);
        this.fill(0, 255, 0, 255);
        this.rect((int) enemys.get(i).getCenterX() - 20, (int) enemys
            .get(i).getCenterY() - 30, (int) (40 * enemys.get(i)
            .getHealth() / (double) enemys.get(i).getMaxHealth()),
            5);
        this.fill(255, 0, 0, 255);
        if (enemys.get(i).getCenterX() > width + 100) {
          enemys.get(i).setCenter(-74, enemys.get(i).getCenterY());
        }
        if (enemys.get(i).getCenterY() > height + 100) {
          enemys.get(i).setCenter(enemys.get(i).getCenterX(), -74);
        }
        if (enemys.get(i).getCenterX() < -75) {
          enemys.get(i).setCenter(width + 100,
              enemys.get(i).getCenterY());
        }
        if (enemys.get(i).getCenterY() < -75) {
          enemys.get(i).setCenter(enemys.get(i).getCenterX(),
              height + 100);
        }
        if (enemys.get(i).getHealth() < 0) {
          spawnExplosion((int) enemys.get(i).getCenterX(),
              (int) enemys.get(i).getCenterY(), 70);
          if(enemys.get(i).getClass() != Suicider.class){
            spawnRate += 3/((spawnRate+10));
          }
          if(enemys.get(i).getClass() == Hanger.class){
            score += 5000 * spawnRate;
          }
          enemys.remove(i);
          
          i--;
          score += 100 * spawnRate;
          
        }
      }
    }

    // *************************************************************************
    for (int i = 0; i < explosions.size(); i++) {
      this.fill(explosions.get(i).getB(), explosions.get(i).getC(),
          explosions.get(i).getD(), (int) (((double) explosions
              .get(i).getTime())
              / ((double) explosions.get(i).getSize()) * 255));
      this.stroke(explosions.get(i).getB(), explosions.get(i).getC(),
          explosions.get(i).getD(), explosions.get(i).getTime());
      this.ellipse(explosions.get(i).getX(), explosions.get(i).getY(),
          explosions.get(i).getSize() - explosions.get(i).getTime(),
          explosions.get(i).getSize() - explosions.get(i).getTime());
      if (explosions.get(i).getRate() == 0) {
        explosions.get(i).incrementTime(3);
      } else {
        explosions.get(i).incrementTimeAuto();
      }
      if (explosions.get(i).getTime() < 0) {
        explosions.remove(i);
        i--;
      }

    }
    // *************************************************************************
    for (int i = 0; i < bullets.size(); i++) {
      double[][] c = bullets.get(i).getCoords();
      double[][] d = new double[c.length][c[0].length];
      for (int j = 0; j < d.length; j++) {
        d[j][0] = c[j][0] + bullets.get(i).getCenterX();
        d[j][1] = c[j][1] + bullets.get(i).getCenterY();
      }
      if (freezing > 0) {
        this.stroke(0, 0, 200, 255);
      } else {
        this.stroke(0, 200, 0, 255);
      }
      for (int j = 0; j < d.length - 1; j++) {
        line((float) d[j][0], (float) d[j][1], (float) d[j + 1][0],
            (float) d[j + 1][1]);
      }
      line((float) d[d.length - 1][0], (float) d[d.length - 1][1],
          (float) d[0][0], (float) d[0][1]);
      bullets.get(i).rotate();
      bullets.get(i).move();
      if (bullets.get(i).getCenterX() < -5
          || bullets.get(i).getCenterX() > width
          || bullets.get(i).getCenterY() < -5
          || bullets.get(i).getCenterY() > height) {
        bullets.remove(i);
        i--;
      }
    }
    // *************************************************************************
    for (int i = 0; i < powers.size(); i++) {
      if ((powers.get(i).collision(player.GetHitArea()) || player
          .GetHitArea().collision(powers.get(i)))) {
        if (powers.get(i).getType() == 0) {
          shots += 1;
        } else if (powers.get(i).getType() == 1) {
          player.hit(-500);
        } else if (powers.get(i).getType() == 2) {
          piercing = 1000;
        } else if (powers.get(i).getType() == 3) {
          bombs += 1;
        } else if (powers.get(i).getType() == 5) {
          armor += 1;
        } else {
          freezing = 1000;
        }
        powers.remove(i);
        i--;
      } else {
        double[][] c = powers.get(i).getCoords();
        double[][] d = new double[c.length][c[0].length];
        for (int j = 0; j < d.length; j++) {
          d[j][0] = c[j][0] + powers.get(i).getCenterX();
          d[j][1] = c[j][1] + powers.get(i).getCenterY();
        }
        this.stroke(0, 200, 200, 255);
        for (int j = 0; j < d.length - 1; j++) {
          line((float) d[j][0], (float) d[j][1], (float) d[j + 1][0],
              (float) d[j + 1][1]);
        }
        line((float) d[d.length - 1][0], (float) d[d.length - 1][1],
            (float) d[0][0], (float) d[0][1]);
        powers.get(i).rotate();
        powers.get(i).move();
        if (powers.get(i).getCenterX() < -150
            || powers.get(i).getCenterX() > width + 100
            || powers.get(i).getCenterY() < -150
            || powers.get(i).getCenterY() > height + 100) {
          powers.remove(i);
          i--;
        }
      }

    }

    // ***************************************************************
    double[][] c = player.GetHitArea().getCoords();
    double[][] d = new double[c.length][c[0].length];
    for (int j = 0; j < d.length; j++) {
      d[j][0] = c[j][0] + player.GetHitArea().getCenterX();
      d[j][1] = c[j][1] + player.GetHitArea().getCenterY();
    }
    this.stroke(255, 0, 0, 255);
    for (int j = 0; j < d.length - 1; j++) {
      line((float) d[j][0], (float) d[j][1], (float) d[j + 1][0],
          (float) d[j + 1][1]);
    }
    line((float) d[d.length - 1][0], (float) d[d.length - 1][1],
        (float) d[0][0], (float) d[0][1]);
    if (left) {
      player.turn(-0.09);
    }
    if (right) {
      player.turn(0.09);
    }
    if (up) {
      player.accelerate();
    }
    if (down) {
      player.reverse();
    }
    if (player.x > width + 30) {
      player.x = -30;
    }
    if (player.x < -30) {
      player.x = width + 30;
    }
    if (player.y > height + 30) {
      player.y = -30;
    }
    if (player.y < -30) {
      player.y = height + 30;
    }
    player.motion();

    // ***************************************************************

    for (int i = 0; i < hits.size(); i++) {
      this.fill(255, 255, 0);
      this.text(hits.get(i).getDamage(), hits.get(i).getX(), hits.get(i)
          .getY());
      hits.get(i).incrementTimeAuto();
      if (hits.get(i).getTime() < 0) {
        hits.remove(i);
        i--;
      }

    }

    // ***************************************************************
     

    if (piercing > 0) {
      piercing--;
      this.fill(255, 0, 255, 255);
      this.text("Piercing Time Left: " + piercing, width / 2 - 100,
          height - 40);
    }

    if (freezing > 0) {
      freezing--;
      this.fill(0, 0, 255, 255);
      int shift = 0;
      if (piercing > 0) {
        shift += 20;
      }
      this.text("Freezing Time Left: " + freezing, width / 2 - 100,
          height - 40 + shift);
    }

    if (player.getHealth() > player.maxHealth) {
      player.hit(1);
    }

    if (finalScore == 0 && player.getHealth() < 0) {
      finalScore = (int) score;
    }

    this.fill(255, 255, 255, 255);
    this.text(
        "Explosions: " + explosions.size() + " Framerate: "
            + Math.round(this.frameRate), width / 2 - 100,
        height - 120);
    this.text("Shapes: " + shapes.size() + " Enemies: " + enemys.size(),
        width / 2 - 100, height - 100);
    if (player.getHealth() > 0) {
      this.text("Health: " + (int) player.getHealth() + "/"
          + (int) player.maxHealth, width / 2 - 100, height - 80);
    } else {
      this.text("Health: " + 0 + "/" + (int) player.maxHealth,
          width / 2 - 100, height - 80);
    }
    if (finalScore != 0) {
      this.text("Final Score: " + finalScore, width / 2 - 100,
          height - 60);
    } else {
      this.text("Score: " + (int) score, width / 2 - 100, height - 60);
    }
    this.text("Bombs: " + bombs, width - 100, 60);
    this.text("Level: " + (int)Math.round(spawnRate), width - 100, 80);
    this.fill(0, 255, 0, 255);
  }

  public void spawnExplosion(int x, int y, int size) {
    spawnExplosion(x, y, size, 0);
  }

  public void spawnExplosion(int x, int y, int size, int rate) {
    explode = size;
    loc1 = x;
    loc2 = y;
    b = (int) Math.round(Math.random() * 256);
    c = (int) Math.round(Math.random() * 256);
    d = (int) Math.round(Math.random() * 256);
    Explosion e = new Explosion(loc1, loc2, explode, b, c, d, rate);
    explosions.add(e);
  }

  public void keyPressed() {
   /* if (key == 't') {
      for (int i = 0; i < shapes.size(); i++) {
        shapes.get(i).setXVelocity(0);
        shapes.get(i).setYVelocity(0);
      }
    }*/
    if (key == ' ') {
      space = true;
    }
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
   /* if (key == 'd') {
      spawnExplosion(mouseX, mouseY, 500, 10);
      bigboom = true;
    }*/

  }

  public void keyReleased() {

    if (this.keyCode == UP) {
      up = false;
    }
    if (this.keyCode == DOWN) {
      down = false;
    }
    if (this.keyCode == LEFT) {
      left = false;
    }
    if (this.keyCode == RIGHT) {
      right = false;
    }
    if (key == ' ') {
      space = false;
      for (int i = 0; i < shots; i++) {
        int[][] coords = box;
        Shape s = new Shape(coords);
        s.setXVelocity(Math.cos(player.getDirection() + Math.PI / 60
            * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
        s.setYVelocity(Math.sin(player.getDirection() + Math.PI / 60
            * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
        s.setRotationVelocity(0.08);
        s.setCenter(
            player.GetHitArea().getCenterX()
                + Math.cos(player.getDirection()) * 50,
            player.GetHitArea().getCenterY()
                + Math.sin(player.getDirection()) * 50);
        bullets.add(s);
      }
    }
    if (key == 'b') {
      if (bombs > 0) {
        for (int i = 0; i < 120; i++) {
          int[][] coords = box;
          Shape s = new Shape(coords);
          s.setXVelocity(Math.cos(player.getDirection() + Math.PI
              / 60 * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
          s.setYVelocity(Math.sin(player.getDirection() + Math.PI
              / 60 * i - Math.PI / 60 * ((double) shots - 1) / 2) * 8);
          s.setRotationVelocity(0.08);
          s.setCenter(
              player.GetHitArea().getCenterX()
                  + Math.cos(player.getDirection()) * 50,
              player.GetHitArea().getCenterY()
                  + Math.sin(player.getDirection()) * 50);
          bullets.add(s);
        }
        bombs -= 1;
      }
    }
  }
  
public class EnemyShape extends Shape {
  int health;
  int maxHealth;
  double direction = Math.PI / 2;
  double angle;
  int delay = 10;

  public EnemyShape(int[][] xyCoords, int h) {
    super(xyCoords);
    health = h;
    maxHealth = h;
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s, ArrayList<EnemyShape> a) {
    double xDistance = this.getCenterX() - player.x;
    double yDistance = this.getCenterY() - player.y;
    angle = Math.atan2(yDistance, xDistance);
    if (angle < 0) {
      angle = angle + 2 * Math.PI;
    }
    if (direction > angle) {
      
      double angleRot = -Math.min((direction - angle) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    } else {
      double angleRot = Math.min((angle - direction) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    }

    if (direction > 2 * Math.PI) {
      rotate(-direction);
      direction = 0;
    }
    if (direction < 0) {
      rotate(2 * Math.PI - direction);
      direction = 2 * Math.PI;
    }
    delay--;
    if (delay < 0){
    int[][] coords = ProcessingGame.box;
    Shape s1 = new Shape(coords);
    s1.setXVelocity(-Math.cos(angle)*5);
    s1.setYVelocity(-Math.sin(angle)*5);
    s1.setCenter(getCenterX()- Math.cos(direction) * 20, getCenterY()- Math.sin(direction) * 20);
    s1.setRotationVelocity(Math.random() / 25 - 0.02);
    s.add(s1);
    delay = 10;
    } 
    incrementX();
    incrementY();
  }

  public void hit(int damage) {
    health -= damage;
  }
  public int getHealth(){
    return health;
  }
  public int getMaxHealth(){
    return maxHealth;
  }
}
public class Spinner extends EnemyShape {
  int health;
  int maxHealth;
  int delay = 10;

  public Spinner(int[][] xyCoords, int h) {
    super(xyCoords,h);
    health = h;
    maxHealth = h;
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s, ArrayList<EnemyShape> a) {
    rotationVelocity = (100-delay) * 0.01;
    delay--;
    if (delay < 0){
    int[][] coords = ProcessingGame.box;
    for (int i = 0; i < 120; i++) {
      Shape s1 = new Shape(coords);
      s1.setXVelocity(Math.cos(player.getDirection() + Math.PI
          / 60 * i - Math.PI / 60 * ((double) 120 - 1) / 2) * 8);
      s1.setYVelocity(Math.sin(player.getDirection() + Math.PI
          / 60 * i - Math.PI / 60 * ((double) 120 - 1) / 2) * 8);
      s1.setRotationVelocity(0.08);
      s1.setCenter(
          getCenterX()
              - Math.cos(Math.PI
                  / 60 * i - Math.PI / 60 * ((double) 120 - 1) / 2) * 20,
          getCenterY()
              - Math.sin(Math.PI
                  / 60 * i - Math.PI / 60 * ((double) 120 - 1) / 2) * 20);
      s1.setRotationVelocity(Math.random() / 25 - 0.02);
      s.add(s1);
    }
    delay = 100;
    } 
    incrementX();
    incrementY();
    rotate();
  }

  public void hit(int damage) {
    health -= damage;
  }
  public int getHealth(){
    return health;
  }
  public int getMaxHealth(){
    return maxHealth;
  }
}
public class Suicider extends EnemyShape {
  int health;
  int maxHealth;
  double direction = Math.PI / 2;
  double angle;

  public Suicider(int[][] xyCoords, int h) {
    super(xyCoords,h);
    health = h;
    maxHealth = h;
    
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s, ArrayList<EnemyShape> a) {
    rotationVelocity = 5;
    double xDistance = this.getCenterX() - player.x;
    double yDistance = this.getCenterY() - player.y;
    angle = Math.atan2(yDistance, xDistance);
    if (angle < 0) {
      angle = angle + 2 * Math.PI;
    }
    this.setXVelocity(this.getXVelocity()-Math.cos(angle)*0.1);
    this.setYVelocity(this.getYVelocity()-Math.sin(angle)*0.1);
    incrementX();
    incrementY();
    rotate();
  }

  public void hit(int damage) {
    health -= damage;
  }
  public int getHealth(){
    return health;
  }
  public int getMaxHealth(){
    return maxHealth;
  }
}
public class Shape {
  private double myXVelocity;
  private double myYVelocity;
  private double[][] myCoords;
  private double centerX = 0;
  private double centerY = 0;
  protected double rotationVelocity = 0;
  private double direction = 0;

  public Shape(int[][] xyCoords) {
    myCoords = new double[xyCoords.length][2];
    for (int i = 0; i < xyCoords.length; i++) {
      for (int j = 0; j < xyCoords[i].length; j++) {
        myCoords[i][j] = xyCoords[i][j];
      }
    }
  }

  public boolean collision(double x, double y) {
    int vectorsHitBefore = 0;
    int vectorsHitAfter = 0;
    for (int i = 0; i < myCoords.length - 1; i++) {
      boolean vertical = false;
      boolean horizontal = false;
      double slope = (myCoords[i + 1][1] - myCoords[i][1])
          / (myCoords[i + 1][0] - myCoords[i][0]);
      if (slope == 1.0 / 0) {
        vertical = true;
      }
      double slopeInv = 1 / slope;
      if (slope == 0) {
        horizontal = true;
      }

      if (!(vertical || horizontal)) {

        double xHit = slopeInv * (y - myCoords[i + 1][1])
            + myCoords[i + 1][0];
        if (myCoords[i + 1][0] > myCoords[i][0]) {
          if (xHit > myCoords[i][0] && xHit < myCoords[i + 1][0]) {
            if (x > xHit) {
              vectorsHitBefore += 1;
            } else {
              vectorsHitAfter += 1;
            }
          }
        } else {
          if (xHit < myCoords[i][0] && xHit > myCoords[i + 1][0]) {
            if (x > xHit) {
              vectorsHitBefore += 1;
            } else {
              vectorsHitAfter += 1;
            }
          }
        }
      } else if (vertical) {
        if (myCoords[i + 1][1] > myCoords[i][1]) {
          if (y > myCoords[i][1] && y < myCoords[i + 1][1]) {
            if (x > myCoords[i][0]) {
              vectorsHitBefore += 1;
            } else {
              vectorsHitAfter += 1;
            }
          }
        } else {
          if (y < myCoords[i][1] && y > myCoords[i + 1][1]) {
            if (x > myCoords[i][0]) {
              vectorsHitBefore += 1;
            } else {
              vectorsHitAfter += 1;
            }
          }
        }
      }
    }
    boolean vertical = false;
    boolean horizontal = false;
    double slope = (myCoords[myCoords.length - 1][1] - myCoords[0][1])
        / (myCoords[myCoords.length - 1][0] - myCoords[0][0]);
    if (slope == 1.0 / 0) {
      vertical = true;
    }
    double slopeInv = 1 / slope;
    if (slope == 0) {
      horizontal = true;
    }

    if (!(vertical || horizontal)) {
      double xHit = slopeInv * (y - myCoords[myCoords.length - 1][1])
          + myCoords[myCoords.length - 1][0];
      if (myCoords[myCoords.length - 1][0] > myCoords[0][0]) {
        if (xHit > myCoords[0][0]
            && xHit < myCoords[myCoords.length - 1][0]) {
          if (x > xHit) {
            vectorsHitBefore += 1;
          } else {
            vectorsHitAfter += 1;
          }
        }
      } else {
        if (xHit < myCoords[0][0]
            && xHit > myCoords[myCoords.length - 1][0]) {
          if (x > xHit) {
            vectorsHitBefore += 1;
          } else {
            vectorsHitAfter += 1;
          }
        }
      }
    } else if (vertical) {
      if (myCoords[myCoords.length - 1][1] > myCoords[0][1]) {
        if (y > myCoords[0][1] && y < myCoords[myCoords.length - 1][1]) {
          if (x > myCoords[0][0]) {
            vectorsHitBefore += 1;
          } else {
            vectorsHitAfter += 1;
          }
        }
      } else {
        if (y < myCoords[0][1] && y > myCoords[myCoords.length - 1][1]) {
          if (x > myCoords[0][0]) {
            vectorsHitBefore += 1;
          } else {
            vectorsHitAfter += 1;
          }
        }
      }
    }
    if (vectorsHitBefore % 2 != 0 && vectorsHitAfter % 2 != 0) {
      return true;
    } else {
      return false;
    }
  }

  public boolean collision(Shape other) {
    for (int i = 0; i < myCoords.length; i++) {
      if (other.collision(myCoords[i][0] + centerX - other.centerX,
          myCoords[i][1] + centerY - other.centerY)) {
        return true;
      }
    }
    return false;
  }

  public void rotate(double angleChange) {
    for (int i = 0; i < myCoords.length; i++) {
      double length = Math.sqrt(Math.pow(myCoords[i][0], 2)
          + Math.pow(myCoords[i][1], 2));
      double angle = 0;
      if (myCoords[i][0] > 0) {
        angle = Math.atan((myCoords[i][1]) / (myCoords[i][0]));
      } else if (myCoords[i][0] == 0) {
        if (myCoords[i][1] > 0) {
          angle = Math.PI / 2;
        } else {
          angle = 3 * Math.PI / 2;
        }
      } else {
        angle = Math.atan((myCoords[i][1]) / (myCoords[i][0]))
            + (Math.PI);
      }
      angle = angle + angleChange;
      myCoords[i][0] = Math.cos(angle) * length;
      myCoords[i][1] = Math.sin(angle) * length;
    }
    direction += angleChange;
    if (direction < 0) {
      direction += 2 * Math.PI;
    }
    if (direction > 2 * Math.PI) {
      direction -= 2 * Math.PI;
    }
  }

  public void setXVelocity(double speed) {
    myXVelocity = speed;
  }

  public void setYVelocity(double speed) {
    myYVelocity = speed;
  }

  public double getXVelocity() {
    return myXVelocity;
  }

  public double getYVelocity() {
    return myYVelocity;
  }
  
  public double getRotationVelocity() {
    return rotationVelocity;
  }
  public void setRotationVelocity(double r) {
    rotationVelocity = r;
  }
  public void rotate(){
    rotate(rotationVelocity);
  }

  public void move(){
    incrementX();
    incrementY();
  }
  
  public void incrementX() {
    centerX = centerX + myXVelocity;
  }

  public void incrementY() {
    centerY = centerY + myYVelocity;
  }

  public double[][] getCoords() {
    return myCoords;
  }

  public void setCenter(double c, double c2) {
    centerX = c;
    centerY = c2;
  }

  public double getCenterX() {
    return centerX;
  }

  public double getCenterY() {
    return centerY;
  }

  public double getDirection() {
    return direction;
  }
}
public class Explosion {
  int x;
  int y;
  int time;
  int b;
  int c;
  int d;
  int size;
  int explosionRate;
  public Explosion(int x,int y,int t, int b, int c, int d){
    this.x = x;
    this.y = y;
    time = t;
    size = t;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  public Explosion(int x,int y,int t, int b, int c, int d, int e){
    this(x,y,t, b, c, d);
    explosionRate = e;
  }
  public int getX() {
    return x;
  }
  public int getB() {
    return b;
  }
  public int getC() {
    return c;
  }
  public int getY() {
    return y;
  }
  public int getD() {
    return d;
  }
  public int getTime() {
    return time;
  }
  public int getRate(){
    return explosionRate;
  }
  public void incrementTime(int dt){
    explosionRate = dt;
    incrementTimeAuto();
  }
  public void incrementTimeAuto(){
    time = time - explosionRate;
  }
  public int getSize() {
    // TODO Auto-generated method stub
    return size;
  }
}
public class Hanger extends EnemyShape {
  int health;
  int maxHealth;
  double direction = Math.PI / 2;
  double angle;
  int delay = 10;

  public Hanger(int[][] xyCoords, int h) {
    super(xyCoords,h);
    health = h;
    maxHealth = h;
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s,
      ArrayList<EnemyShape> a) {
    double xDistance = this.getCenterX() - player.x;
    double yDistance = this.getCenterY() - player.y;
    angle = Math.atan2(yDistance, xDistance);
    if (angle < 0) {
      angle = angle + 2 * Math.PI;
    }
    if (direction > angle) {

      double angleRot = -Math.min((direction - angle) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    } else {
      double angleRot = Math.min((angle - direction) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    }

    if (direction > 2 * Math.PI) {
      rotate(-direction);
      direction = 0;
    }
    if (direction < 0) {
      rotate(2 * Math.PI - direction);
      direction = 2 * Math.PI;
    }
    delay--;
    if (delay < 0) {
      int[][] coords = ProcessingGame.miniCrown;
      EnemyShape s1;
      if (Math.random() * 10 > 8.5) {
        coords = ProcessingGame.spinner;
        s1 = new Spinner(coords, 150);
      } else if (Math.random() * 10 > 7) {
        coords = ProcessingGame.suiShape;
        s1 = new Suicider(coords, 20);
      } else if (Math.random() * 10 > 5.5) {
        coords = ProcessingGame.hanger;
        s1 = new HomingLauncher(coords, 150);
      } else if (Math.random() * 10 > 3.5) {
        coords = ProcessingGame.mineLayer;
        s1 = new MineLayer(coords, 200);
      }else {
        s1 = new EnemyShape(coords, 50);
      }
      s1.setXVelocity(-Math.cos(angle) * 5);
      s1.setYVelocity(-Math.sin(angle) * 5);
      s1.setCenter(this.getCenterX(), getCenterY());
      s1.setRotationVelocity(5);
      a.add(s1);
      delay = 100;
    }
    incrementX();
    incrementY();
  }

  public void hit(int damage) {
    health -= damage;
  }

  public int getHealth() {
    return health;
  }

  public int getMaxHealth() {
    return maxHealth;
  }
}
public class HitNumber {
  int x;
  int y;
  int time;
  int number;
  public HitNumber(int x,int y,int t, int n){
    this.x = x;
    this.y = y;
    time = t;
    number = n;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getTime() {
    return time;
  }
  public void incrementTimeAuto(){
    time = time - 5;
    y -= 1;
  }
  public int getDamage(){
    return number;
  }
}
public class HomingLauncher extends EnemyShape {
  int health;
  int maxHealth;
  double direction = Math.PI / 2;
  double angle;
  int delay = 10;

  public HomingLauncher(int[][] xyCoords, int h) {
    super(xyCoords,h);
    health = h;
    maxHealth = h;
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s,
      ArrayList<EnemyShape> a) {
    double xDistance = this.getCenterX() - player.x;
    double yDistance = this.getCenterY() - player.y;
    angle = Math.atan2(yDistance, xDistance);
    if (angle < 0) {
      angle = angle + 2 * Math.PI;
    }
    if (direction > angle) {

      double angleRot = -Math.min((direction - angle) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    } else {
      double angleRot = Math.min((angle - direction) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    }

    if (direction > 2 * Math.PI) {
      rotate(-direction);
      direction = 0;
    }
    if (direction < 0) {
      rotate(2 * Math.PI - direction);
      direction = 2 * Math.PI;
    }
    delay--;
    if (delay < 0) {
      int[][] coords = ProcessingGame.suiShape;
      EnemyShape s1 = new Suicider(coords, 20);
      s1.setXVelocity(-Math.cos(angle) * 5);
      s1.setYVelocity(-Math.sin(angle) * 5);
      s1.setCenter(this.getCenterX(), getCenterY());
      s1.setRotationVelocity(5);
      a.add(s1);
      delay = 100;
    }
    incrementX();
    incrementY();
  }

  public void hit(int damage) {
    health -= damage;
  }

  public int getHealth() {
    return health;
  }

  public int getMaxHealth() {
    return maxHealth;
  }
}
public class MineLayer extends EnemyShape {
  int health;
  int maxHealth;
  int delay = 10;

  public MineLayer(int[][] xyCoords, int h) {
    super(xyCoords,h);
    health = h;
    maxHealth = h;
    // TODO Auto-generated constructor stub
  }

  public void move(Player player, ArrayList<Shape> s, ArrayList<EnemyShape> a) {
    double xDistance = getXVelocity();
    double yDistance = getYVelocity();
    angle = Math.atan2(yDistance, xDistance);
    if (angle < 0) {
      angle = angle + 2 * Math.PI;
    }
    if (direction > angle) {
      
      double angleRot = -Math.min((direction - angle) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    } else {
      double angleRot = Math.min((angle - direction) / 10, 100);
      direction += angleRot;
      rotate(angleRot);
    }

    if (direction > 2 * Math.PI) {
      rotate(-direction);
      direction = 0;
    }
    if (direction < 0) {
      rotate(2 * Math.PI - direction);
      direction = 2 * Math.PI;
    }
    delay--;
    if (delay < 0){
      int[][] coords = ProcessingGame.mine;
      Shape s1 = new Shape(coords);
      s1.setXVelocity(0);
      s1.setYVelocity(0);
      s1.setCenter(getCenterX(), getCenterY());
      s1.setRotationVelocity(0);
      s.add(s1);
    delay = 100;
    } 
    incrementX();
    incrementY();
  }

  public void hit(int damage) {
    health -= damage;
  }
  public int getHealth(){
    return health;
  }
  public int getMaxHealth(){
    return maxHealth;
  }
}
public class Player {
  Shape s;
  double x;
  double y;
  double xVelocity = 0;
  double yVelocity = 0;
  double xAcc = 0;
  double yAcc = 0;
  double accRate = 5;
  double direction = 3*Math.PI/2;
  double health = 60000;
  double maxHealth = 60000;
  public Player(Shape shape, int x, int y){
    s = shape;
    this.x = x;
    this.y= y;
  }
  public Shape GetHitArea(){
    return s;
  }
  public void setCenter(int i, int j) {
    // TODO Auto-generated method stub
    
  }
  public void turn(double angle){
    direction += angle;
    s.rotate(angle);
  }
  public double getDirection(){
    return direction;
  }
  public void accelerate() {
    xAcc = Math.cos(direction)/6;
    yAcc = Math.sin(direction)/6;
    xVelocity = xVelocity + xAcc;
    yVelocity = yVelocity + yAcc;
  }
  public void reverse() {
    xAcc = -Math.cos(direction)/18;
    yAcc = -Math.sin(direction)/18;
    xVelocity = xVelocity + xAcc;
    yVelocity = yVelocity + yAcc;
  }
  public void motion(){
    x = x + xVelocity;
    y = y + yVelocity;
    s.setCenter(x, y);
    xVelocity = xVelocity/30*29;
    yVelocity = yVelocity/30*29;
  }
  public void hit(int damage){
    health -= damage;
  }
  public double getHealth(){
    return health;
  }
  public double getXVelocity(){
    return xVelocity;
  }
  public double getYVelocity(){
    return yVelocity;
  }
}
public class PowerUp extends Shape{
  int type;
  public PowerUp(int[][] xyCoords, int t) {
    super(xyCoords);
    // TODO Auto-generated constructor stub
    type = t;
  }
  public int getType(){
    return type;
  }
}

