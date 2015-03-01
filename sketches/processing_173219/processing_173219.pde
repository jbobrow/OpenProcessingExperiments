
//Snowfall
//By: Johnny Dunn
//Coding for particle for loops used from David Grant

Snow[] snow = new Snow[0];
 
 
int maxSnow = 200;

color c = 157;
int k = 0;
 
void setup () {
  size (600, 600);
  frameRate(60);
  noStroke();

}
 
 
void draw() {
 
  background(c,c+23,c+93);
  snow = (Snow[]) append(snow, new Snow(300, 0));
  if (snow.length> maxSnow) {
    snow = (Snow[]) subset(snow, 1);
  }
  for (int i=0; i<snow.length; i++) {
   snow[i].fall();

      snow[i].x += snow[i].wind;
      snow[i].y += snow[i].gravity;
 
    ellipse(snow[i].x, snow[i].y, snow[i].snowSize, snow[i].snowSize);
    fill(255, 249, 249, random(150f,255f));
  }
}

  
  void keyPressed()
  {
    if (keyCode == LEFT) {
      c = c-5;
    } else if (keyCode == RIGHT) {
      c = c+5;
    }
    if (keyCode == UP) {
    gravity = gravity + .5f;
    } else if (keyCode == DOWN) {
    gravity = gravity -.5f;
    }
  }
 

class Snow {
 
  float x;          
  float y;          
  float wind;       
  float gravity;       
  float snowSize;   
  float friction;
 
 
  Snow(float xpos, float ypos) {
    x = xpos = random (0,width);
    y = ypos = 0;
    wind = random(-1.0001f,1.0001f);
    gravity = random(6.0f,9.8f);
    friction = random(.005f,.001f);    
    snowSize = random (5, 10);
  }
  
    void fall () {
    gravity = gravity - friction;
      for (int i=0; i<snow.length; i++) {

    if (snow[i].y <= 0) {
      gravity = 3.0f;
    }
      }
    }
}



