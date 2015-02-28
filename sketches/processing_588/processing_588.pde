
class City {
  float longitude;
  float latitude;
  
  City() {
    longitude = height/2;
    latitude = width/2;
  }
  
  void drawMe() {
    rect(latitude, longitude, 10, 10);
  }

}

class Citizen {
  float xpos;
  float ypos;
  float radius;
  int xDirection = 1;
  int yDirection = 1;
  //boolean movingTowards = false;

  Citizen(float x, float y, float r) {
    xpos = x;
    ypos = y;
    radius = r;
  }
  
  
  
  void drawMe() {
    noStroke();
    fill(255);
    ellipse(xpos, ypos, radius, radius);  
  }

}

City mecca;
Citizen pilgrim;

void setup() {
  size(200,200);
  mecca = new City();
  pilgrim = new Citizen(random(0, width), random(0, height), 4);
}

void draw() {
  background(0);
  smooth();
  mecca.drawMe();
  pilgrim.drawMe();

  //pilgramage

  float initDistance = dist(pilgrim.xpos, pilgrim.ypos, mecca.latitude, mecca.longitude);

  if(initDistance > 15) {
    pilgrim.xpos += 1*pilgrim.xDirection;
    if(dist(pilgrim.xpos, pilgrim.ypos, mecca.latitude, mecca.longitude) < initDistance) {
      
    }

    else {
      pilgrim.xDirection *= -1;
    }
    
    initDistance = dist(pilgrim.xpos, pilgrim.ypos, mecca.latitude, mecca.longitude);
    
    pilgrim.ypos += 1*pilgrim.yDirection;
    if(dist(pilgrim.xpos, pilgrim.ypos, mecca.latitude, mecca.longitude) < initDistance) {
      
    }

    else {
      pilgrim.yDirection *= -1;
    }
    
  }
}


