
AccelerometerManager accel;
Thing thing1;
float ax, ay, az;
ArrayList b = new ArrayList();
ArrayList el = new ArrayList();
int score = 0;
int max = 100;
int counter = max;
float scale;
boolean paused;
boolean dead;
PFont font;

void setup() {
  println(PFont.list());
  background(0);
  accel = new AccelerometerManager(this);
  orientation(LANDSCAPE);
  thing1 = new Thing(width/2, height/2, accel);
  //noLoop();
  scale = (float)height/480;
  paused = false;
  dead = false;
  font = createFont("SansSerif", 20*scale);
  textFont(font);
  
}


void draw() {
  if((int)thing1.getHealth()>0&&!paused){ 
    background(0);
  
    thing1.move(ax, -ay);
    thing1.display();
  
    if(counter>max){
      el.add(new Enemy(random(0, width), random (0, height)));
      counter = 0;
      //max -= .5;
      max = max((50000-score)/500, 15);
    }
  
    for(int i = 0; i < el.size(); i++){
      Enemy e = (Enemy)el.get(i);
      e.move(thing1);
      for(int j = 0; j < b.size(); j++){
        Bomb bu = (Bomb)b.get(j);
        if(e.hit(bu)){
          el.remove(i);
          score+=125;
          i--;
        }
        
      }
      if(thing1.hit(e)){
        el.remove(i);
        i--; 
      }
      e.display();
    }
    
    
    for(int i = 0; i < b.size(); i++){
      Bomb bo = (Bomb)b.get(i);
      if(!bo.display()){
        b.remove(i);
        i--;
      }else{
        thing1.hit(bo);
      }
    }
    
    score++;
    counter++;
    score = max(score, 0); 
    fill(255);
    textAlign(CENTER);
    text("Score: "  + (int)score, width*3/4, 40*scale);
    text("Health: "  + (int)thing1.getHealth(), width/4, 40*scale);
   
    noStroke();
    rectMode(CORNER);
    fill(255-(int)thing1.getHealth()*255/100, (int)thing1.getHealth()*255/100, 0);
    rect(width/2 -scale*width/12, 20*scale,(int)thing1.getHealth()*scale*width/600, 20*scale);
    
    noFill();
    stroke(255);

    rect(width/2 -scale*width/12, 20*scale, scale*width/6, 20*scale);
    
    noStroke();
    fill(128);
    
    ellipse(width-40*scale, 40*scale, 60*scale, 60*scale);
    rectMode(CENTER);
    fill(255);
    rect(width-40*scale, 40*scale, 30*scale, 30*scale);
    fill(128);
    rect(width-40*scale, 40*scale, 10*scale, 34*scale);
    
  }else if(paused){
    textFont(font, 60);
    fill(255);
    text("PAUSED", width/2, height/2);
    textFont(font);
    fill(128);
    noStroke();
    ellipse(width-40*scale, 40*scale, 60*scale, 60*scale);
    fill(255);
    triangle(width-50*scale, 25*scale, width-50*scale, 55*scale, width-23*scale, 40*scale);
  }else {
    dead = true;
    textFont(font, 60);
    fill(255);
    text("YOU LOSE", width/2, height/2);
    textFont(font);
    fill(128);
    noStroke();
    ellipse(width-40*scale, 40*scale, 60*scale, 60*scale);
    fill(255);
    triangle(width-50*scale, 25*scale, width-50*scale, 55*scale, width-23*scale, 40*scale);
  }
}


void mousePressed(){
  if(sqrt((mouseX-width+40*scale)*(mouseX-width+40*scale)+(mouseY-40*scale)*(mouseY-40*scale))<30*scale){
    if(dead){
      thing1 = new Thing(width/2, height/2, accel);
      dead = false;
      paused = false;
      b.clear();
      el.clear();
      score = 0;
      max = 100;
    } else
      paused = !paused;
  }else{
    b.add(thing1.shoot());
    score-=50;
  }
}


public void resume() {
  if (accel != null) {
    accel.resume();
  }
}

    
public void pause() {
  if (accel != null) {
    accel.pause();
  }
}


public void shakeEvent(float force) {
  println("shake : " + force);
}


public void accelerationEvent(float x, float y, float z) {
//  println("acceleration: " + x + ", " + y + ", " + z);
  ax = x;
  ay = y;
  az = z;
  //redraw();
}



class Thing{
  AccelerometerManager accel;
  int s = 30;
  float x;
  float y;
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  float vx;
  float vy;
  float a = .5;
  float z;
  float f = .1;
  float m;
  //float size = 20*scale;
  boolean c = false;
  float health = 100;
  
  
  
