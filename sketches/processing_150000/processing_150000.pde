
g = 9.81;        // m/s^2
delta_t = .5;    //time per cycle
n = 50;
ArrayList<Particle> pList = new ArrayList<Particle>();

void setup() {  //setup function called initially, only once
  size(700, 600);
  background(255);  //set background white
  for(int i = 0; i < n; i++){
      //xpos, ypos, mass, radius
      pList.add(new Particle(width/2+random(-50,50), 80+ random(-5,5), random(50,100), random(20,40)));
  }
}

void draw() {  //draw function loops 
    background(255);
    for(int i = 0; i < n; i++){
        pList.get(i).update();
    }
    for(int i = 0; i < n; i++){
        pList.get(i).drawSelf();
    }
}


class Particle{
    int polarity;
    color c;
    float m;
    float radius;
    float elasticity;
    PVector f_r;
    PVector a;
    PVector v;
    PVector p;
    
    Particle(x,y,m_temp, rad_temp){
        radius = rad_temp;
        m = m_temp;
        f_r = new PVector(0,0);
        a = new PVector(0,0);
        v = new PVector(0,0);
        p = new PVector(x,y);
        polarity = int(random(-100,100));
        if(polarity > 0){
                polarity = 1;
                c = color(0,255,0);
        }
        else{
           polarity = -1;
           c = color(255,0,0);
        }
        elasticity = .9;
    } 
    
    void update()
    {
        //TODO: Add particle on particle collision reaction
        
        hitWall = false;
        //application of conservation of momentum
        if(p.x >= width - radius || p.x <= radius){ v.x = -v.x, hitWall = true};
        if(p.y >= height - radius || p.y <= radius){ v.y = -v.y, hitWall = true};
        
        
        if(hitWall == false){
            //get resultant force vector
            f_r = getForces();
            //update acceleration
            a = PVector.div(f_r,m);
              
            //update velocity
            PVector delta_v = PVector.mult(a,delta_t);
            v.add(delta_v);
            
        }
       
        //update position
        PVector delta_p = PVector.mult(v,delta_t);
        p.add(delta_p);
        if(hitWall)
            v.mult(elasticity);
    }
    
    PVector getForces()
    {
        PVector f = new PVector(0,0);
       
        //interaction
        f.add(getInteractionForces());
       
        //gravity
        f.add(0,m*g);
        return f;
    }
    
    PVector getInteractionForces()
    {
        PVector f = new PVector(0,0);
        //the particles hate each other
        for(int i = 0; i < n; i++){
     
            //for each one get the displacement vector
            Particle particle = pList.get(i);
            if(p == particle) continue;
            d = PVector.dist(p, particle.p);
            
            K = .005;
            force = K * polarity * particle.polarity * m * particle.m;
            //convert that to a force vec
            PVector r = PVector.sub(p,particle.p);
            r.div(pow(d,2));
            PVector r = PVector.mult(r,force);
            //PVector r = new PVector(random(-100,100), random(-100,100));
            f.add(r);
        }
        //PVector f = new PVector(random(-100,100), random(-100,100));
        return f;
    }
    
    void drawSelf()
    {
        fill(c);
        ellipse(p.x,p.y,radius,radius);
        fill(255);
    }
}
