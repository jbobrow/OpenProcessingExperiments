
int counter;
float rsz, ra, ang, jtr, c;
color f1, f2;
boolean f;

void setup() {
  size(350,350);
  background(255);
  colorMode(RGB);
  //rectMode(CENTER);
  counter = 0;
  f1 = color(random(255),random(255),random(255),10);
  f2 = color(0,0,0,10);
  strokeWeight(random(.5, 1));  
  frameRate(25); 
  smooth();
}

void draw() {
  if (counter == 222){
    counter = 0;
    filter(BLUR, 1);
  }
  else{
    counter++;
    if (second() % 2 == 0) {
      ang = random(360);
      jtr = random(-0.5, 0.5);
    }
    ang = ang + jtr;
    c = cos(ang);
    rsz = random(20,350*sin(counter));
    ra = random(360);
    fill(f1);
    stroke(255);
    if(mousePressed == true) {
      if (!f){
        fill(f1);
        f = true;
      } else {
        fill(f2);
        f = false;
      }
      rotate(c);
      rect(width/2 - rsz/2, height/2 - rsz/2, rsz, rsz);
    }
    else {
      if (!f){
        fill(f1);
        f = true;
      } else {
        fill(f2);
        f = false;
      }
      rotate(c);
      ellipse(random(width), random(height), rsz, rsz);
    }
  } 
}

                
                                
