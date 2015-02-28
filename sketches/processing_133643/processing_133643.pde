
//Clouds rotate based on seconds.
//Mouth turns further upside down based on hours.
//Space ship heads towards mouth and collides every minute.
//At minute == 59, crash "effect" occurs btwn moon + spaceship.

//Based on George Melies "A Trip to the Moon"

PImage moon;
PImage clouds,clouds2;
PImage capsule;
PImage crash;
PImage stars;

void setup() {
  size(900, 800);
  imageMode(CENTER);

  moon = loadImage("moon.png");
  clouds = loadImage("clouds.png");
  clouds2 = loadImage("clouds2.png");
  capsule = loadImage("capsule.png");
  crash = loadImage("crash.png");
  stars = loadImage("stars.png");
}


void draw() {

  background(26, 26, 26);
  image(stars,430,390);

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //Moon
  pushMatrix();
  translate(width/2,height/2);
  image(moon, 0, 0);
  popMatrix();
  
  //Hour
  pushMatrix();
  translate(-100,-95);
  noStroke();
  fill(122,89,46);
  bezier(479,536,509,521-h,578,512-h,617,536);
  popMatrix();
  
  noStroke();
  fill(122,89,46);
  ellipse(388,389,15,15);
  ellipse(518,389,15,15);
  
  //Clouds Layer 1
  pushMatrix();
  float newS = map(s,10,60,height,width+100);
  translate(width/2,height/2);
  rotate(radians(newS));
  image(clouds,0,0,1200,1200);
  popMatrix();
  
  //Clouds Layer 2
  pushMatrix();
  float newS2 = map(s*2,10,60,height,width+100);
  translate(width/2,height/2);
  rotate(radians(-newS2));
  image(clouds2,0,0,1100,1000);
  popMatrix();
  
  //Space Capsule
  translate(0+240,height-240);
  image(capsule,m,-m);

  if (m == 59){
    image(crash,width/3.5-65,-150);
  }
  
}



