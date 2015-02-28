
TumbleWeed [] weeds = new TumbleWeed [8];

PImage photo;

void setup() {
  size(1080, 792);
  smooth();
  photo = loadImage("oakland.jpg");


  for (int i = 0; i<weeds.length; i++) {
    weeds[i] = new TumbleWeed ();
  }
}

void draw() {

  background (photo);
  for (int i =0; i <weeds.length; i++) {
    weeds[i].display();
    weeds[i].tumble();
  }
}



class TumbleWeed {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;



  TumbleWeed() {
    xpos = random(width);
    ypos = height - height/4;
    xspeed = noise(1)*2;
    yspeed = noise(1)*2;
  }


  void display() {
    for (int i = 0; i<30; i++) {
      stroke(random(2));
      line(xpos+random(-20, 20), ypos + random(-20, 20), xpos - random(-20, 20), ypos - random(-20, 20));
    }
  }

  void tumble() {

    xpos += xspeed;
    ypos += yspeed;

    if (xpos>width||xpos<0) {
      xspeed = xspeed*-1;
    }

    if (ypos>height|| ypos< random(height/2, 3*(height/4))) {
      yspeed = yspeed*-1;
      
    }
  }
}



