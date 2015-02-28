
class Boid
{
  //fields
  PVector pos,vel,acc,ali,coh,sep; //position, velocity, acceleration
  float neighborhoodRadius; //视野半径
  float maxSpeed = 4; //最大速度
  float maxSteerForce = .1; 
  float h; //hue
  float sc=3; //渲染因素
  float flap = 0;
  float t=0;
  boolean avoidWalls = false;
  
  Boid(PVector inPos)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector(random(-1,1),random(-1,1),random(1,-1));
    acc = new PVector(0,0,0);
    neighborhoodRadius = 100;
  }
  Boid(PVector inPos,PVector inVel,float r)
  {
    pos = new PVector();
    pos.set(inPos);
    vel = new PVector();
    vel.set(inVel);
    acc = new PVector(0,0);
    neighborhoodRadius = r;
  }
  
  //鸟群的运动
  void run(ArrayList bl,Predator eagle)
  {
    t+=.1;  //time
    flap = 10*sin(t);//翅膀
    //acc.add(steer(new PVector(mouseX,mouseY,300),true));
    //acc.add(new PVector(0,.05,0));
    if(avoidWalls)//不允许穿墙
    {
      acc.add(PVector.mult(avoid(new PVector(pos.x,height,pos.z),true),5));//acc+=离障碍物距离归一化*5，此例中障碍物是六个面；5或许是个经验值，过小则转向不灵，过大则浪费空间
      acc.add(PVector.mult(avoid(new PVector(pos.x,0,pos.z),true),5));
      acc.add(PVector.mult(avoid(new PVector(width,pos.y,pos.z),true),5));
      acc.add(PVector.mult(avoid(new PVector(0,pos.y,pos.z),true),5));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,300),true),5));
      acc.add(PVector.mult(avoid(new PVector(pos.x,pos.y,900),true),5));
    }
    flock(bl);//考虑列队行为
    escape(eagle);
    move();//速度变化和加速度重置
    checkBounds();//边界检查
    render();//实施
  }
  
  /////-----------行为--------------
  //群体行为
  void flock(ArrayList bl)
  {
    ali = alignment(bl);//校准速度为视野内同伴的平均速度
    coh = cohesion(bl);//聚合位置为视野内同伴的平均位置
    sep = seperation(bl);//分离程度
    acc.add(PVector.mult(ali,1));
    acc.add(PVector.mult(coh,3));
    acc.add(PVector.mult(sep,1));
  }
  
  void escape(Predator eagle)
  {
    PVector tmp=PVector.sub(pos,eagle.pos);
    float d=PVector.dist(eagle.pos,pos);
    if(d>0 && d<=neighborhoodRadius)
    {
      tmp.div(d);
      //acc.add(PVector.mult(new PVector(0,0,0),1));
      acc.add(PVector.mult(tmp,3));
    }  
}
  
  void scatter()
  {
    
  }
  ////------------------------------------
    
  //速度和加速度变化
  void move()
  {
    vel.add(acc); //加速度积分
    vel.limit(maxSpeed); //归一化
    pos.add(vel); //速度积分
    acc.mult(0); //重置加速度
  }
  
  //边界检查
  void checkBounds()
  {
    if(pos.x>width) pos.x=0;
    if(pos.x<0) pos.x=width;
    if(pos.y>height) pos.y=0;
    if(pos.y<0) pos.y=height;
    if(pos.z>900) pos.z=300;
    if(pos.z<300) pos.z=900;
  }
  
  //实施
  void render()
  {
    
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    rotateY(atan2(-vel.z,vel.x));
    rotateZ(asin(vel.y/vel.mag()));
    stroke(h);
    noFill();
    noStroke();
    //fill(255,0,0);
    fill(h);
    //draw bird
    beginShape(TRIANGLES);
    vertex(3*sc,0,0);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,-2*sc,0);
    
    vertex(3*sc,0,0);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,0,2*sc);
    
    vertex(3*sc,0,0);
    vertex(-3*sc,0,2*sc);
    vertex(-3*sc,-2*sc,0);
    
    /* wings */
    if(wing){
      vertex(2*sc,0,0);
      vertex(-1*sc,0,0);
      vertex(-1*sc,-8*sc,flap);
    
      vertex(2*sc,0,0);
      vertex(-1*sc,0,0);
      vertex(-1*sc,8*sc,flap);
    }
    
    vertex(-3*sc,0,2*sc);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,-2*sc,0);
    endShape();
    //box(10);
    popMatrix();
  }
  
  //steering.如果到达目标位置处理
  PVector steer(PVector target,boolean arrival)
  {
    PVector steer = new PVector(); //creates vector for steering
    if(!arrival)
    {
      steer.set(PVector.sub(target,pos)); //steering vector points towards target (switch target and pos for avoiding)
      steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    }
    else
    {
      PVector targetOffset = PVector.sub(target,pos);
      float distance=targetOffset.mag();
      float rampedSpeed = maxSpeed*(distance/100);
      float clippedSpeed = min(rampedSpeed,maxSpeed);
      PVector desiredVelocity = PVector.mult(targetOffset,(clippedSpeed/distance));
      steer.set(PVector.sub(desiredVelocity,vel));
    }
    return steer;
  }
  
  //避障：
  PVector avoid(PVector target,boolean weight)
  {
    PVector steer = new PVector(); //creates vector for steering
     steer.set(PVector.sub(pos,target)); //steering vector points away from target
    if(weight)
      steer.mult(1/sq(PVector.dist(pos,target))); //steer=(pos-target)/sqrt(dist(pos,target))
    //steer.limit(maxSteerForce); //limits the steering force to maxSteerForce
    return steer;
  }
  
  //分散原则：
  PVector seperation(ArrayList boids)
  {
    PVector posSum = new PVector(0,0,0);
    PVector repulse;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos,b.pos);
      if(d>0&&d<=neighborhoodRadius)
      {
        repulse = PVector.sub(pos,b.pos);
        repulse.normalize();  //归一化
        repulse.div(d);
        posSum.add(repulse);
      }
    }
    return posSum;
  }
  
  //对齐原则：计算视野内同伴平均速度，velSum=Σv/number
  PVector alignment(ArrayList boids)
  {
    PVector velSum = new PVector(0,0,0);
    int count = 0;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = PVector.dist(pos,b.pos);
      if(d>0&&d<=neighborhoodRadius)
      {
        velSum.add(b.vel);
        count++;
      }
    }
    if(count>0)
    {
      velSum.div((float)count);
      velSum.limit(maxSteerForce);
    }
    return velSum;
  }
  //聚合原则：计算视野内同伴的平均位置
  PVector cohesion(ArrayList boids)
  {
    PVector posSum = new PVector(0,0,0);
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for(int i=0;i<boids.size();i++)
    {
      Boid b = (Boid)boids.get(i);
      float d = dist(pos.x,pos.y,b.pos.x,b.pos.y);
      if(d>0&&d<=neighborhoodRadius)
      {
        posSum.add(b.pos);
        count++;
      }
    }
    if(count>0)
    {
      posSum.div((float)count);
    }
    steer = PVector.sub(posSum,pos);
    steer.limit(maxSteerForce); 
    return steer;//平均位置与现在位置的差
  }
}

