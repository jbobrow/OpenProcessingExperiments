
/*
______ _         _                     _    _ _          
 | ___ (_)       | |                   | |  | (_)         
 | |_/ /_ _ __ __| |___    ___  _ __   | |  | |_ _ __ ___ 
 | ___ \ | '__/ _` / __|  / _ \| '_ \  | |/\| | | '__/ _ \
 | |_/ / | | | (_| \__ \ | (_) | | | | \  /\  / | | |  __/
 \____/|_|_|  \__,_|___/  \___/|_| |_|  \/  \/|_|_|  \___|
 David Lobser - 2012 - made at ITP                                                        
 
 */

//number of telephone poles
int amount = 12;

//counter for noise
float q = 0;
int qcar = 0;
float q2 = 0;
float mynoise = 0;

//this sets up the sagging points on the wire
float point2X = 0;
float point3X = 0;
float point2Y = 0;
float point3Y = 0;

// bb is divions between points in the array
int bb = 4;
float bbcar = 20;

//amount of sag
float sag = 100;

//instantiates some variables to be used for line drawings and motion later
float rx = random(width);
float ry = random(height);
float rxcar = random(width);
float rycar = random(height);
float ox;
float oy;
float oxcar=-1000;
float oycar=-1000;
int globalCount = 0;
int switcher;
//specifically - do it tells the car to start moving to the next point
int doit = 1;

float[] posX = new float[amount];
float[] posY = new float[amount];


//variables to set up the number and position of birds
int[] numBirds = new int[amount];
float[] noiseBirds = new float[amount*200];
float[] clouds = new float [999999];




void setup() {

  background(255);
  smooth();
  size(800, 500);
  float bbbx = -200;
  float bbby = height/2;

  for (int i = 0; i<clouds.length;i++) {
 clouds[i] = random(width);
  }
  //sets up the position of all the poles
  for (int i = 0; i<posX.length*200;i++) {
    noiseBirds[i] = random(.1, .9);
    println(noiseBirds[i]);
  }
  for (int i = 0; i<posX.length;i++) {
    posX[i] = bbbx;
    posY[i] = bbby;
    numBirds[i] = int(random(3));
    noiseBirds[i] = random(.1, .9);
    println(noiseBirds[i]);

    //sets the spacing for the wires
    bbbx+=random(75, 200);
    bbby=random(height/2-100, height/2);
  }

  ox = width/2;
  oy = height/2;
}



void draw() {

//sky();
  background(255);
  fill(0, 0);

   for (int t = 0 ; t<10;t++) {
  cloud(clouds[t+globalCount],clouds[t+100+globalCount]/2-height/2,noiseBirds,t*2);
   }

  //puts the poles in place
  for (int i = 0 ; i<posX.length-1;i++) {

    if (oxcar>width) {
      switcher=1;
      oxcar = 0;
      oycar = 0;
    }
    if (oxcar<0) {
      switcher =0;
    }
    if (switcher>0) {
      float bbbx = -200;
      float bbby = height/2;
      if(globalCount < 9999){
globalCount+=10;
}else{globalCount=0;}

      //sets up the position of all the poles

      for (int r = 0; r<posX.length;r++) {
        posX[r] = bbbx;
        posY[r] = bbby;
        numBirds[r] = int(random(3));
        noiseBirds[r] = random(.1, .9);

        //sets the spacing for the wires
        bbbx+=random(75, 200);
        bbby=random(height/2-100, height/2);
        switcher=0;
        qcar = 0;
        bbcar = 0;
        
      }
    }



    pushMatrix();
    translate(posX[i], posY[i]);
    pole();
    popMatrix();
  }

  road();

  //sets up the two sets of lines - offset in either direction

  pushMatrix();
  translate(20, 0);
  lines(1);
  popMatrix();
  pushMatrix();
  translate(-20, 0);
  lines(0);
  popMatrix();
  car();
  fill(255);
  pushStyle();
  noStroke();
  rect(0, height-20, 220, 20);
  fill(0);
  text("Drag telephone poles to move them", 5, height-5);
  popStyle();
}



