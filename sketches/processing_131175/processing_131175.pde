
import java.util.Iterator;

PVector location;
PVector velocity;
PVector acceleration;
//boolean MOUSECLICK;

ParticleSystem Ps;


void setup() {
  size(400, 400, P3D);
  background(0);
  smooth();

  Ps = new ParticleSystem();
}


void draw() {
 //js模式的时候不能用有透明度的背景                              
//  fill(0, 60);
//  rect(0, 0, width, height);
background(0);

//  if (MOUSECLICK) {
    Ps.addParticles();
    Ps.run();
//  }
}

//void mouseMoved() {
//    Ps.addParticles();
//    Ps.run();
//}

class Particle {
  PVector loc;//当前位移
  PVector vel;//当前速度
  PVector acc;//加速度
  float LifeSpan;

  Particle(PVector temp_loc, PVector temp_vel, PVector temp_acc) {
    loc = temp_loc;
    vel = temp_vel;
    acc = temp_acc;
    LifeSpan = 255;
  }

  void run() {
//    applyForce();
    update();
    display();
  }


//  void applyForce() {
//    vel.add(new PVector(0.05, 0));
//  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    LifeSpan -=5;
  }


  void display() {
    noStroke();
    fill(#00B9FF,LifeSpan);
    ellipse(loc.x, loc.y, 5, 5);
  }




  boolean isDead() {
    if (LifeSpan<0 ) {
      return true;
    }
    else {
      return false;
    }
  }
}

class ParticleSystem {
  ArrayList<Particle> myRain;


  ParticleSystem() {
    myRain = new ArrayList<Particle>();
  }

  void addParticles() {
    //---------------初始化ArrayList----------------------------------//
    location = new PVector(mouseX,mouseY);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, random(0.1, 0));
    //JAVA文档:".add(Object o)  Appends the specified element to the end of this list. "
    //附加指定的元素到列表的末尾一个
    //而目前没有指定ArrayList的大小（即其中的元素数量）
    //因此随着draw次数的增加每draw一次就增加一个Particle进去即使得后面的myRain.size()增加
    //详见JAVA文档：http://docs.oracle.com/javame/config/cdc/ref-impl/pbp1.1.2/jsr217/java/util/ArrayList.html
    myRain.add(new Particle(location, velocity, acceleration));
    //---------------初始化ArrayList----------------------------------//
  }

  void run() {
    //ArrayList的一个Method是.iterator();即返回一个“遍历器”（迭代器）
    //用它可以历遍数组内每一个元素，而不会因为元素的增减而跳过或者重复遍历某一个元素因为
    //声明一个叫it的遍历器，并赋予把myRian里的Particle整个赋给它
    Iterator<Particle> it = myRain.iterator();
    //关于iterator的Methord如".hasNext() "等 
    //详见:http://docs.oracle.com/javame/config/cdc/ref-impl/pbp1.1.2/jsr217/java/util/Iterator.html
    while (it.hasNext ()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) { 
        it.remove();
      }
    }
  }
  
  
}



