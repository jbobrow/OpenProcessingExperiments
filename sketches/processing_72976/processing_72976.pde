
// hw 7
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

float x, y, xAdd, yAdd; // bouncing ball vars
float a, b, ease; // hostile vars
float dX, dY, dxv,dyv; // dead weight vars
int t = 63;
int timeCount;
int catchCount;
Hostile[] hostile = new Hostile[1]; 

void setup(){
  size(700,700);
  smooth();
  noCursor();
  
  x = random(width);
  y = random(height);
  xAdd = random(-10,10);
  yAdd = random(-10,10);
  
  dX = width/2;
  dY = height/2;
  dxv = 10;
  dyv = 10;
  
  a = random(width);
  b = random(height);
  
  ellipseMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  
  for(int i=0; i<hostile.length; i++){
    hostile[i] = new Hostile();
  }
  
  catchCount = 0; 
}

void draw(){
  initiate();
  catcher();
  deadWeight();
  countDown();
  
  if(millis()/1000 > 7){
    for(int i=0; i<hostile.length; i++){
      hostile[i].display(); // creates a hostile after the countdown (3 seconds)
      hostile[i].checkHit();
    }
    if(frameCount%200<1){
      Hostile h = new Hostile();
      hostile = (Hostile[]) append (hostile,h); // creates a new hostile every 200 framecounts
      h.display(); 
      h.checkHit();
     }
    bouncingBall();
    showTime();
  }
  
  checkCatch();
  checkWin();  
}

void initiate(){
  background(35);
}

void catcher(){
  fill(255,70);
  stroke(255,70);
  ellipse(mouseX, mouseY, 30, 30);
}

void deadWeight(){
  fill(255,35);
  ellipse(dX,dY,15,15);
  stroke(255,35);
  line(dX,dY,mouseX,mouseY);
  
  if(mouseX>width/2){
    dxv = 3;
  }else if (mouseX<width/2){
    dxv = -3;
  }    
  dX = dX + dxv;
  if(mouseY>height/2){
    dyv = 3;
  }else if (mouseY<height/2){
    dyv = -3;
  }    
  dY = dY + dyv;
  
  // wrap and restart the score
  if(dX>width){
    dX = 0;
    catchCount = 0;
  }else if(dX<0){
    dX = width;
    catchCount = 0;
  }
  if(dY>height){
    dY = 0;
    catchCount = 0;
  }else if(dY<0){
    dY = height;
    catchCount = 0;
  }
}

void bouncingBall(){
  stroke(255,70);
  fill(177,255,0,100);
  ellipse(x,y,10,10);
  x += xAdd;
  y += yAdd;
  
  if(x<=0 || x>=width){
    xAdd = xAdd * -1;
  }else if(y<=0 || y>=height){
    yAdd = yAdd * -1;
  }
}

void checkCatch(){
  if(dist(mouseX,mouseY,x,y)<15){
    x = random(width);
    y = random(height);
    xAdd = random(-20,20);
    yAdd = random(-20,20);
    
    fill(177,255,0,100);
    rect(width/2,height/2,width,height);
    
    catchCount += 1;  
    hostile = (Hostile[]) shorten(hostile); // removes a hostile after every catch
  }
}
    
void showTime(){
  fill(255);
  timeCount = t - millis()/1000;
  textSize(14);
  text(timeCount, width/2, height/2);
  
  fill(177,255,0);
  text(catchCount,width/14,height/14);
  fill(255,0,0);
  text(hostile.length,width/14,height/14+17);
}

void countDown(){
  int cX, cY;
  cX = width/2;
  cY = height/2;
  
  if(millis()/1000<8){
    fill(255,0,0);
    text(8-millis()/1000, cX, cY);
    fill(140);
    textAlign(LEFT);
    text("To win:\n1. Avoid the red dots\n2. Eat the green dots\n3. Kill all the red dots to win\n4. or Survive until the time runs out\n5.Don't let the small white ball get off the screen\n6. Your final score is the number of green dots captured \n    multiplied by the remaining time\n\nPress the Space Bar to restart", cX-140, cY - 170);
  }else if(millis()/1000>4){
    cX = -1000;
    cY = -1000;
  }
}

void checkWin(){
  if (hostile.length<1){
    fill(255);
    textAlign(CENTER);
    textSize(35);
    text("YOU WIN",width/2,height/2-100);
    textSize(14);
    text("press space bar to restart", width/2, height/2-84);
    text("SCORE : " + catchCount*timeCount, width/2, height-70);
    noLoop();
  }
  
  if(timeCount == 1){
    fill(255);
    textAlign(CENTER);
    textSize(35);
    text("YOU WIN" ,width/2,height/2-100);
    textSize(14);
    text("press space bar to restart", width/2, height/2-84);
    text("SCORE : " + catchCount*timeCount, width/2, height-70);
    noLoop();
  }
}


void keyPressed(){
  if(key == ' '){
    x = random(width);
    y = random(height);
    xAdd = random(-10,10);
    yAdd = random(-10,10);
    dX = width/2;
    dY = height/2;
  
    a = random(width);
    b = random(height);
    catchCount = 0;
    
    
    hostile = (Hostile[]) subset(hostile,0,0);
    Hostile h = new Hostile();
    hostile = (Hostile[]) append (hostile,h);
    h.display();
    h.checkHit();
    
    t = millis()/1000 + 60;
    
    loop();
  }
  if(key == 'a'){
    saveFrame("test.jpg");
  }
}


// an object that acts as the hostile agent in this game
class Hostile{
  float centerX, centerY, ease;
  
  Hostile(){
    centerX = random(width);
    centerY = random(height);
    ease = random(.1);
  }
  
  void display(){
    centerX = centerX + (mouseX - centerX) * ease;
    centerY = centerY + (mouseY - centerY) * ease;
    fill(255,0,0,100);
    ellipse(centerX, centerY, 15, 15);
  }
  
  void checkHit(){
    if(dist(mouseX,mouseY,centerX,centerY)<17){
      fill(255,0,0,100);
      rect(width/2,height/2,width,height);
      
      fill(255);
      textAlign(CENTER);
      textSize(35);
      text("YOU LOST",width/2,height/2-100);
      textSize(14);
      text("press space bar to restart", width/2, height/2-84);
      text("SCORE : " + catchCount*timeCount, width/2, height-70);
      noLoop();
    }
  }
}
    