void road() {

  pushStyle();
  fill(0, 0);
  strokeWeight(100);

  //makes outer curve
  beginShape();
  curveVertex(posX[0], posY[0]+200);
  for (int i = 0 ; i<posX.length;i++) {
    curveVertex(posX[i], posY[i]+200);
  }
  curveVertex(posX[posX.length-1], posY[posY.length-1]+200);
  endShape();
  popStyle();
  pushStyle();

  //and inner curve
  fill(0, 0);
  strokeWeight(90);
  stroke(128);
  beginShape();

  curveVertex(posX[0], posY[0]+200);
  for (int i = 0 ; i<posX.length;i++) {
    curveVertex(posX[i], posY[i]+200);
  }
  curveVertex(posX[posX.length-1], posY[posY.length-1]+200);
  endShape();
  popStyle();
  
  //yellow lines
  
   //and inner curve
   pushStyle();
  fill(0, 0);
  strokeWeight(15);
  stroke(255,200,0);
  beginShape();

  curveVertex(posX[0], posY[0]+200);
  for (int i = 0 ; i<posX.length;i++) {
    curveVertex(posX[i], posY[i]+200);
  }
  curveVertex(posX[posX.length-1], posY[posY.length-1]+200);
  endShape();
  popStyle();
    pushStyle();
  fill(0, 0);
  strokeWeight(5);
  stroke(128);
  beginShape();

  curveVertex(posX[0], posY[0]+200);
  for (int i = 0 ; i<posX.length;i++) {
    curveVertex(posX[i], posY[i]+200);
  }
  curveVertex(posX[posX.length-1], posY[posY.length-1]+200);
  endShape();
  popStyle();
}


void lines(int myboids) {
  fill(0, 0);
strokeWeight(1);
  //repositions poles
  for (int i = 0 ; i<posX.length-1;i++) {
    if (mousePressed) {
      if (mouseX>posX[i]-20 && mouseX <posX[i]+20 && mouseY >posY[i]-10 && mouseY<posY[i]+200) {
        // if (dist(mouseX, mouseY, posX[i], posY[i])<20) {
        posX[i] = mouseX;
        posY[i] = mouseY-100;
      }
    }

    // the secret sauce!  Makes the lines and sets up the points in between

    rx = posX[i+1];
    ry = posY[i+1];
    ox = posX[i];
    oy = posY[i];

    float mox = rx - ox;
    float moy = ry - oy;

    ellipse(ox, oy, 5, 5);

    while (bb>1) {

      ox += mox/bb;
      oy += moy/bb;  

      //this makes sagger sag based on distance
      float sagger = constrain((dist(posX[i], posY[i], posX[i+1], posY[i+1])), 0, 250);
      sag = map(sagger, 0, 250, 250, 0);  

      //these set up the two control points for the bezier
      if (bb==2) {
        point2X = ox;
        point2Y = oy+sag;
      }
      if (bb==3) {
        point3X = ox;
        point3Y = oy+sag;
      }
      bb-=1;
    }

    bb=3;
    ox = posX[i+1];
    oy = posY[i+1];
    ellipse(ox, oy, 5, 5);
    endShape();

    //point3X+=noise(q)*100;
    //this actually draws the lines
    bezier(posX[i], posY[i], point3X, point3Y, point2X, point2Y, posX[i+1], posY[i+1]);

    //and this sticks the birds on
    if (myboids==1) {
      for (int birdy = numBirds[i];birdy<3;birdy++) {
        float birdpos =  noiseBirds[i+birdy];
        float boidX = bezierPoint(posX[i], point3X, point2X, posX[i+1], birdpos);
        float boidY = bezierPoint(posY[i], point3Y, point2Y, posY[i+1], birdpos);
        boid(boidX, boidY);
      }
      if (i==4) {
        float pantsX = bezierPoint(posX[i], point3X, point2X, posX[i+1], .5);
        float pantsY = bezierPoint(posY[i], point3Y, point2Y, posY[i+1], .5);
        pants(pantsX, pantsY);
      }
    }

    q+=1.001;
  }
}



void pole() {
  fill(0);
  rect(-5, -10, 10, 200);
  rect(-20, -2.5, 40, 5);
  rect(-20, 10, 40, 5);
}

void car() {

  if (doit ==1) {
    if (qcar<posX.length-1) {
      qcar++;
    }
    else {
      qcar=0;
    }
    rxcar = posX[qcar];
    rycar = posY[qcar];
    doit = 0;
  }

  //this part animates the car using the same trick I used when drawing on the lines

  if (bbcar>1) {
    bbcar-=1;
  }
  else {
    if (qcar<2) {
      bbcar=1;
    }
    else {
      //speed of the car, bigger is slower
      bbcar=60;
    }
  }

  float moxcar = rxcar - oxcar;
  float moycar = rycar - oycar;
  oxcar += moxcar/bbcar;
  oycar += moycar/bbcar;

  float angle = atan2(moycar, moxcar);

  if (bbcar <2 && bbcar<2) {
    doit = 1;
  }

  pushStyle();
  rectMode(CENTER);
  pushMatrix();
  translate(oxcar, oycar+210);
  rotate(angle);
  fill(0);
  scale(1.5);
  beginShape();
  vertex(-20, 10);
  vertex(-20, 5);
  vertex(-8, 5);
  vertex(-5, -5);
  vertex(5, -5);
  vertex(8, 5);
  vertex(20, 5);
  vertex(20, 10);
  endShape();
  ellipse(-10, 10, 10, 10);
  ellipse(10, 10, 10, 10);
  popStyle();
  popMatrix();
}

