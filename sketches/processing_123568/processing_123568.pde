
Fish [] myFish = new Fish [40];


void setup() {
  size(1000, 1000);
  float fishx = 200;
  float fishy = 200;

  for (int i = 0; i<40; i++) {
    myFish[i] = new Fish (color (#F77407), fishx, fishy, random(1, 4)); 
    fishx=random(0, width);
    fishy=random(0, height);
  }
}

void draw() {
  background(#074AED);
  for (int i = 0; i<40; i++) {
    myFish[i].swim();
    if (myFish[i].hitTest(mouseX,mouseY)){
      myFish[i].xpos=width+900;}
    myFish[i].display();
  }
}

class Fish {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Fish(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    triangle(xpos+20, ypos+10, xpos, ypos, xpos +20, ypos-10);
    {ypos = ypos + random(-2,2);}
    ellipse(xpos, ypos, 30, 15);
    
  }

  void swim() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;}
     ypos = ypos + random(-1,1);
     if (ypos > height ) { ypos -=20;} 
     if (ypos <0) { ypos += 20;}
    
  }
  boolean hitTest (float mouseX, float mouseY) {
    if (dist(xpos, ypos, mouseX, mouseY) <60){
      return true;}else{return false;}}
}



