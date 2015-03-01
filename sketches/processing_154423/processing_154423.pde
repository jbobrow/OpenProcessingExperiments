
int state=0;
int PROJECTILEMAX=25;
Player P;
Projectile[] projectiles=new Projectile[25];

void setup() {
  P = new Player();
  size(800, 640);
  background(0, 127, 255);


  for (int i=0; i<PROJECTILEMAX; i++)
    projectiles[i]=new Projectile();
}

void draw() {
  switch(state) {
  case 0: //attract loop

    //press space to begin
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Welcome!", 400, 320);

    fill(0, 0, 255);
    text("Press space to start!", 400, 480);




    break;
  case 1:
    //main game
    clear();

    P.display();
    P.update();
     for (int i=0; i<PROJECTILEMAX; i++) {
       projectiles[i].display();
       projectiles[i].update();
     }
    

    break;
  case 2:
    //game over
    break;
  default:
  }
}


void keyPressed() {

  switch(state) {
  case 0: 
    state=1;
    break;
  case 1:
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        P.vY=-P.speed;
        break;
      case DOWN:
        P.vY=P.speed;
        break;
      case LEFT:
        P.vX=-P.speed;
        break;
      case RIGHT:
        P.vX=P.speed;
        break;
      }
    } else {
      switch(key)
      {
      case 'w':
        P.vY=-P.speed;
        break;
      case 's':
        P.vY=P.speed;
        break;
      case 'a':
        P.vX=-P.speed;
        break;
      case 'd':
        P.vX=P.speed;
        break;
      }
    }


    break;
  case 2:
    break;
  default:
  }
}
void keyReleased() {

  switch(state) {
  case 0: 
    state=1;
    break;
  case 1:
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        P.vY=0;
        break;
      case DOWN:
        P.vY=0;
        break;
      case LEFT:
        P.vX=0;
        break;
      case RIGHT:
        P.vX=0;
        break;
      }
    } else {
      switch(key)
      {
      case 'w':
        P.vY=0;
        break;
      case 's':
        P.vY=0;
        break;
      case 'a':
        P.vX=0;
        break;
      case 'd':
        P.vX=0;
        break;
      }
    }


    break;
  case 2:
    break;
  default:
  }
}
void mousePressed() {
  for (int i=0; i<PROJECTILEMAX; i++) {
    if (projectiles[i].toBeKilled()) {
      projectiles[i] =new Projectile(P.damage, 10, P.x, P.y, get_angle(P.x, P.y, (float)mouseX, (float)mouseY));
      break;
    }
    if (i==49) {
      projectiles[i] =new Projectile(P.damage, 10, P.x, P.y, get_angle(P.x, P.y,(float)mouseX, (float)mouseY));
      break;
    }
  }
}






class Player {
  int health;
  int damage;
  int speed;
  float x;
  float y;
  float vX, vY;


  Player() {
    health=8;
    damage=1;
    speed=5;
    x=width/2;
    y=height/2;
    vX=0;
    vY=0;
  }
  void resetBoosts() {
    damage=1;
    speed=5;
  }
  void display() {
    stroke(0, 255, 0); 
    strokeWeight(25);
    point(x, y);
  }
  void update() {
    x+=vX;
    y+=vY;
  }
}
class Projectile {
  int damage;
  int speed;
  float x, y, vX, vY;
  float theta;
  boolean visible;

  Projectile() {
    damage=0;
    speed=0;
    x=299792458; //arbitrary position that makes the projectile be killed whenever it is checked
    y=299792458;
    vX=0;
    vY=0;
    visible=false;//wouldnt want to display these placeholders would we
  }
  Projectile(int newDamage, int newSpeed, float initX, float initY, float angle) {
    damage=newDamage; //passed from player
    speed=newSpeed; //I don't really intend to make it variable, but the option for upgrades is there
    x=initX; //starting position aka player position
    y=initY;
    theta=angle;//passed theta, which will be calculated in call to constructor
    vX=get_movement_x(theta, speed); //vdlocities are calculated here, as they are constant
    vY=get_movement_y(theta, speed);
    visible=true; //I want to see it right? useful for when it hits something, since destroying the instance of projectile may not be easy
  }

  void display() {
    if (visible) {
      stroke(0, 0, 255);
    } else {
      stroke(0, 0, 0, 0);
    }
    strokeWeight(15);
    point(x, y);
  }
  void update() {
    x+=vX;
    y+=vY;
  }
  boolean toBeKilled()//checks if the projectile is off the screen and returns true if it is, deleting it from the array
  {
    return ( (x>width+250 || x < -250) && (y>height+250 || y < -250) );
  }
}



float get_angle(float a1, float a2, float b1, float b2) {
  //'''Location A is player position and locationB is where the enemy is'''
  float tempx1=a1;
  float tempy1=a2;
  float x2=b1-tempx1;
  float y2=b2-tempy1;
  float x1=0;
  float y1=0;
  float rawAngle=atan2(y2, x2);
  float distance=0;
  float angle=rawAngle;
  return angle;
}
float get_movement_x(float theta, float speed) {
  float x=cos(theta)*speed;
  float speedx=x;
  return speedx;
}
float get_movement_y(float theta, float  speed) {
  float y=sin(theta)*speed;
  float speedy=y;
  return speedy;
}