void boid(float mytx, float myty) {
  pushStyle();
  fill(0);
  pushMatrix();
  translate(mytx-3, myty-5);
  scale(1, -1);
  beginShape();
  //I drew the bird (very quickly) in maya and copied the verts, it worked!
  curveVertex(-1.481481, 3.045267); 
  curveVertex(-1.185906, 3.070988); 
  curveVertex(-0.594756, 3.122428); 
  curveVertex(0.774085, 6.687243); 
  curveVertex(4.658911, 4.079218);
  curveVertex(3.800148, -1.646091); 
  curveVertex(5.07877, -1.815844);
  curveVertex(5.451497, -1.496914);
  curveVertex(5.63786, -1.337449); 
  curveVertex(5.63786, -1.337449); 
  curveVertex(5.620703, -1.368161);
  curveVertex(5.586388, -1.429585); 
  curveVertex(5.473378, -4.425692); 
  curveVertex(1.038618, -4.694807); 
  curveVertex(0.248695, -1.980264); 
  curveVertex(0.435739, 1.381294); 
  curveVertex(-0.386713, 2.627928); 
  curveVertex(-1.116558, 2.906154); 
  curveVertex(-1.481481, 3.045267); 
  endShape();
  popStyle();
  popMatrix();
  fill(0, 0);
}

void pants(float mytx, float myty) {
  pushStyle();
  fill(0);
  pushMatrix();
  translate(mytx, myty);

  rect(0, 0, 20, 10);
  roundRect(0, 0, 9, 20);
  roundRect(11, 0, 9, 20);
  // rect(11,0,9,20);
  float rh = 3;
  float rl = -3;
  fill(random(200, 255), random(100, 225), 0);
  noStroke();
  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0);

  curveVertex(3+random(rl, rh), -10+random(rl, rh));
  curveVertex(7+random(rl, rh), -3+random(rl, rh));
  curveVertex(10+random(rl, rh), -20+random(rl, rh));
  curveVertex(14+random(rl, rh), -3+random(rl, rh));
  curveVertex(18+random(rl, rh), -16+random(rl, rh));

  curveVertex(20, 0);
  curveVertex(20, 0);
  endShape();
  fill(170);
  ellipse(4, 18, 7, 4);
  ellipse(16, 18, 7, 4);
  rect(1, 1, 18, 2);
  fill(255);
  rect(8, 0, 4, 4);
  noFill();

  popStyle();
  popMatrix();
  noFill();
}

void roundRect(float x, float y, float w, float h)
{
  float corner = w/10.0;
  float midDisp = w/20.0;

  beginShape();  
  curveVertex(x+corner, y);
  curveVertex(x+w-corner, y);
  curveVertex(x+w+midDisp, y+h/2.0);
  curveVertex(x+w-corner, y+h);
  curveVertex(x+corner, y+h);
  curveVertex(x-midDisp, y+h/2.0);

  curveVertex(x+corner, y);
  curveVertex(x+w-corner, y);
  curveVertex(x+w+midDisp, y+h/2.0);
  endShape();
} 

void cloud(float mytx,float myty, float[] mynoise,int myid){
 // popStyle();
  fill(0);
for(int i = 0; i<10;i++){
  fill(0);
  ellipse(mytx+mynoise[i+myid]*100,myty+mynoise[i+1000+myid]*40,mynoise[i+myid]*70,mynoise[i+myid]*70);
  fill(15);
  ellipse(mytx+mynoise[i+myid]*100,myty+mynoise[i+1000+myid]*40-5,mynoise[i+myid]*40,mynoise[i+myid]*40);
 // pushStyle();
}
}

void sky(){

 for(int i = 0 ; i<height+10; i+=10){
  stroke(height-i,128);
   fill(height - i,128);
  rect(0,height-i,width,height+10-i); 

  
}
}
  


