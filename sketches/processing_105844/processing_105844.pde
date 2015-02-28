
int raindrops = 900;

int [] x = new int[raindrops];
int [] y = new int[raindrops];
PImage road;
PImage car;

PImage wipers;
PImage wipersUp;
boolean clean = true;
PImage fastbg;
PImage accelerate;
PImage fastRearview;



void setup() {

  size(800, 600);

  road = loadImage ("roadimage2.jpg");
  car = loadImage ("car.png");

  wipers = loadImage ("wipers.png");
  wipersUp = loadImage("wipersUp.png");
  fastbg  = loadImage("fastbg.png");
  accelerate  = loadImage("accelerate.png");
  fastRearview  = loadImage("fastRearview.png");

  for (int i = 0; i < raindrops; i++) {
    x[i] = int (random(0, 800));
    y[i] = int (random(0, 600));
  }
}

void draw() {

  if ((mouseX< width/2) && (mouseY < height/2)) {
    clean=true;
  }
  else
  {
    clean=false; 
   
  }






  noStroke();
  image(road, 0, 0);


  if (mousePressed && (mouseButton == LEFT)) {
    image(fastbg, 0, 0);

    image(car, 0, 0);

    for (int i=0; i < raindrops; i++) {

      x[i] += int (random(-25, 25));
      y[i] += int (random(-39, 39));

      fill(random (79, 194), random(174, 211), random(210, 224)); 
     
      ellipse(x[i], y[i], 2, 8);
    }
   
  }
  else {

  
    for (int i=0; i < raindrops; i++) {

      x[i] += int (random(-3, 3));
      y[i] += int (random(-5, 5));

      fill(random (79, 194), random(174, 211), random(210, 224)); 
    
      ellipse(x[i], y[i], 2, 8);
   
    }
   
  }
  


  if (clean == true) {
    image(road, 0, 0);
    image(wipersUp, 0, 0);
    for (int i=0; i < raindrops; i++) {

      x[i] += int (random(-2, 2));
      y[i] += int (random(-3, 3));

      fill(random (79, 194), random(174, 211), random(210, 224)); 
     
      ellipse(x[i], y[i], 2, 8);
    }
  }
  else {
    image(wipers, 0, 0);
  } 
if (mousePressed && (mouseButton == LEFT)) {
  image(car, 0, 0);
 image(fastRearview, 0, 0);
 } else {image(accelerate,0,0);}
}






