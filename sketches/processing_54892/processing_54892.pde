
// declare some global variables
int particleCount=200;

color [] strokeCol = new color[particleCount];
float [] x = new float [particleCount];
float [] y = new float [particleCount];
float [] spdX = new float [particleCount]; 
float [] spdY = new float [particleCount];
float [] w = new float [particleCount];
float [] h = new float [particleCount];
float [] angularVelocity = new float [particleCount];
float [] angleOfRotation = new float [particleCount];
int a, dayTime, startX, startY;
/*
float [] gravity = new float [particleCount];
 float [] damping = new float [particleCount];
 float [] wind = new float [particleCount];
 color [] strokeCol = new float [particleCount];
 float [] friction = new float [particleCount];
 float [] nmbrOfStairs = new float [particleCount];
 float [] stairX = new float [particleCount];
 float [] stairY = new float [particleCount];
 float [] stepX = new float [particleCount];
 float [] stepY = new float [particleCount];
 float [] stairLvlY1 = new float [particleCount];
 float [] stairLvlY2 = new float [particleCount];
 float [] stairLvlX1 = new float [particleCount];
 float [] stairLvlX2 = new float [particleCount
 */
float gravity, damping, wind, friction, nmbrOfStairs, stairX, stairY, stepX, stepY, stairLvlY1, stairLvlY2, stairLvlX1, stairLvlX2;
float cloudX, posX, posY, cloudX1, posX1, posY1, cloudX2, posX2, posY2;


void setup() {
  size(400, 400);
  smooth();
  nmbrOfStairs= round (random(2, 20));
  //nmbrOfStairs= 16;
  stepX=width/nmbrOfStairs;
  stepY=height/nmbrOfStairs;
  gravity = .08;
  damping = .85;
  //damping = .9;
  //damping = .95;
  //damping = 1;
  //wind += .002;
  wind += 0.0;
  //friction = .75;
  friction = .85;
  //friction=1;
  a=0;
  dayTime=0;
  startX=60;
  startY=60;
  cloudX=random(0.4, 1.5);
  cloudX1=random(0.4, 1.5);
  cloudX2=random(0.4, 1.5);
  posX=random(width);
  posX1=random(width);
  posX2=random(width);
  posY=random(height/5);
  posY1=random(height/5, 2*height/5);
  posY2=random(2*height/5, 3*height/5);
}

void keyReleased () {

  x[a] = startX;
  y[a] = startY;
  strokeCol[a] = color(random(255), random(255), random(255));
  spdX[a] = random(1.5, 5.5);
  spdY[a] = random(-1.5, 0.5);
  angularVelocity[a] = random(2, 5);
  angleOfRotation[a] = random(2, 5);
  w[a] = round (random(10, 20));
  h[a] = w[a]; // PacMans are round shaped
  a++;
  if (a==particleCount) {
    a=0;
  }
}


void draw() {
  background(230);

  fill(255);
  ellipse(posX, posY, 100, 40);
  ellipse(posX+10, posY-10, 80, 40);
  ellipse(posX-10, posY+15, 60, 30);
  posX+=cloudX;
  if (posX>width+50) {
    posX=-100;
  }
  ellipse(posX1, posY1, 100, 40);
  ellipse(posX1-10, posY1-10, 80, 40);
  ellipse(posX1+30, posY1-5, 100, 40);
  posX1+=cloudX1;
  if (posX1>width+50) {
    posX1=-100;
  }
  ellipse(posX2, posY2, 100, 40);
  ellipse(posX2+10, posY2-10, 80, 40);
  posX2+=cloudX2;
  if (posX2>width+50) {
    posX2=-100;
  }
  //Drawing stairs
  int p=0;
  stairX=0;
  stairY=0;
  fill(150, 150, 150);
  beginShape();
  while (p<nmbrOfStairs) {
    stairY+=stepY;
    vertex(stairX, stairY);
    stairX+=stepX;
    vertex(stairX, stairY);
    p++;
  }
  vertex(0, height);
  endShape(CLOSE);




  if (keyPressed) {     //a flow of little pacmans
    if (key=='f' || key=='F') {
      x[a] = startX;
      y[a] = startY;
      strokeCol[a] = color(random(255), random(255), random(255));
      spdX[a] = random(1.5, 5.5);
      spdY[a] = random(-1.5, 0.5);
      angularVelocity[a] = random(2, 5);
      angleOfRotation[a] = random(2, 5);
      w[a] = round (random(10, 20));
      h[a] = w[a];
      a++;
      if (a==particleCount) {  //when the number of pacmans on a 
        a=0;                       //screen reaches its limit the next 
        //pacman made will replace the first one
      }
    }
  }





  for (int i=0; i<particleCount; i++) { //drawing all pacmans
    fill(strokeCol[i]);
    noStroke();
    pushMatrix ();
    translate (x[i], y[i]);
    angleOfRotation[i]=angleOfRotation[i]+PI/30*angularVelocity[i];
    rotate( angleOfRotation[i]);
    arc(0, 0, w[i], w[i], PI/6, 11*PI/6);
    fill(0);
    ellipse(0, -w[i]/3, w[i]/6, w[i]/6);
    popMatrix();
    x[i] += spdX[i];
    spdX[i] += -wind;
    spdY[i] += gravity;
    y[i] += spdY[i];
    fill(255, 255, 0);



    if (x[i] > width-w[i]/2) { //bouncing of the right wall
      spdX[i] *= -1;
      spdY[i] *= damping;
      angularVelocity[i] *= -1 ;
    }

    if (x[i] < 0) {         // bouncing of the left wall
      spdX[i] *= -1;        // actually never happens
      angularVelocity[i] *= -1 ;
    }

    if (y[i] > height-h[i]/2) {    //bouncing of the floor
      y[i] = height - h[i]/2;
      spdY[i] *= -1;
      spdY[i] *= damping;
      spdX[i] *= friction;
      angularVelocity[i] *= friction ;
    }


    if (y[i] < 0) {                    //bouncing of the cealing
      spdY[i] *= -1;
    }
    int j=0;
    while (j<nmbrOfStairs) {
      stairLvlX1=stepX*j;
      stairLvlY1=stepY*j;
      j++;
      stairLvlY2=stepY*j;
      stairLvlX2=stepX*j;

      //bouncing of the top of a stair

      if ((y[i] > stairLvlY2-h[i]/2) && (x[i]>stairLvlX1) && (x[i]<stairLvlX2)) {
        y[i]=stairLvlY2-h[i]/2-.1;
        spdY[i] *= -1;
        spdY[i] *= damping;
        spdX[i] *= friction;
        angularVelocity[i] *= friction ;
      }

      //bouncing of th side of a stair

      if ((x[i] < stairLvlX1+w[i]/2)&& (y[i]>stairLvlY1)&& (x[i]<stairLvlY2)) {
        x[i]=stairLvlX1+w[i]/2+.1;  
        spdX[i] *= -1;
        spdY[i] *= damping;
        spdX[i] *= friction;
        angularVelocity[i] *= -1 ;
      }
    }
  }
  arc(startX, startY, 90, 90, PI/6, 11*PI/6); //pacman's face
  fill(0);
  ellipse(startX, 2*startY/3, 10, 10);
}


