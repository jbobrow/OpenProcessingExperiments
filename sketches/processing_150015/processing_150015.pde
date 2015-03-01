
g = 9.81;        // m/s^2
delta_t = .1;    //time per cycle
n = 4;
ArrayList<Particle> pList = new ArrayList<Particle>();

void setup() {  //setup function called initially, only once
  size(700, 600);
  background(255);  //set background white
  colorMode(HSB);   
  for(int i = 0; i < n; i++){
      //xpos, ypos, mass
      pList.add(new Particle(random(width), random(height), random(50,100)))
  }
 // pList.add(new Particle(width/2, height/2, 1000));
}

void draw() {  //draw function loops 
    //background(255);
    for(int i = 0; i < n; i++){
        pList.get(i).update();
    }
    for(int i = 0; i < n; i++){
        pList.get(i).drawSelf();
    }
}


class Particle{
    float m;
    PVector f_r;
    PVector a;
    PVector v;
    PVector p;
    
    Particle(x,y,m_temp){
        m = m_temp;
        f_r = new PVector(0,0);
        a = new PVector(0,0);
        v = new PVector(0,0);
        p = new PVector(x,y);
    } 
    
    void update()
    {
        //get resultant force vector
        f_r = getForces();
        //update acceleration
        a = PVector.div(f_r,m);
        //update velocity
        PVector delta_v = PVector.mult(a,delta_t);
        v.add(delta_v);
        //update position
        PVector delta_p = PVector.mult(v,delta_t);
        p.add(delta_p);
        //loop around if needed
        if(p.x > width) p.x = 0;
        if(p.x < 0) p.x = width;
        if(p.y > height) p.y = 0;
        if(p.y < 0) p.y = height;
    }
    
    PVector getForces()
    {
        PVector f = new PVector(0,0);
        //the particles hate each other
        for(int i = 0; i < n; i++){
     
            //for each one get the displacement vector
            Particle particle = pList.get(i);
            if(p == particle) continue;
            
            d = PVector.dist(p, particle.p);
            
            force = 70;
            //force = (G * m * particle.m )/pow(d,2);
            //convert that to a force vec
            PVector r = PVector.sub(particle.p,p);
            r.div(d);
            PVector r = PVector.mult(r,force);
            //PVector r = new PVector(random(-100,100), random(-100,100));
            f.add(r);
        }
        //PVector f = new PVector(random(-100,100), random(-100,100));
        return f;
    }
    
    void drawSelf()
    {
        ellipse(p.x,p.y,10,10);
    }
}
