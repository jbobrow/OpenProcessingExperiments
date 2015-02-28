
class Bullet {
  PVector pos;
  PVector v;
  float s;
  final int lifeTime;
  int startMillis;
  boolean isDied;
  float parent;
  
  Bullet(PVector posT, PVector vT, float parentT, float sT) {
    pos = new PVector(posT.x, posT.y, posT.z);
    v =   new PVector(vT.x, vT.y, vT.z);
    s   = sT;
    lifeTime = 2000;
    startMillis = millis();
    isDied = false;
    parent = parentT;
  }
  
  void show() {
    int[] c = {255,200,0};
    if(parent==0) {
      c[0]=0;
      c[1]=255;
      c[2]=0;
    }
    fill(c[0],c[1],c[2]);
    noStroke();
    sphereDetail(5);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(s);
    popMatrix();
    //println("v:"+v+" t:"+top+" n:"+n);
  }
  void update() {
//    PVector dv = new PVector( random(10)-5,random(10)-5,random(10)-5);
    pos.add(v);
    isDied = millis()-startMillis>lifeTime? true : false;
    
    //enemy killer!
    for (int li=enemies.size()-1; li>=0; li--) {
      Enemy enemy = (Enemy) enemies.get(li);
      float distance=dist(pos.x,pos.y,enemy.pos.x,enemy.pos.y);
      if(distance<enemy.s/2 && parent==0 && !isDied) {
        enemies.remove(li);
        player.score+=50;
        isDied = true;
      }
    }
    
    float distance=dist(pos.x,pos.y,player.pos.x,player.pos.y);
    if(distance<20 && parent!=0) {
        player.health-=10;
        player.hit = true;
        isDied = true;
        println(player.health);
    }
  }
}

