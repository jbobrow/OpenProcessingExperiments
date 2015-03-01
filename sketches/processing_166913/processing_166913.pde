
Confetti[]confetti = new Confetti[200];

void setup() {
  size(600, 400); 
  colorMode(HSB, 360, 100, 100, 255);
  for (int i = 0; i<confetti.length; i++) {
    confetti[i] = new Confetti(20);
  }
}

void draw() {
  background(0);
  for (int i = 0; i<confetti.length; i++) {
    confetti[i].display();
    confetti[i].fall();
  }
}


  class Confetti {
    float x, y, d, yspeed, h,hspeed, s, sspeed;

    Confetti(float _d) {
      x = random(width);
      y = height;
      d = _d;
      yspeed = random(2, 3);
      h = random(0,50); //hue
      hspeed = .5;
      s = 0;
      sspeed = .5;
    }

    void display() {
      noStroke();
       h = h+hspeed;
       s = s+sspeed;
      fill(h, s, 100, 100);
      ellipse(x, y, d, d);

    }

    void fall() {
      y = y-yspeed;
      
      if(h>360){
       hspeed = -hspeed; 
      }
      if (h<0){
        hspeed = -hspeed; 
      }
     
     if(s>100){
       sspeed = -sspeed; 
      }
      if (s<0){
        sspeed = -sspeed; 
      }

      if (y>height) {
        yspeed = -yspeed;
      }
      if (y<0) {
        yspeed = -yspeed;
      }
    }



  }


