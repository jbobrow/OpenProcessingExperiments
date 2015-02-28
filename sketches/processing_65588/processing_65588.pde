
class enemy {

  float x;
  int y;
  int n;
  int r;
  int on;
  int bloodTime;
  int health;
  float speed;
  int count;
  int direction;
  int disp;

  int endTimer;

  boolean dead;

  enemy(float temx, int temy, int temn) {
    x = temx;
    y = temy;
    n = temn;
    bloodTime = 0;
    health = round(random(1, 5));
    r = 20;
    speed = random(2, 7);
    count = 0;
    direction = round(random(1, 4));
    on = 0;
    disp = round(random(1, 5));
    endTimer = 0;
    dead = false;
  }

  void display() {

    if (health==0) {
      if (bloodTime <75) {
        bloodTime++;
      }
      imageMode(CENTER);
      if (on == 1) {
        if (bloodTime <= 30) {
          image(blood, x, y);
        }
        if (bloodTime > 30 && bloodTime <= 45) {
          image(blood2, x, y);
        }
        if (bloodTime > 45 && bloodTime <= 60) {
          image(blood3, x, y);
        }
        if (bloodTime > 60 && bloodTime <= 75) {
          image(blood4, x, y);
        }
      }
    }
    imageMode(CENTER);
    if (health >= 0) {
      if (on == 1) {
        if (disp == 1) {
          image(enemy1, x, y);
        }
        if (disp == 2) {
          image(enemy2, x, y);
        }
        if (disp == 3) {
          image(enemy3, x, y);
        }
        if (disp == 4) {
          image(enemy4, x, y);
        }
        if (disp == 5) {
          image(enemy5, x, y);
        }
      }
    }
    if (health < 0) {
      if (room<5) {
        image(blood5, x, y);
      }
    }
  }

  void stomps(player p) {
    if (deathCount >= 18) {
      endTimer++;
      if (endTimer > 210) {
        dTrans = 255;
      }
    }
    if (deathCount < 18) {
      rTrans--;
    }

    float d = dist(x, y, p.x, p.y);

    if (d <= 15 && rTrans <= 0) {

      rTrans = 255;
      if (deathCount < 18) {
        attackType = 3;
      }
      if (deathCount == 17) {
        bunny3.pause();
        death.rewind();
        death.play();
      }
      if (deathCount > 35) {
        dTrans = 255;
      }
      rTransTimer = 0;
      rb=true;
      deathCount++;
    }

    if (on == 1) {
      if (x<p.x) {
        x+=speed;
      }
      if (x>p.x) {
        x-=speed;
      }
      if (y<p.y) {
        y+=speed;
      }
      if (y>p.y) {
        y-=speed;
      }
    }
  }

  void wander() {
    if (on == 1) {
      //count++;
      //println(count);
      if (health>0) {
        if (gameState == 1 || gameState == 6) {
          if (enemiesDefeated < 17) {
            if (x<0) {
              x=0;
            }
            if (x>width) {
              x=width;
            }
            if (y<100) {
              y=100;
            }
            if (y>height) {
              y=height;
            }
          }
        }

        if (count == 0) {
          direction = ceil(random(4));
        }
        if (count <75) {
          if (direction == 1) {
            x+=speed;
            //count++;
          }
          if (direction == 2) {
            x-=speed;
            //count++;
          }
          if (direction == 3) {
            y+=speed;
            //count++;
          }
          if (direction == 4) {
            y-=speed;
            //count++;
          }
        }
        if (count >=100) {
          count = 0;
        }
      }
    }
  }

  void injure(player p) {
    //print(d+" ");

    if (health == 0 && dead == false) {
      enemiesDefeated++;
      dead = true;
    }

    if (dTrans == 255 && health == 0) {
      health = -1;
    }
    if (on == 1) {
      if (p.x >= x-r && p.x <= x+r) {
        if (p.y+10 >= y-r && p.y+10 <= y+r) { 
          if (keyPressed) {
            // if (tutorialMode != 2){
            if (key == ' ') {
              if (rb==false) {
                if (health>0) {
                  if (health>1) {
                    attackType = 2;
                  }
                  if (health==1) {
                    attackType = 3;
                  }
                  rTransTimer=0;
                  rb = true;
                  //print("hit");
                  health -=1;
                }
              }
            }
            //}
          }
        }
      }

      if (mouseX >= x-r && mouseX <= x+r) {
        if (mouseY >= y-r && mouseY <= y+r) {
          if (speed >0) {
            if (mousePressed) {
              if (f==false) {
                print("hit");

                attackType = 1;


                rTransTimer=0;
                rb = true;
                speed -=.5;
              }
            }
          }
        }
      }
    }
  }
}


