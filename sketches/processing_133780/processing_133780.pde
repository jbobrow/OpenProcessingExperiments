
int checkPoint = -15000;
ArrayList<Arr> Arrs = new ArrayList<Arr>();
PImage buoy;
PImage water;
PImage mine;
PImage explosion;
PImage dud;
Boolean paused = false;
float currentMineX = -666;
int currentMineSpawnTime;
int score = 0;
int lastBuoyX;
float lastBuoyAngle = 0.;

void setup(){
  size(500,500);
  buoy = loadImage("buoy.png");
  water = loadImage("water.png");
  mine = loadImage("mine.png");
  explosion = loadImage("explosion.png");
  dud = loadImage("dud.png");
}

void draw(){
  if(millis()-checkPoint>Arrs.size()*500){
    checkPoint=millis();
    Arr arr1 = new Arr();
    Arrs.add(arr1);
    score = score + 100;
  }
  if(!paused){
    background(#77bbff);
    pushMatrix();
    translate(mouseX,470);
    ellipse(0,0,3,3);
    float angle = (mouseX-lastBuoyX)*.01+.85*lastBuoyAngle;
    lastBuoyAngle = angle;
    rotate(angle);
    image(buoy,-20,-40);
    lastBuoyX = mouseX;
    popMatrix();
    for(int i=0;i<Arrs.size();i=i+1){
      Arrs.get(i).drawNextArr();
    }
    if(paused){
      gameOver();
    }
    if(currentMineX != -666){
      image(mine,currentMineX-15,450);
      if(millis()>currentMineSpawnTime+700){
        image(dud,currentMineX-50,380);
        currentMineX = -666;
      }
    }
    image(water,(millis()/70)%22-30,460);
  }else{
    checkPoint = millis();//keeps resetting the checkpoint so no new dolphins are spawned
  }
}

void gameOver(){
  textSize(24);
  text("SCORE: " + score,180,400);
  textSize(50);
  text("GAME OVER",100,150);
  textSize(16);
  text("press ENTER to restart",160,200);
  Arrs = new ArrayList<Arr>();
  score = 0;
}

void mousePressed(){
  if(currentMineX == -666){
    currentMineSpawnTime = millis();
    currentMineX = mouseX;
  }
}

void keyPressed(){
  if(key == ENTER && paused){
    paused = false;
  }
}
    

class Arr{
  PImage arr;
  PImage arr2;
  int spawnDelay = 0;
  float x;
  float y = 500;
  float dX;
  float dY;
  float angle;
  float decel = .4;
  
  Arr(){
    this.respawn();
  }
  void respawn(){
    spawnDelay = millis()+int(random(1)*200)+100;
    float finalX = random(1)*500;
    x = random(1)*500+1;
    while(abs(x-mouseX)<20){
      x = random(1)*500+1;
    }
    y = 500;
    if(x==finalX){
      x = x-1;
    }
    dY = random(10,18);
    dX = (finalX-x)/(dY*(2/decel));
    angle = atan(dY/dX)-(PI/2);
    if(dX<0){
      arr = loadImage("dolphinb.png");
      arr2 = loadImage("dolphinb2.png");
    }else{
      arr = loadImage("dolphinbf.png");
      arr2 = loadImage("dolphinb2f.png");
    }
  }
  void drawNextArr(){
    if(millis()>spawnDelay){
      x = x+dX;
      y = y-dY;
      dY = dY-decel;
      if(dX>0){
        angle = atan(dY/-dX)+(PI/2);
      }else{
        angle = atan(dY/-dX)-(PI/2);
      }
      pushMatrix();
      translate(x,y);
      
      rotate(angle);
      //ellipse(0,0,5,5);
      stroke(#FF0000);
      if(dY>0){
        image(arr,-20,-35);
      }else{
        image(arr2,-20,-35);
      }
      //arr.resize(int(36-36*(dY/20)),int(72-72*(dY/20)));
      popMatrix();
      
      //ellipse(x,y,3,3);
      //rect(x,440,3,3);
      //rect(mouseX-23,440,40,3);
      if(y>420 && y<490 && dY < 0){
        if(abs(x-(mouseX-3))<20){
          //rect(x,400,3,3);
          print(" x is: " + x + " mouseX is: " + mouseX + " dist is " + abs(x-(mouseX-3)));
          paused = true;
        }else if(abs(x-currentMineX)<15){
          Arrs.remove(this);
          image(explosion,currentMineX-50,380);
          currentMineX = -666;
        }
      }
      if(y>500){
        this.respawn();
      }
      //print("x: " + x + " dx: " + dX + " y: " + y + " dy: " + dY + " ");
    }
  }
}