  Thing(int xp, int yp, AccelerometerManager acc){
    accel = acc;
    x = xp;
    y = yp;
    vx = 0;
    vy = 0;
    z = PI/2;
    x1 = x - 50*cos(z)*scale;
    y1 = y - 50*sin(z)*scale;
    x2 = x - 20*cos(z+.75)*scale;
    y2 = y - 20*sin(z+.75)*scale;
    x3 = x - 20*cos(z-.75)*scale;
    y3 = y - 20*sin(z-.75)*scale;
    
  }
  
  
  void move(float ay, float  ax){    
    vx = -3*ax*scale;
    vy = 3*ay*scale;
    x += vx;
    y += vy;
    
    
    z = atan2(vy, vx);
    
    
    x1 = x + 20*cos(z)*scale;
    y1 = y + 20*sin(z)*scale;
    x2 = x - 20*cos(z+.75)*scale;
    y2 = y - 20*sin(z+.75)*scale;
    x3 = x - 20*cos(z-.75)*scale;
    y3 = y - 20*sin(z-.75)*scale;
    
    if(x1 < 0 || x2 < 0 || x3 < 0){
      m = min(x1, min(x2, x3));
      x1-=m;
      x2-=m;
      x3-=m;
      x-=m;
      //z = PI - z;
    } else if(x1 > width || x2 > width || x3 > width){
      m = max(x1, max(x2, x3))-width;
      x1-=m;
      x2-=m;
      x3-=m;
      x-=m;
      //z = PI - z;
    }
    
    if(y1 < 0 || y2 < 0 || y3 < 0){
      m = min(y1, min(y2, y3));
      y1-=m;
      y2-=m;
      y3-=m;
      y-=m;
    } else if(y1 > height || y2 > height || y3 > height){
      m = max(y1, max(y2, y3))-height;
      y1-=m;
      y2-=m;
      y3-=m;
      y-=m;
    }
    health+=.003;
  }
  
  void display(){
    noFill();
    stroke(0, 255, 0);
    triangle(x1, y1, x2, y2, x3, y3);
    //ellipse(x, y, size, size);
  }
  Bomb shoot(){
      return new Bomb(x, y);
  }
  
  float getHealth(){
    health = constrain(health, 0, 100);
    return health;
  }
  
   float getX(){
     return x;
   }
   
   float getY(){
     return y;
   }
   float r2;
   boolean hit(Bomb b){
     r2 = sqrt((b.getY()-y)*(b.getY()-y) + (b.getX()-x)*(b.getX()-x));
     if (r2<(35*scale+b.getSize())/2 && b.exploding() && b.getHit()){
       health-=5;
       score-=50;
       b.hit();
       return true;
     }
     return false;
   }  
   
   boolean hit(Enemy b){
     r2 = sqrt((b.getY()-y)*(b.getY()-y) + (b.getX()-x)*(b.getX()-x));
     if (r2<(35*scale+b.getSize())/2 && b.ready()){
       health-=5;
       score-=50;
       return true;
     }
     return false;
   }
}



class Enemy{
   float x;
   float y;
   float vx;
   float vy;
   float ax;
   float v=3;
   float c = 1;
   
   Enemy(float xp, float yp){
     x = xp;
     y = yp;
   }
   
   float r;
   
   void move(Thing t){
     if (c >= 20){
       r = atan2(t.getY()-y, t.getX()-x);
       vy = v*sin(r)*scale;
       vx = v*cos(r)*scale;
       x+=vx;
       y+=vy;
     } else
       c+=.5;
   }
   
   void display(){
     noFill();
     stroke(255, 0, 0);
     ellipse(x, y, c*scale, c*scale);
   }
   float r2;
   boolean hit(Bomb b){
    r2 = sqrt((b.getY()-y)*(b.getY()-y) + (b.getX()-x)*(b.getX()-x));
    if (r2<(c*scale+b.getSize())/2 && b.exploding())
      return true;
      
  return false;
  }  
  
   boolean ready(){
    return c>=20;
  }
  float getY(){
    return y;
  }
  float getX(){
    return  x;
  }
  float getSize(){
    return c*scale;
  }

}


class Bomb{
  float x;
  float y;
  int time = 50;
  int c = 15;
  boolean hit = false;
  
  
   Bomb(float xp, float yp){
     x = xp;
     y = yp;
   }
   
  boolean display(){
    stroke(255, 230-(c*128/150), 0);
    ellipse(x, y, c*scale, c*scale);
    if(time > 0){
      time--;
    } else{
      c+=max(6, (150-c)/5);
    }
    if(c < 150)
      return true;
    return false;
  }
  
  
  
  boolean exploding(){
    return time <=0;
  }
  
  
  float getSize(){
    return c*scale;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void hit(){
    hit = true;
  }

  boolean getHit(){
    return !hit;
  }
  
}

  





