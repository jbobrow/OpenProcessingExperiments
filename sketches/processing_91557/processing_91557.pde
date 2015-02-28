
int w = 1000;
int h = 800;
int weapon = 1;
Thing thing1;
Enemy e;
int counter = 100;
int max = 100;
ArrayList el = new ArrayList();
ArrayList b = new ArrayList();
float score = 0;

void setup(){
  size(1000, 800);
  thing1 = new Thing(w/2, w/2);
  //noCursor();
  e = new Enemy(200, 200);
  
  noFill();
}

void draw(){
  
  if((int)thing1.getHealth()>0){ 
  background(0);
  
  noFill();
  thing1.move();
  thing1.display();
  
  
  if(counter>max){
    el.add(new Enemy(random(0, width), random (0, height)));
    counter = 0;
    //max -= .5;
    max = (int)max((50000-score)/500, 20);
  }
  
  for(int i = 0; i < el.size(); i++){
    Enemy e = (Enemy)el.get(i);
    e.move(thing1);
    for(int j = 0; j < b.size(); j++){
      Bomb bu = (Bomb)b.get(j);
      if(e.hit(bu)){
        el.remove(i);
        score+=100;
        i--;
        break;
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
  
  counter++;
  score+=.25;
  score = max(score, 0);
  
  textAlign(CENTER);
  text("Score: "  + (int)score, width*3/4, 30);
  text("Health: "  + (int)thing1.getHealth(), width/4, 30);
  
  /*
  stroke(255, 0, 0);
  //noFill();
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX, mouseY-10, mouseX, mouseY+10);
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  //fill(0);
  //text("Health: "  + (int)thing1.getHealth(), 800, 30);
  //text("Bombs: "  + (int)thing1.getBombs(), 800, 50);
  */
  }
  
  
  
}


void keyPressed(){
  if (key == CODED) {
    if(keyCode == UP)
      thing1.keyP(1);
    else if(keyCode == DOWN)
      thing1.keyP(2);
    else if(keyCode == LEFT)
      thing1.keyP(3);
    else if(keyCode == RIGHT)
      thing1.keyP(4);
    } 
  if(key == ' '){
    b.add(thing1.shoot());
    score-=50;
  }
  /*
  else if(key == '1')
    weapon = 1;
  else if(key == '2')
    weapon = 2;
  else if(key == '3')
    weapon = 3;
  else if(key == '4')
    weapon = 4;*/
}

void keyReleased(){
  if (key == CODED) {
    if(keyCode == UP)
      thing1.keyR(1);
    else if(keyCode == DOWN)
      thing1.keyR(2);
    else if(keyCode == LEFT)
      thing1.keyR(3);
    else if(keyCode == RIGHT)
      thing1.keyR(4);
  }
}

void mousePressed(){
    b.add(thing1.shoot());
    score-=50;
}
    
    
    
class Thing{
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
  float ax;
  float ay;
  float a = .5;
  boolean u;
  boolean d;
  boolean l;
  boolean r;
  float z;
  float f = .2;
  float m;
  boolean c = false;
  float health = 100;
  int bombs = 3;
  
  
  
  
  Thing(int xp, int yp){
    x = xp;
    y = yp;
    vx = 0;
    vy = 0;
    ax = 0;
    ay = 0;
    z = PI/2;
    x1 = x - 50*cos(z);
    y1 = y - 50*sin(z);
    x2 = x - 20*cos(z+.75);
    y2 = y - 20*sin(z+.75);
    x3 = x - 20*cos(z-.75);
    y3 = y - 20*sin(z-.75);
    
  }
  
  
  void move(){
    if(!(l || r)){
      if (vx>.02){
        ax=-f*cos(atan2(vy, vx));
      } else if(vx < -.02){
        ax= f*cos(atan2(vy, -vx));
      } else {
        ax = 0;
        vx = 0;
      }
    }
    if(!(u || d)){
      if (vy>.02){
        ay=-f*sin(atan2(vy, -vx));
      } else if(vy < -.02){
        ay= f*sin(atan2(-vy, vx));
      } else {
        ay = 0;
        vy = 0;
      }
    }
    if (u || d || r || l)
      z = atan2(vy, vx);
      // z = atan2(mouseY-y, mouseX-x);
      
    
    vx += ax;
    vy += ay;
    vx = min(12, max(vx, -12));
    vy = min(12, max(vy, -12));
    x += vx;
    y += vy;
    
    
    
    
    x1 = x + 20*cos(z);
    y1 = y + 20*sin(z);
    x2 = x - 20*cos(z+.75);
    y2 = y - 20*sin(z+.75);
    x3 = x - 20*cos(z-.75);
    y3 = y - 20*sin(z-.75);
    if(x1 < 0 || x2 < 0 || x3 < 0){
      m = min(x1, min(x2, x3));
      x-=m;
      x1-=m;
      x2-=m;
      x3-=m;
      vx = 0;
      //z = PI - z;
    } else if(x1 > w || x2 > w || x3 > w){
      m = max(x1, max(x2, x3))-w;
      x-=m;
      x1-=m;
      x2-=m;
      x3-=m;
      vx = 0;
      //z = PI - z;
    }
    
    if(y1 < 0 || y2 < 0 || y3 < 0){
      
      m = min(y1, min(y2, y3));
      y-=m;
      y1-=m;
      y2-=m;
      y3-=m;
      vy = 0;
      println(m);
    } else if(y1 > h || y2 > h || y3 > h){
      m = max(y1, max(y2, y3))-h;
      y-=m;
      y1-=m;
      y2-=m;
      y3-=m;
      vy = 0;
    }
    health+=.003;
  }
  
  void display(){
    stroke(0, 255, 0);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  void keyP(int q){
    if(q == 1){
      ay = 0-a;
      u = true;
    } else if (q == 2){
      ay = a;
      d = true;
    } else if (q == 3){
      ax = 0-a;
      l = true;
    } else if (q == 4){
      ax = a;
      r = true;
    }
  }
  
  void keyR(int q){
    if(q == 1){
      if(d) ay = a;
      else ay = 0;
      u = false;
    } else if (q == 2){
      if(u) ay = 0-a;
      else ay = 0;
      d = false;
    } else if (q == 3){
      if(r) ax = a;
      else ax = 0;
      l = false;
    } else if (q == 4){
      if(l) ax = 0-a;
      else ax = 0;
      r = false;
    }
  }  
  
  Bomb shoot(){
      return new Bomb(x, y);
  }
  
  float getHealth(){
    health = constrain(health, 0, 100);
    return health;
  }
  
  int getBombs(){
    return bombs;   
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
     if (r2<(35+b.getSize())/2 && b.exploding() && b.getHit()){
       health-=5;
       score-=50;
       b.hit();
       return true;
     }
     return false;
   }  
   
   boolean hit(Enemy b){
     r2 = sqrt((b.getY()-y)*(b.getY()-y) + (b.getX()-x)*(b.getX()-x));
     if (r2<(35+b.getSize())/2 && b.ready()){
       health-=5;
       score-=50;
       return true;
     }
     return false;
   }  
  
  
}





class Bullet{
   float x;
   float y;
   float vx;
   float vy;
   float v=15;
   
   Bullet(float xp, float yp, float r){
     x = xp;
     y = yp;
     vx = v*cos(r);
     vy = v*sin(r);
   }
   
   void display(){
     //stroke(255, 255, 0);
     x+=vx;
     y+=vy;
     ellipse(x, y, 5, 5);
   }
   
   float getX(){
     return x;
   }
   
   float getY(){
     return y;
   }

}



class Enemy{
  float x;
  float y;
  int health = 100;
  float vx;
  float vy;
  float v = 3;
  float r;
  float c = 1;
  
  Enemy(float xp, float yp){
    x = xp;
    y = yp;
  }
  
  void move(Thing thing){
    if (c >= 20){
      r = atan2(thing.getY()-y, thing.getX()-x);
      vx = v*cos(r);
      vy = v*sin(r);
      x+=vx;
      y+=vy;
    } else
      c+=.5;
    
  }
  
  void display(){
    stroke(255, 0, 0);
    ellipse(x, y, c, c);
  }
  
  float r2;
  
  
  boolean hit(Bomb b){
    r2 = sqrt((b.getY()-y)*(b.getY()-y) + (b.getX()-x)*(b.getX()-x));
    if (r2<(c+b.getSize())/2 && b.exploding())
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
    return c;
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
    stroke(255, 230-(c*128/200), 0);
    ellipse(x, y, c, c);
    if(time > 0){
      time--;
    } else{
      c+=max(6, (200-c)/7);
    }
    if(c < 200)
      return true;
    return false;
  }
  
  
  
  boolean exploding(){
    return time <=0;
  }
  
  
  int getSize(){
    return c;
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

  
  
  
  
  
  
  
  



