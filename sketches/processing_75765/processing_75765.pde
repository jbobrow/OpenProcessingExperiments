
PImage boat1, fish1, fish2, fish3, fish4, fish5, fish6, fish7, fish8, fish9, fish10, squid1, squid2, squid3;
int count;
int diff;
int lastsecond;

void setup() {  
  boat1 = loadImage("boat_1.gif");

  fish1 = loadImage("fish_1.gif");
  fish2 = loadImage("fish_2.gif");
  fish3 = loadImage("fish_3.gif");
  fish4 = loadImage("fish_4.gif");
  fish5 = loadImage("fish_5.gif");
  fish6 = loadImage("fish_6.gif");
  fish7 = loadImage("fish_7.gif");
  fish8 = loadImage("fish_8.gif");
  fish9 = loadImage("fish_9.gif");
  fish10 = loadImage("fish_10.gif");

  squid1 = loadImage("squid_1.gif");
  squid2 = loadImage("squid_2.gif");
  squid3 = loadImage("squid_3.gif");
  size(500, 600);
  frameRate(30);
  diff = millis();
  lastsecond = second();
}

void draw() {
  //sky
  background(141, 242, 245);

  //water
  noStroke();
  fill(15, 27, 126);
  rect(0, 100, 500, 550); 
  stroke(255);

  //time
  int ss = second();
  float s = map(millis()-diff, 0, 1000, 0, 500);
  float m = map(minute(), 0, 60, 0, 500);
  float sec = map(second(), 10, 60, 0, 500);
  float sm = map(minute(), 0, 60, 0, 500);

  //animated squid
  int pic;
  if (mousePressed==false) {

    count+=1;

    pic = count 3;
    if (pic >= 0 && pic <= 11) {
      image(squid1, sm, 400);
    }
    if (pic >= 12 && pic <= 21) {
      image(squid2, sm, 400);
    }
    if (pic >= 22 && pic <= 32) {
      image(squid3, sm, 400);
    }
  }

  //FISH
  float a, b, c, d, e, f, g, i, j, k;
  a = (150 + 10*sin(s/100));
  b = (200 + -20*sin(s/100));
  c = (250 + -20*sin(s/100));
  d = (180 + 15*sin(s/100));
  e = (350 + 20*sin(s/100));
  f = (300 + 10*sin(s/100));
  g = (400 + -5*sin(s/100));
  i = (278 + 15*sin(s/100));
  j = (325 + -10*sin(s/100));
  k = (383 + 10*sin(s/100));

  image(fish1, s, a);  
  image(fish2, s+100, b);  
  image(fish3, s+150, c);  
  image(fish4, s+200, d);
  image(fish5, s+250, e);
  image(fish6, s+300, f);
  image(fish7, s+350, g);
  image(fish8, s+400, i);
  image(fish9, s+450, j);
  image(fish10, s+500, k);

  image(fish10, s, k);
  image(fish9, s-50, j);
  image(fish8, s-100, i);
  image(fish7, s-150, g);
  image(fish6, s-200, f);
  image(fish5, s-250, e);
  image(fish4, s-300, d);
  image(fish3, s-350, c);
  image(fish2, s-400, b);
  image(fish1, s-450, a);


  image(boat1, sec, 5);
  
  if (lastsecond != ss) 
  {
    diff = millis();
    lastsecond = second();
  }
  
  //squid mouse
  if (mousePressed == true) {
    count+=1;
   // imageMode(CENTER);
    pic = count 3;
    if (pic >= 0 && pic <= 11) {
      image(squid1, 0, 400);
    }
    if (pic >= 12 && pic <= 21) {
      image(squid2, 0, 400);
    }
    if (pic >= 22 && pic <= 32) {
      image(squid3, 0, 400);
    }
  }

  //transparent water
  noStroke();
  fill(15, 27, 126, 150);
  rect(0, 100, 500, 550);
}
