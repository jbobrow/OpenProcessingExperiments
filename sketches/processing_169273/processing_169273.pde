
PImage background;

int plantNum = 10;        // number of plant objects
int birdNum = 3;          // number of bird objects
int wolfNum = 1;          // number of wolf objects
int i;                    // iterator

// plant class
Plant[] plants = new Plant[plantNum];  // create plant object array

// bird class
Bird[] birds = new Bird[birdNum];    // create bird object array

// wolf class
//Wolf[] wolves = new Wolf[wolfNum];    // create wolf object array

void setup(){
  size(600,600);
  
  // background image
  background = loadImage("background.jpg");
  
  // Plant class array initialization
  for(i = 0; i < plantNum; i++){
    plants[i] = new Plant(random(50,550),50,random(350,580),random(200,1000));
  }
  
  // Bird class array init.
  //for(i = 0; i < birdNum; i++){
  birds[0] = new Bird(random(50,550),random(20,250),random(0.5,2.5));
  birds[1] = new Bird(random(50,550),random(20,250),random(0.5,2.5));
  birds[2] = new Bird(random(50,550),random(20,250),random(0.5,2.5));
}

void draw(){
  image(background, 0, 0);
  
  for(i = 0; i < plantNum; i++){
    plants[i].draw();
  }
  
  
  birds[0].draw();
  birds[1].draw();
  birds[2].draw();
  
}

class Plant {
  int X;
  int Y;
  int realY;  // final Y position
  int growthSpeed;  // how fast it grows/dies
  int stage;  // seed 0, sprout 1, young 2, adult 3, dead 4, being eaten 5, eaten 6
  float inc = 0.0;  // changes angle for plant movement
  float increment = random(0.01,0.03);  // different increment for each plant
  int timer;
  int isTargeted = 0;  // stores if the plant is being flown to by a bird
  
  Plant(int x, int y, int y2, int speed){
    X = x;
    Y = y;
    realY = y2;
    growthSpeed = speed;
    stage = 0;
    timer = speed;
  }
  
  void draw(){
    
    if(stage==0){                  // seed
    
      if(timer > 0){
      timer--;
      }
      if(timer <= 0){
        stage++;
        timer = growthSpeed;
      }
      
      if(Y < realY){
        Y += 3;
      }
      else{
        Y=realY;
        fill(98,78,52);
        noStroke();
        ellipse(X,Y,12,8);
        noFill();
      }
      noStroke();
      fill(255);
      ellipse(X,Y,5,5);
    }
    if(stage==1){                  // sprout
    
      if(timer > 0){
        timer--;
      }
      if(timer <= 0){
        stage++;
        timer = growthSpeed;
      }
      
      fill(98,78,52);
      noStroke();
      ellipse(X,Y,12,8);
      noFill();
      inc += increment;
      float angle = sin(inc)/10.0;
      stroke(143,245,144);
      stalk(X,Y,2,angle);
    }
    if(stage==2){                  // young
      
      if(timer > 0){
        timer--;
      }
      if(timer <= 0){
        stage++;
        timer = growthSpeed;
      }
      
      inc += increment;
      float angle = sin(inc)/10.0;
      stroke(55,216,56);
      stalk(X,Y,4,angle);
      stroke(95,247,96);
      stalk(X,Y,2,angle);
      stalk(X-4,Y,2,angle);
      stalk(X+4,Y,2,angle);
    }
    if(stage==3){                   // adult
      
      if(timer > 0){
        timer--;
      }
      if(timer <= 0){
        stage++;
        timer = growthSpeed;
      }
      
      inc += increment;
      float angle = sin(inc)/10.0;
      stroke(30,111,31);
      stalk(X,Y,7,angle);
      stroke(36,178,37);
      stalk(X,Y,4,angle);
      stalk(X-6,Y,4,angle);
      stalk(X+6,Y,4,angle);
    }
    if(stage==4){                    // dying
      
      if(timer > 0){
        timer--;
      }
      if(timer <= 0){
        stage++;
        timer = growthSpeed;
      }
      
      inc += increment;
      float angle = sin(inc)/10.0;
      stroke(216,147,57);
      stalk(X,Y,7,angle);
      stroke(240,205,77);
      stalk(X,Y,4,angle);
      stalk(X-6,Y,4,angle);
      stalk(X+6,Y,4,angle);
    }
    if(stage==5){                    // dead
      
      if(timer > 0){
        timer--;
      }
      if(timer <= 0){
        X = random(50,550);
        realY = random(350, 580);
        Y = realY;
        stage = 0;
        timer = growthSpeed;
      }
      
      float angle = sin(inc)/10.0;
      stroke(155,132,48);
      stalk(X,Y,7,angle);
      stroke(185,148,9);
      stalk(X,Y,4,angle);
      stalk(X-6,Y,4,angle);
      stalk(X+6,Y,4,angle);
      
    }
    if(stage==6){                    // being eaten
      inc += increment;
      float angle = sin(inc)/10.0;
      stroke(30,111,31);
      stalk(X,Y,7,angle);
      stroke(36,178,37);
      stalk(X,Y,4,angle);
      stalk(X-6,Y,4,angle);
      stalk(X+6,Y,4,angle);
    }
    if(stage==7){                    // eaten
      fill(98,78,52);
      noStroke();
      ellipse(X,Y,12,8);
    }
  }
}

