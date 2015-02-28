
float speed = 0;
float x = 320;
float y = 320;
float windowX = 640;
float windowY = 640;
float tempx = -99;
float tempy = -99;
float tempx2;
float tempy2;
boolean target = false;
float angle = 0;
ArrayList<Bullet> bulletsFired;
ArrayList<Enemy> enemiesOnField;
ArrayList<Float> mineExplosion;
int count = 0;
float score = 0;
int ammo = 100000;
float playerRad = 20;
int life = 10000;
int maxlife = 10000;
boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;
float ax = 0;
float ay = 0;
float vx = 0;
float vy = 0;
float bombs = 50;
int weaponType = 1;
//float vnet = 0;
int hDelay = 0;
int landmines = 10;
boolean lost = false;
boolean paused = false;
boolean pausedFlag = false;
color[] pxcopy = new color[(int)(windowX*windowY)];
void setup() {
  size(640,640);
  bulletsFired = new ArrayList<Bullet>();
  enemiesOnField = new ArrayList<Enemy>();
  mineExplosion = new ArrayList<Float>();
}

void draw(){

  if(!paused){
    background(0);
    
    noCursor();
    stroke(255);
    noFill();
    ellipse(mouseX,mouseY,10,10);
    fill(255);
    line(mouseX-5,mouseY,mouseX+5,mouseY);
    line(mouseX,mouseY-5,mouseX,mouseY+5);
    
    vy = vy + ay;
    vx = vx + ax;
    vy = vy * 0.95;
    vx = vx * 0.95;
  //  vnet = Math.sqrt(Math.pow(vx,2)+Math.pow(vy,2));
    vx = constrain(vx,-4,4);
    vy = constrain(vy,-4,4);
    x = x + vx;
    y = y + vy;
    x = constrain(x,playerRad/2,windowX-playerRad/2);
    y = constrain(y,playerRad/2,windowY-playerRad/2);
    fill(0,255,0);
    if(!lost){
      ellipse(x,y,playerRad,playerRad);
    }
  
    fill(255);
  
    if(target){
      stroke(0);
      fill(255);
      ellipse(tempx,tempy,10,10);
      fill(0);
      line(tempx-5,tempy,tempx+5,tempy);
      line(tempx,tempy-5,tempx,tempy+5);
      fill(255);
    }else{
      tempx = mouseX;
      tempy = mouseY;
    }
    stroke(255);
    tempx2 = mouseX;
    tempy2 = mouseY;
    if(mousePressed && !lost){
      if(ammo>0&&count%5==0&&weaponType==1){
        bulletsFired.add(new Bullet(5.0,x,y,calcAngle(x,y,tempx,tempy),10.0,x,y,1));
        ammo--;
      }
      if(ammo>0&&count%2==0&&weaponType==2){
        bulletsFired.add(new Bullet(5.0,x,y,calcAngle(x,y,tempx,tempy)+radians(random(-20,20)),10.0,x,y,1));
        ammo--;
      }
      if(ammo>0&&count%5==0&&weaponType==3){
        bulletsFired.add(new Bullet(5.0,x,y,calcAngle(x,y,tempx,tempy),10.0,x,y,1));
        bulletsFired.add(new Bullet(5.0,x,y,calcAngle(x,y,tempx,tempy)+radians(-20),10.0,x,y,1));
        bulletsFired.add(new Bullet(5.0,x,y,calcAngle(x,y,tempx,tempy)+radians(20),10.0,x,y,1));
        ammo = ammo - 3;
      }
      if(ammo>0&&hDelay>20&&weaponType==4){
        hDelay = 0;
        bulletsFired.add(new Bullet(25.0,x,y,calcAngle(x,y,tempx,tempy),2.0,x,y,3));
        ammo = ammo - 10;
      }
  
    }
    /*
    if(mousePressed){
      speed = 10;
    }else{
      speed = 0;
    }
    */
    
    //creates enemies
    if(count%20==0){
      float direction = random(-PI,PI);
      float temp = random(0,1);
      int enemytype = 1;
      float enemyspeed = 1.0;
      float enemyRad = 25.0;
      if(temp>0.75){
        enemytype = 2;
        enemyspeed = 3.0;
      }
      if (count%100==0){
        enemytype = 3;
        enemyspeed = 1.0;
        enemyRad = 50.0;
      }
      if(direction < -PI/2){
        float side = random(-640,640);
        if(side < 0){
          enemiesOnField.add(new Enemy(enemyRad,Math.abs(side),0.0,direction,enemyspeed,enemytype));
        }else{
          enemiesOnField.add(new Enemy(enemyRad,640.0,side,direction,enemyspeed,enemytype));
        }
      }else if(direction < 0){
        float side = random(-640,640);
        if(side < 0){
          enemiesOnField.add(new Enemy(enemyRad,Math.abs(side),0.0,direction,enemyspeed,enemytype));
        }else{
          enemiesOnField.add(new Enemy(enemyRad,0.0,side,direction,enemyspeed,enemytype));
        }
      }else if(direction <PI/2){
        float side = random(-640,640);
        if(side < 0){
          enemiesOnField.add(new Enemy(enemyRad,Math.abs(side),640.0,direction,enemyspeed,enemytype));
        }else{
          enemiesOnField.add(new Enemy(enemyRad,0.0,side,direction,enemyspeed,enemytype));
        }
      }else{
        float side = random(-640,640);
        if(side < 0){
          enemiesOnField.add(new Enemy(enemyRad,Math.abs(side),0.0,direction,enemyspeed,enemytype));
        }else{
          enemiesOnField.add(new Enemy(enemyRad,side,640.0,direction,enemyspeed,enemytype));
        }
      }
    }
    //moves bullets
    for(int i = 0; i < bulletsFired.size(); i++){
      Bullet temp = bulletsFired.get(i);
      if(temp.getX()>windowX||temp.getY()>windowY||temp.getX()<0||temp.getY()<0){
        bulletsFired.remove(i);
        i--;
      }else{
        temp.setoldX(temp.getX());
        temp.setoldY(temp.getY());
        temp.setX(temp.getX() + temp.getSpeed() * cos(temp.getAngle()));
        temp.setY(temp.getY() - temp.getSpeed() * sin(temp.getAngle()));
        fill(0,255,0);
        if(temp.getType()==2){
           fill(255,0,0);
        }
        ellipse(temp.getX(),temp.getY(),temp.getRad(),temp.getRad());
      }
  
    }
    fill(255);
    //moves enemies
    for(int i = 0; i < enemiesOnField.size(); i++){
      Enemy temp = enemiesOnField.get(i);
      if(temp.getX()>windowX||temp.getY()>windowY||temp.getX()<0||temp.getY()<0){
        enemiesOnField.remove(i);
        i--;
      }else{
        if(temp.getType()==1){
          temp.setX(temp.getX() + temp.getSpeed() * cos(temp.getAngle()));
          temp.setY(temp.getY() - temp.getSpeed() * sin(temp.getAngle()));
          fill(255,200,100);
          ellipse(temp.getX(),temp.getY(),temp.getRad(),temp.getRad());
          if(count%100==0){
            bulletsFired.add(new Bullet(4.0,temp.getX(),temp.getY(),/*random(-PI,PI)*/calcAngle(temp.getX(),temp.getY(),x,y),1.0,temp.getX(),temp.getY(),2));
          }
        }
        if(temp.getType()==2){
          temp.setX(temp.getX() + temp.getSpeed() * cos(calcAngle(temp.getX(),temp.getY(), x, y)));
          temp.setY(temp.getY() - temp.getSpeed() * sin(calcAngle(temp.getX(),temp.getY(), x, y)));
          fill(255,0,255);
          ellipse(temp.getX(),temp.getY(),temp.getRad(),temp.getRad());
        }
        if(temp.getType()==3){
          temp.setX(temp.getX() + temp.getSpeed() * cos(temp.getAngle()));
          temp.setY(temp.getY() - temp.getSpeed() * sin(temp.getAngle()));
          fill(100,100,100);
          ellipse(temp.getX(),temp.getY(),temp.getRad(),temp.getRad());
          if(count%20==0){
            bulletsFired.add(new Bullet(4.0,temp.getX(),temp.getY(),random(-PI,PI),1.0,temp.getX(),temp.getY(),2));
          }
        }
  
      }
    }
    //Timed shots
    for(int i = 0; i < bulletsFired.size(); i++){
      Bullet temp2 = bulletsFired.get(i);
      if(temp2.getCDuration()!=-999){
        if(temp2.getCDuration()>temp2.getDuration()){
          bulletsFired.remove(i);
          i--;
        }else{
          temp2.setCDuration(temp2.getCDuration()+1);
        }
      }
  
    }
    //calcs hits with bullet
    for(int i = 0; i < bulletsFired.size(); i++){
      Bullet temp2 = bulletsFired.get(i);
      if(temp2.getType()==1||temp2.getType()==3||temp2.getType()==4||temp2.getType()==5){
        for(int j = 0; j < enemiesOnField.size(); j++){
          Enemy temp = enemiesOnField.get(j);
  //        float angle1 = calcAngle(temp2.getoldX(),temp2.getoldY(),temp.getX(),temp.getY());
  //        float angle2 = calcAngle(temp2.getoldX(),temp2.getoldY(),temp2.getX(),temp2.getY());
  //        float angle3 = angle2-angle1;
  //        float btemp = (temp2.getY()-temp2.getoldY());
  //        float atemp = (temp2.getX()-temp2.getoldX());
  //        float ytemp = (float)((atemp*btemp*(temp.getX()-temp2.getoldX())+Math.pow(atemp,2)*temp2.getoldY()+Math.pow(btemp,2)*temp.getY())/(Math.pow(atemp,2)+Math.pow(btemp,2)));
  //        float xtemp = (atemp/btemp)*(ytemp-temp2.getoldY())+temp2.getoldX();
          boolean test1 = Math.sqrt(Math.pow(temp2.getX()-temp.getX(),2)+Math.pow(temp2.getY()-temp.getY(),2))<(temp.getRad()/2+temp2.getRad()/2);
  //        boolean test2 = Math.abs(sin(angle3))*Math.sqrt(Math.pow(temp2.getoldX()-temp.getX(),2)+Math.pow(temp2.getoldY()-temp.getY(),2))<(temp2.getRad()/2+temp.getRad()/2);
  //        boolean test3 = (temp2.getoldX()-xtemp)*(temp2.getX()-xtemp) <= 0;
  //        boolean test4 = (temp2.getoldY()-ytemp)*(temp2.getY()-ytemp) <= 0;
          if(test1 /*|| (test2 && test3 && test4)*/){
            if(temp2.getType()==1){
              bulletsFired.remove(i);
              i--;
            }
            if(temp2.getType()==4){
              mineExplosion.add(temp2.getX());
              mineExplosion.add(temp2.getY());
              bulletsFired.remove(i);
              i--;
            }
            enemiesOnField.remove(j);
            j--;
            score++;
            ammo = ammo + 10;
  
          }
        }
      }
      if(temp2.getType()==2){
  //      float angle1 = calcAngle(temp2.getoldX(),temp2.getoldY(),x,y);
  //      float angle2 = calcAngle(temp2.getoldX(),temp2.getoldY(),temp2.getX(),temp2.getY());
  //      float angle3 = angle2-angle1;
  //      float btemp = (temp2.getY()-temp2.getoldY());
  //      float atemp = (temp2.getX()-temp2.getoldX());
  //      float ytemp = (float)((atemp*btemp*(x-temp2.getoldX())+Math.pow(atemp,2)*temp2.getoldY()+Math.pow(btemp,2)*y)/(Math.pow(atemp,2)+Math.pow(btemp,2)));
  //      float xtemp = (atemp/btemp)*(ytemp-temp2.getoldY())+temp2.getoldX();
        boolean test1 = Math.sqrt(Math.pow(temp2.getX()-x,2)+Math.pow(temp2.getY()-y,2))<(playerRad/2+temp2.getRad()/2);
  //      boolean test2 = Math.abs(sin(angle3))*Math.sqrt(Math.pow(temp2.getoldX()-x,2)+Math.pow(temp2.getoldY()-y,2))<(temp2.getRad()/2+playerRad/2);
  //      boolean test3 = (temp2.getoldX()-xtemp)*(temp2.getX()-xtemp) <= 0;
  //      boolean test4 = (temp2.getoldY()-ytemp)*(temp2.getY()-ytemp) <= 0;
        if(test1 /*|| (test2 && test3 && test4)*/){
          life--;
          if(!lost){
            bulletsFired.remove(i);
            i--;
          }
  
          if(life == 0){
            lost = true;
          }
        }
      }
    }
    //mine explosions
    for(int i = 0; i < mineExplosion.size(); i = i + 2){
      float exploX = mineExplosion.get(i);
      float exploY = mineExplosion.get(i+1);
      for(int j = 0; j < 360; j = j+ 10){
        bulletsFired.add(new Bullet(4.0,exploX,exploY,radians(j),1.0,exploX,exploY,5,25,1));
      }
    }
    mineExplosion.clear();
    //checks collison with enemy
    for(int i = 0; i < enemiesOnField.size(); i++){
      Enemy temp = enemiesOnField.get(i);
      if(Math.sqrt(Math.pow(temp.getX()-x,2)+Math.pow(temp.getY()-y,2))<(playerRad/2+temp.getRad()/2)){
          life--;
          if(!lost){
            enemiesOnField.remove(i);
            i--;
          }
          if(life == 0){
            lost = true;
          }
  
  
      }
    }
    //moves player
    /*
    angle = calcAngle(x,y, tempx2, tempy2);
    fill(0,0,255);
    if(Math.abs(x-tempx2)<speed && Math.abs(y-tempy2)<speed){
      x = tempx2;
      y = tempy2;
      ellipse(x,y,playerRad,playerRad);
    }else{
      x = x + (speed) * cos(angle);
      y = y - (speed) * sin(angle);
      ellipse(x,y,playerRad,playerRad);
    }
    */
    //hp bar
    
    if(lost){
      fill(255);
      textSize(72);
      text("YOU LOSE",170,300);
      life = 0;
    }
    fill(255);
    rectMode(CORNERS);
    rect(0,0,windowX*(1-(life*(1.0)/maxlife)),20);
    fill(0,255,0);
    if(life<maxlife/2){
      fill(255,255,0);
    }
    if(life<maxlife/4){
      fill(255,0,0);
    }
  
    rect(windowX*(1-(life*(1.0)/maxlife)),0,windowX,20);
    fill(255,0,0);
    textSize(10);
    text("HP: "+life+"/"+maxlife,300,20);
    text("Score: "+round(score),10,40);
    text("Ammo: "+ammo,10,60);
    
    text("Bombs: "+bombs,10,80);
    text("Mines: "+landmines,10,100);
    if(weaponType == 1){
      text("Weapon: Standard",10,120);
    }else if (weaponType == 2){
      text("Weapon: Scatter",10,120);
    }else if (weaponType == 3){
      text("Weapon: Triple",10,120);
    }else{
      text("Weapon: Heavy",10,120);
    }
    if(target){
      text("Mode: Target", 10, 140);
    }else{
      text("Mode: Free", 10, 140);
    }
    text("Frame Rate: "+round(frameRate),10,160);

    score = score + 1 + (float)count/1200;
    count++;
    hDelay++;

  }
  

  if(pausedFlag){
    pausedFlag = false;
    loadPixels();
    for(int i = 0; i < pixels.length; i++){
      pxcopy[i] = pixels[i];
    }
    updatePixels();
  }

  if(paused){

    cursor();
    loadPixels();
    for(int i = 0; i < pixels.length; i++){
      pixels[i] = pxcopy[i];
    }
    updatePixels();
    textSize(72);
    fill(255);
    text("Paused",170,300);
  }
}

