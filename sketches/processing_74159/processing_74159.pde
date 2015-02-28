
float rocketX=300;
float rocketY=400;
float baseX;
float baseY;
float angle = 3*PI/2;
float dis;
float targetX = 250;
float targetY = 250;
float realAngle;
float dx;
float dy;

int m;
int s;
int h;

PImage earth;
PImage deck;
PImage rocket;

//for debug
PFont deca;

void setup() {
  size(500, 500);
  deca = loadFont("MalayalamMN-48.vlw");
  textFont(deca, 10);
  //frameRate(1);
  rectMode(CENTER);
  imageMode(CENTER);
  earth = loadImage("earth_from_space1.jpg");
  deck = loadImage("deck2.png");
  rocket = loadImage("rocket.png");
}

void draw() {
  fill(0);
  background(0);

  m = minute();
  s = second();
  h = hour();
  
  for(int i = 0; i < 50; i++){
    stroke(255,255,255,50);
    point(random(500),random(500));
    stroke(0);
  }


  image(earth, 250, 185, 170, 170);
  
  rect(250,470,500,60); 
  image(deck, 250, 416 , 500, 90); // top
  image(deck, 250, 436 , 500, 90); // middle
  
  baseY = ((m-1) / 20) * 20 + 440;
  baseX = ((m-1) % 20) * 23.8 + 23.8;
  
  for(int i = 1; i < h%12; i++){ //craters
    ellipse(250 + 75*cos(-PI/2 + (PI/6 * i)), 185 + 75*sin(-PI/2 + (PI/6 * i)),40,40);
  }

  targetX = 250 + 75*cos(-PI/2 + (PI/6 * h));
  targetY = 185 + 75*sin(-PI/2 + (PI/6 * h));

  //rect(250, 460, 500, 100);

  /*
  for (int y = 1; y <= 3; y++) {
    for (int x = 1; x <= 20; x++) {
      ellipse(x*23.8, 420 + y*20, 20, 10);
    }
  }
  */

  if (s <= 55) { // loading
    rocketX = baseX;
    rocketY = baseY - s + 38;
    
    //rect(rocketX, rocketY, 18, 55);
    pushMatrix();
    translate(0,0);
    rotate(0);
    scale(1);
    image(rocket,rocketX, rocketY, 18, 55);
    popMatrix();

    if (s == 55) {
      angle = 3*PI/2;
    }
  } 
  else { // launched

    dis = sqrt(sq(rocketX-targetX) + sq(rocketY-targetY));
    
    rocketX += (targetX - rocketX)/40;
    rocketY += (targetY - rocketY)/40;
    angle = atan((targetY-rocketY)/(targetX-rocketX))-PI/2;

    if (baseX < 250){angle-=PI;}
    /*
    realAngle = (asin((rocketX-targetX)/dis));
     
     angle = angleCheck(angle);
     realAngle = angleCheck(realAngle);
     
     if(angle < realAngle){
     angle += 0.01;
     } else if(realAngle < angle) {
     angle -= 0.01;
     }
     
     rocketX += cos(angle)*dis/80;
     rocketY += sin(angle)*dis/80;
     println(angle + " " + realAngle);
     */

    pushMatrix();
    translate(rocketX,rocketY);
    rotate(angle);
    scale(abs(targetY+rocketY)/abs(targetY+baseY+20));
    image(rocket,0,0, 18, 55);
    popMatrix();
  }

  //for debug, mousePos reader
  //fill(0);
  text("x: " + mouseX + " y: " + mouseY, mouseX, mouseY-4);
  point(mouseX, mouseY);
  point(baseX, baseY);
  ellipse(targetX, targetY, 2*m/3, 2*m/3);
  fill(0);
  if (m <= 20){
    rect(250,480,500,40); 
    image(deck, 250, 416 , 500, 90); // top
    image(deck, 250, 436 , 500, 90); // middle
    image(deck, 250, 456 , 500, 90); // bottom
  } else if (m <= 40) {
    rect(250,490,500,20); 
    image(deck, 250, 436 , 500, 90); // middle
    image(deck, 250, 456 , 500, 90); // bottom
  } else {
    image(deck, 250, 456 , 500, 90); // bottom
  }
}


/*
float angleCheck(float x){
 while(x < 0){
 x += 2*PI;
 }
 while(x > 2*PI){
 x -= 2*PI;
 }
 return x; 
 }
 */