class Bird {
  float X;
  float Y;
  int stage = 0; // flying/patrol 0, swooping to plant 1, eating 2, eaten 3
  int canSwoop = 1;
  float beginX;   // swoop start x
  float beginY;   // swoop start y
  float endX;     // swoop target x
  float endY;     // swoop target y
  float distX;    // x dist to move
  float distY;    // y dist to move
  float exponent = 0.5; // curve shape
  float step = 0.01;  // speed
  float pct = 0.0;    // percent traveled
  int dir = -1;
  int Xspeed;
  int eatTime = 400;
  int timer = eatTime;
  int speedXaxis = random(-3,3);
  int speedYaxis = random(-1,-4);
  int plant;
  
  Bird(float x, float y, float speed){
    X = x;
    Y = y;
    Xspeed = speed;
  }
  
  void draw(){
    for(i = 0; i < plantNum; i++){
      if(plants[i].stage == 3 && plants[i].isTargeted == 0){
        if(canSwoop==1){
          canSwoop = 0;
          plants[i].isTargeted = 1;
          plants[i].stage = 6;
          beginX = X;
          beginY = Y;
          endX = plants[i].X;
          endY = plants[i].Y;
          distX = endX - beginX;
          distY = endY - beginY;
          plant = i;
          pct = 0.0;
          stage = 1;
        }
      }
    }
    
    if(stage==0){            // patrol
      if(X <= 20 || X >= 580){
        Xspeed *= dir;
      }
      if(timer--<=0){
        timer = eatTime;
        if(canSwoop==0){
          plants[plant].stage = 0;
          plants[plant].isTargeted = 0;
          plants[plant].X = X;
          plants[plant].Y = Y;
          plants[plant].growthSpeed = random(200,1000);
          plants[plant].realY = random(350,580);
          canSwoop = 1;
        }
      }

      X += Xspeed;
      fill(250,111,18);
      noStroke();
      ellipse(X,Y,15,15);
    }
    if(stage==1){            // swoop;  code referenced from page 284
      pct += step;
      if(pct < 1.0){
        X = beginX + (pct * distX);
        Y = beginY + (pow(pct,exponent) * distY);
      } else {
        X = endX;
        Y = endY;
        stage = 2;
      }
      fill(250,111,18);
      noStroke();
      ellipse(X,Y,15,15);
    }
    if(stage==2){            // eating
      if(timer--<=0){
        plants[plant].stage = 7;
        if(Y>=beginY){
          X += speedXaxis;
          Y += speedYaxis;
        } else {
          timer = eatTime;
          stage = 0;
        }
        if(X <= 20 || X >= 580){
          speedXaxis *= dir;
        }
      }
      fill(250,111,18);
      noStroke();
      ellipse(X,Y,15,15);
    }
    if(stage==3){            // eaten
      fill(185,54,9);
      noStroke();
      ellipse(X,Y,20,5);
    }
  }
}

void stalk(int x, int y, int units, float angle){  // code referenced from 297
  pushMatrix();
  translate(x,y);
  for(int i = units; i > 0; i--){
    strokeWeight(i);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle);
  }
  popMatrix();
}