void keyPressed(){
  if(key == 'p'){
    paused = !paused;
    pausedFlag = true;
  }
  if(keyCode == ' '&&landmines>0){
    bulletsFired.add(new Bullet(5.0,x,y,0,0,x,y,4));
    landmines--;
  }
  if(key == 'e'){
    tempx = mouseX;
    tempy = mouseY;
    target = !target;
  }
  if(key == 'q'&&bombs>0){
    for(int i = 0; i < 360; i++){
      bulletsFired.add(new Bullet(5.0,x,y,radians(i),3.0,x,y,1));
    }
    bombs--;
  }
  if(key == '1'){
    weaponType = 1;
  }
  if(key == '2'){
    weaponType = 2;
  }
  if(key == '3'){
    weaponType = 3;
  }
  if(key == '4'){
    weaponType = 4;
  }
  if(key == 'w'){
    ay = -0.5;
    wKey = true;
  }
  if(key == 'a'){
    ax = -0.5;
    aKey = true;
  }
  if(key == 's'){
    ay = 0.5;
    sKey = true;
  }
  if(key == 'd'){
    ax = 0.5;
    dKey = true;
  }
}
void keyReleased(){
  if(key == 'w'){
    if(sKey){
      ay = 0.5;
    }else{
      ay = 0;
    }
    wKey = false;
  }
  if(key == 'a'){
    if(dKey){
      ax = 0.5;
    }else{
      ax = 0;
    }
    aKey = false;
  }
  if(key == 's'){
    if(wKey){
      ay = -0.5;
    }else{
      ay = 0;
    }
    sKey = false;
  }
  if(key == 'd'){
    if(aKey){
      ax = -0.5;
    }else{
      ax = 0;
    }
    dKey = false;
  }
}

