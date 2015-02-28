
class Particle {
  //Particle Data

  float x = 0;
  float y = 0;
  float speed = wind;
  PVector location;
  float ptheta = 0.0;
  float thetaadder = 0.05;
  int thetarange = 120;
  int thetabias = 220;
  float w = 0;
  boolean clearskies = true;
  float minimumSpeed = 1;
  float h, s, b;

  Particle() //the constructor
  {
    //speed = random(1,2);
    ptheta = 0.1 * random(10, 20);
    //thetaadder = random(0.01, 0.07);
    thetarange += random(-50, 50);

    y = random(-70, 70);
    x = random(-10, 10);

    location = new PVector(x, y);
  }

  //Particle Function
  //////////////
  void moving(float _y)
  {
    if (wind < minimumSpeed) {
      wind = int(minimumSpeed);
    }

    speed = wind;

    if ((clearskies == false) && (condc == 25 || condc== 31 || condc== 32 || condc== 33 || condc== 34 || condc== 36 || condc== 23 || condc== 24 || condc== 31)) {
      clearskies = true;
      w = random(-45, 45);
    }
    else if ((clearskies == true) && ((condc == 26) || (condc== 27) || (condc== 28) || (condc== 29) || (condc== 30) || (condc== 44) || (condc==0) || (condc==1) || (condc==2) || (condc==3) || (condc==4) || (condc==5) || (condc==6) || (condc==7) || (condc==8) || (condc==9) || (condc==10) || (condc==11) || (condc==12) || (condc==13) || (condc==14) || (condc==15) || (condc==16) || (condc==17) || (condc==18) || (condc==20) || (condc==21) || (condc==22) || (condc==35) || (condc==37) || (condc==38) || (condc==39) || (condc==40) || (condc==41) || (condc==42) || (condc==43) || (condc==45) || (condc==46) || (condc==47))) {
      clearskies = false;
      w = random(-360, 360);
    }

    float thetay = cos(ptheta) * thetarange + thetabias;

    x = x + speed;
    location.x = x + w;
    if (location.x > width) {
      location.x = location.x-width;
      x = x - width;
    }

    location.y = y+thetay;
    //
    ptheta += thetaadder;
  }


  //point value

  void display()
  {
    colorMode(HSB);
    if (unit2 == "f"){
      
    if (temp <=55) {
      h = random(190, 240);
      s = random(50, 100);
      b = random(60, 100);
    }

    else if (temp >=75) {
      h = random(0, 50);
      s = random(50, 100);
      b = random(60, 100);
    }

    else if ((temp > 55) && (temp <75)) {
      h = random(51, 170);
      s = random(50, 100);
      b = random(60, 100);
    }
    }
    
    else if (unit2 == "c") {
          if (temp <=12) {
      h = random(190, 240);
      s = random(50, 100);
      b = random(60, 100);
    }

    else if (temp >=24) {
      h = random(0, 50);
      s = random(50, 100);
      b = random(60, 100);
    }

    else if ((temp > 12) && (temp <24)) {
      h = random(51, 170);
      s = random(50, 100);
      b = random(60, 100);
    }
    }
    stroke(h, s, b);
    strokeWeight(1);
    point(location.x, location.y);
  }

  //edge return
  void checkEdges()
  {
    if (x > width) {
      location.x = 0;
    }

    else if (x < 0) {
      location.x = width;
    }
  }
}


