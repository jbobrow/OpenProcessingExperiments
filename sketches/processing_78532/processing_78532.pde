

//File of Filonenko Olga
//My SUPER HERO

float[] x = new float  [3000]; //3000 variable array... geez
float Rad = 20; //i dont know what im doing with this..i know i had it for a reason..
//int cx, cy; //Position of my rollover button.
//int MyDiam = 250; //diameter of my button to rollover

//pictures
PImage hero_bg;
PImage spaceship;

boolean overCircle = false;

//background
  void setup() {
  size (406, 321);  
  smooth();
  noStroke();
  fill(0, 255, 0);

 
  //spaceships
  for (int i = 0; i < x.length; i ++ ) {
    x[i] = random (-100000, 200);
  }

  //load all the pictures here
  hero_bg = loadImage("hero_bg.jpg");
  spaceship = loadImage("spaceship.png");
}

//draws all the awesome pictures the way i want!
  void draw() {
  noStroke();
  

  float vx = 0;
  image (hero_bg, vx, 0 );
  vx += 1;


  //this is for the xwings as they travel forever... but not really.. they actually
  //only last for a certain amount of time.


  for (int i = 0; i < x.length; i ++ ) {
    x[i] += 3;
    float y = i * 0.4;
    image(spaceship, x[i], y, 100, 75);
  }


  //laser!!!!!! 
  if (mousePressed) {
    int Bx = 116;
    int By = 94;
     noStroke();
    fill(random(#ff6c00), random(0, 256), random(0, 256));
    ellipse(Bx, By, random(0, 20), random(0, 20));
    fill(random(#ff6c00), random(#ff6c00), random(#ff6c00), 50);
    ellipse(Bx, By, random(20, 50), random(20, 50));
    strokeWeight(5);
    stroke(#ff6c00);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(1);
    stroke(#fff200);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(1);
    line ( Bx, By, Bx + (random(0, 50)), By + (random(0, 50)));
  }
  
  
  //laser!!!!!! 
  if (mousePressed) {
    int Bx = 174;
    int By = 102;
     noStroke();
     fill(random(#ff6c00), random(0, 256), random(0, 256));
    ellipse(Bx, By, random(0, 20), random(0, 20));
    fill(random(#ff6c00), random(#ff6c00), random(#ff6c00), 50);
    ellipse(Bx, By, random(20, 50), random(20, 50));
    strokeWeight(5);
    stroke(#ff6c00);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(1);
    stroke(#fff200);
    line(Bx, By, mouseX, mouseY);
    strokeWeight(1);
    line ( Bx, By, Bx + (random(0, 50)), By + (random(0, 50)));
  }
  
}