float calcAngle(float x, float y, float targetx, float targety){
  float angle = 0;
  if(x == targetx && targety < x){
    return PI/2;
  }
  if(x == targetx && targety > x){
    return -PI/2;
  }
  if(x != targetx){
    if(targetx > x){
      angle = -atan((y - targety)/(x - targetx));
    }
    if(targetx < x && targety > y){
      angle = -(PI+atan((y - targety)/(x - targetx)));
    }
    if(targetx < x && targety < y){
      angle = PI-atan((y - targety)/(x - targetx));
    }
  }
  return angle;
}

class Bullet{
  float rad;
  float x;
  float y;
  float angle;
  float speed;
  float oldx;
  float oldy;
  int type;
  int duration;
  int currentD;
  
  Bullet(float a, float b, float c, float d, float e, float f, float g, int h){
    rad = a;
    x = b;
    y = c;
    angle = d;
    speed = e;
    oldx = f;
    oldy = g;
    type = h;
    duration = -999;
    currentD = -999;
  }
  Bullet(float a, float b, float c, float d, float e, float f, float g, int h, int i, int j){
    rad = a;
    x = b;
    y = c;
    angle = d;
    speed = e;
    oldx = f;
    oldy = g;
    type = h;
    duration = i;
    currentD = j;
  }
  float getRad(){
    return rad;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getoldX(){
    return oldx;
  }
  float getoldY(){
    return oldy;
  }
  float getAngle(){
    return angle;
  }
  float getSpeed(){
    return speed;
  }
  int getType(){
    return type;
  }
  int getDuration(){
    return duration;
  }
  int getCDuration(){
    return currentD;
  }
  void setX(float a){
    x = a;
  }
  void setY(float a){
    y = a;
  }
  void setoldX(float a){
    oldx = a;
  }
  void setoldY(float a){
    oldy = a;
  }
  void setDuration(int a){
    duration = a;
  }
  void setCDuration(int a){
    currentD = a;
  }

}

class Enemy{
  float rad;
  float x;
  float y;
  float angle;
  float speed;
  int type;
  
  Enemy(float a, float b, float c, float d, float e, int f){
    rad = a;
    x = b;
    y = c;
    angle = d;
    speed = e;
    type = f;
  }
  float getRad(){
    return rad;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getAngle(){
    return angle;
  }
  float getSpeed(){
    return speed;
  }
  int getType(){
    return type;
  }
  void setX(float a){
    x = a;
  }
  void setY(float a){
    y = a;
  }
}

