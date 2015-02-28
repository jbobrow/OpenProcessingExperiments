
import gifAnimation.*;
 
Gif NyanCat;
PImage a;
//PImage NyanCat;
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
  //NyanCat = loadImage("http://upload.wikimedia.org/wikipedia/commons/5/54/Nyan-Cat-Original.png");
 
  for ( int a = numAster ; a > 0 ; a--) {
    asteroidList.add(new Asteroid());
  }
}  
 
void draw() {
  
  background(a);
  millis();
  image(NyanCat, Nyanloc.x, Nyanloc.y);
  //ellipse(Nyanloc.x+30, Nyanloc.y+25,medRadius*2,medRadius*2);
  textSize(20); 
  fill(255,0,0);
  text(timer(),(width/2)-50,0,255,255);
  
  for (Asteroid A : asteroidList) {
    A.move();
    A.display();
  }
 
  for (int a = 0 ; a < asteroidList.size() ; a++) {
    if (asteroidList.get(a).asteroidloc.x <= 0) {
      asteroidList.remove(a);
    }else if (dist(Nyanloc.x+30, Nyanloc.y+25, asteroidList.get(a).asteroidloc.x, asteroidList.get(a).asteroidloc.y) <= medRadius+8) {
      gameEnd();
    }
  } 
 
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      if (Nyanloc.y >= 0) {
        Nyanloc.y -= 3;
      }
    }
    else if (key == 's' || key == 'S') {
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
 
  float ranSpeed = random(10,15);
   
  PVector asteroidloc;
 
  Asteroid() {
    asteroidloc = new PVector( random(902, 2000), random(height));
  } 
 
  void move() {
    asteroidloc.x -= ranSpeed;
  }
 
  void display() {
    fill(0);
    ellipse(asteroidloc.x, asteroidloc.y, medRadius*2, medRadius*2);
  }
}

String timer(){
  int Tseconds = millis() / 1000;
  int Tminutes = Tseconds / 60;
  int Dseconds = 00;
  
  if( Tseconds < 10){
    Dseconds = Tseconds;
    return "00:0" + Dseconds;
  } else if( Tseconds < 60){
    Dseconds = Tseconds;
    return "00:" + Dseconds;
  } else if (Tseconds >= 60){
    Dseconds = Tseconds % 60;
    if( Tminutes < 10 && Dseconds < 10){
      return "0" + Tminutes + ":0" + Dseconds;
    }else if( Tminutes < 10 && Dseconds >= 10){
      return "0" + Tminutes + ":" + Dseconds;
    }else if( Tminutes >= 10 && Dseconds < 10){
      return Tminutes + ":0" + Dseconds;
    }else if( Tminutes >= 10 && Dseconds >= 10){
      return Tminutes + ":" + Dseconds;
    }      
  }  

  return "00:00";  
}

void gameEnd() {
  textSize(36);
  fill(255,100,100);
  text("Good Game",325,height/2);
  noLoop();
}


