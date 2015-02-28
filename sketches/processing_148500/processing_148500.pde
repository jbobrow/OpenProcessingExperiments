
import gifAnimation.*;

Gif NyanCat;
PImage a;
PVector Nyanloc = new PVector(0, 0);
Asteroid newAsteroid;
int numAster = 10;
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
float medRadius = 13;

void setup() {
  
  size(902, 353);
  frameRate(40);
  a = loadImage("http://i1268.photobucket.com/albums/jj574/vitaminxie/Wallpaper_zpsaa9cc6d5.jpg");
  background(a);
  NyanCat = new Gif(this, "http://img1.wikia.nocookie.net/__cb20120408034008/nickfanon/images/6/6b/NyanCat.gif");
  NyanCat.play();

  for ( int a = numAster ; a > 0 ; a--) {
    asteroidList.add(new Asteroid());
  }
}   

void draw() {
  background(a);
  image(NyanCat, Nyanloc.x, Nyanloc.y);
  println(Nyanloc.x);
  println(Nyanloc.y);
  for (Asteroid A : asteroidList) {
    A.move();
    A.display();
  }

  for (int a = 0 ; a < asteroidList.size() ; a++) {
    if (asteroidList.get(a).asteroidloc.x <= 0) {
      asteroidList.remove(a);
      println("removed");
    }
    else if (dist(Nyanloc.x, Nyanloc.y, asteroidList.get(a).asteroidloc.x, asteroidList.get(a).asteroidloc.y) <= medRadius) {
      gameEnd();
    }
  }  

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      println("w");
      if (Nyanloc.y >= 0) {
        Nyanloc.y -= 3;
      }
    } 
    else if (key == 's' || key == 'S') {
      println("s");
      if (Nyanloc.y + 30 <= height) {
        Nyanloc.y += 3;
      }
    }
  }

  if (asteroidList.size() < numAster) {
    asteroidList.add(new Asteroid());
  }
}

class Asteroid {

  PVector asteroidloc; 

  Asteroid() {
    asteroidloc = new PVector( random(902, 2000), random(height));
  }  

  void move() {
    asteroidloc.x -=6;
  } 

  void display() {
    fill(0);
    ellipse(asteroidloc.x, asteroidloc.y, medRadius*2, medRadius*2);
  }
}
void gameEnd() {
  //GAME STOPS
  //RETURN TIME
  exit();
}



