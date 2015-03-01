
int gameState = 0;
int p;
int s;
int t, d;
float z;
int n=100;
ArrayList<Bad> intro;
Bad[] badAsteroid = new Bad[n];
Ast[] asteroid = new Ast[n];
Ast gold;
boolean paused = false;

void setup(){
  size(800,600);
  background(0);
  //intro = new arrayList<Intro>();
  //intro.add(new Bad(random(width), -10, random(3,5)));
  for(int i = 0; i< n; i++){
    asteroid[i]= new Ast(random(width), random(-50000), random(3,5));
  }
  for(int i=0; i < n; i++){
    badAsteroid[i]= new Bad(random(width), random(-30000), random(3,5));
  }
  gold = new Ast(random(width), random(-10000), random(3,5));
  p = 0;
  s = 40;
  t = 0;
  d = 0;
  z = 1;
}

void draw(){
  if(gameState == 0){
    background(0);
    /*for (int i = vintro.size()-1; i >= 0; i--) {
    Bad intro = intro.get(i);
    bad.move();
    bad.display();
    if (bad.finished()) {
      // Items can be deleted with remove().
      balls.remove(i);
    }*/
    textAlign(CENTER);
    textFont(createFont("Desdemona",72));
    fill(255,0,0,225);
    text("STARFIELD", width/2, 125);
    textFont(createFont("CharlemagneStd", 24));
    textSize(24);
    fill(4,75,0);
    text("Press 'Left' key to go left", width/2 - 200, 300);
    text("Press 'Right' key to go right", width/2 + 200, 300);
    fill(100);
    text("Collect the gray", width/2 -228, 400);
    fill(255,255,0);
    text(" and gold stars,", width/2 - 48, 400);
    fill(255,0,0);
    text(" but avoid the red stars", width/2 + 180, 400);
    fill(255,0,0, 200);
    text("Press 'Spacebar' to begin", width/2, 500);
    if(keyPressed == true && key == ' '){
      gameState = 1;
    }
  }
  if(gameState == 1){
    if(!paused){
      background(0);
      frameRate(60);
      d++;
      player();
      fill(255,255,0);
      gold.display();
      gold.move();
      for(int i=0; i< n; i++){
        fill(100);
        asteroid[i].display();
        asteroid[i].move();
        if(asteroid[i].y>height){
          asteroid[i].y= random(-50000+20*z);
          asteroid[i].x = random(width);
        }
      }
      for(int i=0;i<n;i++){
        badAsteroid[i].display();
        badAsteroid[i].move();
        if(badAsteroid[i].y > height){
          badAsteroid[i].x = random(width);
          badAsteroid[i].y = random(-30000+50*z);
          badAsteroid[i].speed += 0.1;
        }
      }
      
      //grow
      if(grow()){
      }else{
        s ++;
        t += z;
        z ++;
      }
      
      //shrink
      if(shrink()){
      }else{
        s -= 10;
      }
      
      //gold
      if(gold()){
        if(gold.y > height){
          gold.y = 30000 + random(0, -20000);
          gold.x = random(width);
        }
      }else{
        frameRate(1);
        fill(255,255,0);
        textAlign(LEFT);
        text("BONUS",width/2,20);
        s += 5;
        t += t/2;
        gold.y = random(-50000);
        gold.x = random(width);
      }
      

      textSize(18);
      fill(255,255,0);
      text(t,0,20);
      textAlign(RIGHT);
      text(d, width, 20);
      textAlign(LEFT);
      
      //pause
    }else{
      fill(255,0,0);
      textSize(36);
      textAlign(CENTER);
      text("Paused", width/2, height/2);
    }
    end();
    
    // game over
    }else if(gameState == 2){
      s=0;
      textSize(24);
      fill(255,0,0);
      textAlign(CENTER);
      text("YOU LOSE", width/2, height/2 - 20);
      fill(255,255,0);
      text("Score: " + t, width/2, height/2 + 10);
      text("Distance: " + d, width/2, height/2 + 40);
  }
}
class Ast{
  float y;
  float x;
  float speed;
  Ast(float tempx, float tempy, float tempSpeed){
    x=tempx;
    y=tempy;
    speed=tempSpeed;
  }
  
  void display(){
    noStroke();
    ellipse(x,y,10,10);
  }
  
  void move(){
    y+=speed;
  }
}



class Bad{
  float y;
  float x;
  float speed;
  Bad(float tempx, float tempy, float tempSpeed){
    x=tempx;
    y=tempy;
    speed=tempSpeed;
  }
  
  void display(){
    fill(255,0,0);
    noStroke();
    ellipse(x,y,10,10);
  }
  
  void move(){
    y+=speed;
  }
}
boolean grow(){
  player();
  for(int i=0; i < n; i++){
    if(abs(height-asteroid[i].y) < 15){
     if(abs(p+s/2-asteroid[i].x)<s/2){
      return false;
     }
    }
  }
  return true;
}


boolean shrink(){
  player();
  for(int i=0; i < n; i++){
    if(abs(height-badAsteroid[i].y)<15){
      if(abs(p+s/2-badAsteroid[i].x)<s/2){
        return false;
      }
    }
  }
  return true;
}

boolean gold(){
  player();
  if(abs(height - gold.y) < 15){
    if( abs(p + s/2 - gold.x) < s/2){
      return false;
    }
  }
  return true;
}

//paused
void keyPressed(){
  if(key == ' ' && gameState == 1){
    paused = !paused;
  }
}

void end(){
  player();
  if(s<20){
    gameState = 2;
  }
}
void player(){
  if(!paused && gameState == 1){
  if(p+s < width){
    if (keyPressed && keyCode == RIGHT){
      p+=2;
      }
    }else{
      p+=0;
    }
    if(p>0){
      if(keyPressed && keyCode == LEFT){
        p-=2;
        }
    }else{
      p-=0;
    }
  fill(255);
  noStroke();
  rect(p, height - 20, s, 20);
  }
}


