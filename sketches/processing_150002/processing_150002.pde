
textPosX = width/2;
textPosY = height/2;
textS = 26;
textSpace = 26/2;
g = 9.81;        // m/s^2
delta_t = .5;    //time per cycle
n = 50;
ArrayList<Letter> lList;



void setup() { 
  size(700, 600);
  background(0); 
  fill(255);
  textSize(textS);
  lList = new ArrayList<Letter>();
  String s = "Type something!";
  for(int i = 0; i < s.length(); i++){
      textPosX += textSpace;
      lList.add(new Letter(str(s.charAt(i))));
  }
}

void keyPressed(){
    textPosX += textSpace;
    if(textPosX > width){
        textPosX = 0;
        textPosY += textS;
    }

    //add key to list of letters
    lList.add(new Letter(key));
}


void draw() {  //draw function loops 
    background(0);
    for(int i = 0; i < lList.size(); i++){
        lList.get(i).update();
    }
    for(int i = 0; i < lList.size(); i++){
        lList.get(i).drawSelf();
    }
}

//================================================================================================
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
        for(int i = 0; i < lList.size(); i++){
     
            //for each one get the displacement vector
            Particle particle = lList.get(i);
            if(p == particle) continue;
            d = PVector.dist(p, particle.p);
            
            K = .00005;
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

//======================================================================================
class Letter extends Particle {
    String ch;
    int startFallTime;
    int timeAlive;
    
    Letter(temp_ch){
        ch = temp_ch;
        startFallTime = random(1000,5000);
        super(textPosX,textPosY,random(70,100),10);  
    }
    void update()
    {
        float wiggleFactor = .0005;
        timeAlive++;
        if(timeAlive > startFallTime){
            super.update();
        } else{
            p.x += random(-1*timeAlive * wiggleFactor,timeAlive * wiggleFactor);
            p.y += random(-1*timeAlive * wiggleFactor,timeAlive * wiggleFactor);
        }
    }
    
    void drawSelf()
    {
        text(ch, p.x, p.y);
    }
}
