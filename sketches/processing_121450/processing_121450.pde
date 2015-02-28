
Cloud Cloud1;
Cloud Cloud2;
Cloud Cloud3;
Cloud Cloud4;
Cloud Cloud5;
Cloud Cloud6;
Cloud Cloud7;
Cloud Cloud8;
Cloud Cloud9;
Cloud Cloud10;
Cloud Cloud11;
Cloud Cloud12;
Cloud Cloud13;
Cloud Cloud14;
Cloud Cloud15;



float[]arrayofWind = {
  .5, 1, 1, 1, .5, .5, 1.5, 1, 1.5, .5, 1, 1.5, 1, .5, 1, .5, 1, 1, 1, 1, .5, .5, .5, 1, .5, .5, 1, .5
};
PImage img;
int count;
int currentIndex = 0;

void setup() {
  size(400, 400);
  background(89, 162, 217);

  Cloud1 = new Cloud(-50);
  Cloud2 = new Cloud(-200);
  Cloud3 = new Cloud(-350);
  Cloud4 = new Cloud(-400);
  Cloud5 = new Cloud(-450);
  Cloud6 = new Cloud(-600);
  Cloud7 = new Cloud(-800);
  Cloud8 = new Cloud(-950);
  Cloud9 = new Cloud(-1000);
  Cloud10 = new Cloud(-1050);
  Cloud11 = new Cloud(-1150);
  Cloud12 = new Cloud(-1200);
  Cloud13 = new Cloud(-1250);
  Cloud14 = new Cloud(-1350);
  Cloud15 = new Cloud(-1400);
  noStroke();
  fill(95, 170, 225);
  ellipse(200, 200, 300, 300);
  img = loadImage("bgscenepng.png");
  count = 71;
  

  
}

void draw() {

  background(89, 162, 217);
  noStroke();
  fill(95, 170, 225);
  ellipse(200, 200, 300, 300);
  image(img, 50, 120);
  count += 1;
  float currentWind = arrayofWind[currentIndex]; 
  if (count > 70) {
    if (currentIndex < 27) {    
      currentIndex++;
    }
    else if (currentIndex > 27) { //Restarts at the beginning of the wind index
      currentIndex = 0;
    }
    count = 0;
  }
  Cloud1.display();
  Cloud2.display();
  Cloud3.display();
  Cloud4.display();
  Cloud5.display();
  Cloud6.display();
  Cloud7.display();
  Cloud8.display();
  Cloud9.display();
  Cloud10.display();
  Cloud11.display();
  Cloud12.display();
  Cloud13.display();
  Cloud14.display();
  Cloud15.display();
  Cloud1.move(currentWind);
  Cloud2.move(currentWind);
  Cloud3.move(currentWind);
  Cloud4.move(currentWind);
  Cloud5.move(currentWind);
  Cloud6.move(currentWind);
  Cloud7.move(currentWind);
  Cloud8.move(currentWind);
  Cloud9.move(currentWind);
  Cloud10.move(currentWind);
  Cloud11.move(currentWind);
  Cloud12.move(currentWind);
  Cloud13.move(currentWind);
  Cloud14.move(currentWind);
  Cloud15.move(currentWind);
  noFill();
  strokeWeight(200);
  stroke(255);
  ellipse(200,200,500,500);
}

class Cloud {

  Rain[] Rain1;
  int totalRain = 0;
  color c;
  float xpos;
  float ypos;
  float xspeed;
  Rain rainDrops[] = new Rain[50];


  Cloud(float tempX) {
    c = color(int(random(55, 100)));
    xpos = tempX;
    ypos = 80;
    xspeed = 1;
    smooth();


    for (int j=0;j<rainDrops.length;j++) {
      rainDrops[j] = new Rain(xspeed, xpos, ypos);
    }
  }

  void display() {
    fill(c);
    noStroke();
    for (int i = 0; i < rainDrops.length; i++ ) {
      rainDrops[i].checkBottom(xpos, ypos);
      rainDrops[i].move();
      rainDrops[i].display();
    }
    ellipse(xpos, ypos, 30, 30);
    ellipse(xpos-20, ypos, 20, 20);
    ellipse(xpos+20, ypos, 20, 20);
  }

  void move (float tempSpeed) {
    smooth();
    xspeed = tempSpeed;
    xpos += xspeed;
  }
}

class Rain {

  float rainx;
  float rainy;
  float rainSize;
  float yspeed;

  //
  float xspeed;
  float xpos;
  float ypos;

  Rain(float _xspeed, float _xcloud, float _ycloud) {
    rainSize = 2;

    yspeed = random(3, 4);

    xspeed = _xspeed;
    xpos = _xcloud + random(-5,5);
    ypos = _ycloud + random(-5,5);
  }

  void move() {
    xpos += xspeed;
    ypos += yspeed;
  }
  void checkBottom(float _xcloud, float _ycloud){
     if(ypos > 350){
         xpos = random(_xcloud-20, _xcloud+20);
         ypos = _ycloud;
       
     }
  }

  void display() {
    fill(0,0,255);
    noStroke();



    ellipse(xpos, ypos, rainSize, rainSize);
  }
}



