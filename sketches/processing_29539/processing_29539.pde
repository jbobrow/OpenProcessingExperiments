
class Vertice
{
  Vec3D origen;
  Vec3D pos;
  Vec3D vel;
  Vec3D acel;
  
  int r;
  int g;
  int b;
  int a;
  
  float sc;
  
  ArrayList points = new ArrayList();
  int sampleDistance = 10;
  
  Vertice (float x, float y, float z)
  {
    origen = new Vec3D(x, y, z);
    pos = new Vec3D(x, y, z);
    vel = new Vec3D(random(-0.5,0.5), random(-0.5,0.5), random(-0.5,0.5));
    acel = new Vec3D(0,0,0);
    
    r = int(random(70, 255));
    g = int(random(70, 255));
    b = int(random(70, 200));
    a = int(random(255));
    
    sc = random(100);
    
    //deformar();
  }
  
  void run()
  {
    //display();
    mover();
    flock();
    volver(10);
    splineDraw();
  }
  
  void volver(float magnitud)
  {
    if(pos.magnitude() > 300)
    {
      vel = pos.scale(-1);
    }
    
    Vec3D steer = new Vec3D();
    
    float distancia = pos.distanceTo(origen);
    
    if(distancia > 20)
    {
      Vec3D diff = pos.sub(origen);
      diff.normalizeTo(1.0/distancia);
      
      steer.addSelf(diff);
    }
    
    steer.scaleSelf(magnitud);
    acel.addSelf(steer);
  }
  
  void display()
  {
    strokeWeight(5);
    stroke(r, g, b, a);
    point(pos.x, pos.y, pos.z);
  }
  
  void deformar()
  {
    pos.normalize();
    pos.scaleSelf(sc);
  }
  
  void mover()
  {
    vel.addSelf(acel);
    vel.limit(2);
    
    pos.addSelf(vel);
    
    acel.clear();
  }
  
  void flock()
  {
    separar(5);
    cohesion(0.001);
    alinear(0.1);
  }
  
  void separar(float magnitud)
  {
    Vec3D steer = new Vec3D();
    int count = 0;
    
    for(int i = 0; i < vert.length; i++)
    {
      Vertice otro = (Vertice) vert[i];
      //Vec3D otro = new Vec3D(vert[i].pos);
      
      float distancia = pos.distanceTo(otro.pos);
      
      if(distancia > 0 && distancia < 50)
      {
        Vec3D diff = pos.sub(otro.pos);
        diff.normalizeTo(1.0/distancia);
        
        steer.addSelf(diff);
        count++;
      }
    }
    
    if(count > 0)
    {
      steer.scaleSelf(1.0/count);
    }
    
    steer.scaleSelf(magnitud);
    acel.addSelf(steer);
  }
  
  void cohesion(float magnitud)
  {
    Vec3D sum = new Vec3D();
    int count = 0;
    
    for(int i = 0; i < vert.length; i++)
    {
      Vertice otro = (Vertice) vert[i];
      
      float distancia = pos.distanceTo(otro.pos);
      
      if(distancia > 0 && distancia < 60)
      {
        sum.addSelf(otro.pos);
        count++;
      }
    }
    
    if(count > 0)
    {
      sum.scaleSelf(1.0/count);
    }
    
    Vec3D steer = sum.sub(pos);
    
    steer.scaleSelf(magnitud);
    
    acel.addSelf(steer);
  }
  
  void alinear(float magnitud)
  {
    Vec3D steer = new Vec3D();
    int count = 0;
    
    for(int i = 0; i < vert.length; i++)
    {
      Vertice otro = (Vertice) vert[i];
      
      float distancia = pos.distanceTo(otro.pos);
      
      if( distancia > 0 && distancia < 40)
      {
        steer.addSelf(otro.vel);
        count++;
      }
    }
    
    if(count > 0)
    {
      steer.scaleSelf(1.0/count);
    }
    
    steer.scaleSelf(magnitud);
    
    acel.addSelf(steer);
  }
  
  void splineDraw()
  {
    int numP = points.size();
    Vec3D currP = new Vec3D(pos);
    if(numP > 0)
    {
      Vec3D prevP = (Vec3D) points.get(numP-1);
      if(currP.distanceTo(prevP) > sampleDistance)
      {
        points.add(currP);
      }
    }
    else
    {
      points.add(currP);
    }
    
    numP = points.size();
    
    Vec3D[] handles = new Vec3D[numP];
    for(int i = 0; i < numP; i++)
    {
      Vec3D p = (Vec3D) points.get(i);
      handles[i] = p;
    }
    
    if(numP > 3)
    {
      Spline3D spline = new Spline3D(handles);
      java.util.List vertices = spline.computeVertices(3);
      
      //noFill();
      fill(r, g, b, a);
      stroke(r, g, b, a);
      strokeWeight(1);
      
      beginShape();
      for(Iterator i = vertices.iterator(); i.hasNext();)
      {
        Vec3D v = (Vec3D) i.next();
        vertex(v.x, v.y, v.z);
      }
      endShape();
    }
    
    if(numP > 10)
    {
      //hacer que se vayan borrando los puntos mas antiguos
    }
  }
}

