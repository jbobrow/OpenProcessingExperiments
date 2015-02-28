

Cloud clouds[] = new Cloud[4];
Rain drops[] = new Rain[4];

void setup() {
  size(700,400);

  smooth();

  int i = 0;

  while(i < 4) {

    clouds[i] = new Cloud((i+1)*(width/4), 70, 0.1, 60, 45);
    drops[i] = new Rain((i+1)*(width/4),50,0.1,0);

    i++;
  }

  stroke(255);
}



void draw() {

  int i = 0;

  background(0);

  while(i < 4) {
    if(mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {
      float d = dist(mouseX,0,clouds[i].xPos,0);
      float t = map(d,0,300,125,255);

      color c = color(t);
      clouds[i].drawCloud(c);
    }
    else {
      clouds[i].drawCloud(255);
    }
    clouds[i].fly();
    
    drops[i].Move();
    drops[i].drawRainDrops();

    i++;
  }
}  

class Cloud {

  float xStore[] = new float[20];
  float yStore[] = new float[20];
  float s1Store[] = new float[20];
  float s2Store[] = new float[20];

  float xPos;
  float yPos;
  float wind;
  float size1;
  float size2;

  Cloud(float x, float y, float w, float s1, float s2) {

    xPos = x;
    yPos = y;
    wind = w;
    size1 = s1;
    size2 = s2;

    int i = 0;

    while(i < 20) {

      xStore[i] = random(-50,50);
      yStore[i] = random(-20,20);
      s1Store[i] = random(55,60);
      s2Store[i] = random(55,60);

      i++;
    }
  }

  void fly() {

    xPos = xPos+wind;

    if (xPos > width) {
      xPos = 0;
    }
  }

  void drawCloud(color col) {

    int i = 0;

    fill(col, 220);
    noStroke();

    while(i < 20) {

      ellipse(xPos+xStore[i], yPos+yStore[i], s1Store[i], s2Store[i]); 

      i++;
    }
  }
} 

class Rain {

  float xStore[] = new float[160];
  float yStore[] = new float[160];
  float speed[] = new float[160];

  float dropX;
  float dropY;
  float windRain;
  float gravity;

  Rain(float x, float y, float r, float g) {

    dropX = x;
    dropY = y;
    windRain = r;
    gravity = g;
    

    int i = 0;

    while(i < 160) {

      xStore[i] = random(-50,50);
      yStore[i] = random(-20,20);
      speed[i] = random(3,8);

      i++;
    }
    
   
  }
  

    void Move() {

      int i = 0;
      
      while(i < 160) {
       
        yStore[i] += speed[i];
      
      if ( yStore[i] > height) {
         yStore[i] = 50;
      }
        i++;
      }
      
       dropX = dropX+windRain;

    if (dropX > width) {
      dropX = 0;
    }
    }

    void drawRainDrops() {

      int i = 0;    
      stroke(255);
    
      while(i < 160) {
       
        point(dropX+xStore[i],dropY+yStore[i]);

        i++;
      }
    }
  }


