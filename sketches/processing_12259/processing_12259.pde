
class Fly{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  //float maxvl;
  PVector newloc = new PVector(mouseX,mouseY);
    PVector distance;
    int counter=0;
    
    float osc = 0.0;
    float flap = 0.0;
    
    int vellimit=10;
  
  //constructor
  Fly(PVector _a, PVector _v, PVector _l, float _m){
    acc = _a.get();
    vel = _v.get();
    loc = _l.get();
    mass = _m;
    
  }

  void init(){
    update();
    display();
  }
  
  void init(PVector location){
    newloc.set(location); // update target location
    update();
    display();
  }
  
  void update(){
    
    if(counter%100 == 1)
    {
      newloc.set(random(10,width-10),random(10,height-10),0);
    }
    
    distance = PVector.sub(newloc, loc);
    
    distance.normalize();
    distance.div(mass);
    //distance.mult(width/10);
    //PVector diffY = PVector.sub(mouseY,f.loc.y,0);
    acc.set(distance);
    
    vel.add(acc);
    vel.limit(vellimit);
    loc.add(vel);
    
    if (loc.x < 0) {
      vel.x *= -0.1;
      loc.x = 0; 
    }
    else if (loc.x > width) {
      vel.x *= -0.1;
      loc.x = width; 
    }
    else if (loc.y < 0)
    {
      vel.y *= -0.1;
      loc.y = 0;
    }
     else if (loc.y > height)
    {
      vel.y *= -0.1;
      loc.y = height;
    }
   
    /*if((loc.x == 50) || (loc.x >= width))
      {
      vel.mult(-1.0);
      loc.x = width;
      }
    else if ((loc.y == 50) || (loc.y >= height))
      {
        acc.y *= -1;
      }*/
    //loc.x = constrain(loc.x,0,width);
    //loc.y = constrain(loc.y,0,height);
    
    //acc.mult(0);
    counter++;
  }
  void display(){
    //float r = 1.0;
    float theta = vel.heading2D() + radians(90);  //rotate to face target (straight line =0degrees,)
    rectMode(CORNER);
    fill(255,10);
    rect(0,0,width,height);//fadeout to white
    fill(175);
    //ellipse(loc.x, loc.y, 55, 55);
   pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    ellipse(0,0,13,24);
    pushMatrix();
    flap = map(cos(osc),-1,1,radians(75),radians(25));
    rotate(flap);
    ellipse(-4,5,-7,13);// L-wing
    popMatrix();
    
    pushMatrix();
    rotate(-flap);
    ellipse(4,5,7,13);// R-wing 
    
    popMatrix();
    
    //line(-20,0,-40,0);
    //line(0,0,20,0);
    //rect(0,0,15,15);
    /*beginShape(TRIANGLES);
    vertex(0, -10*2);
    vertex(-10, 10*2);
    vertex(10, 10*2);
    endShape();
    */stroke(0);
    //fill(175);
    popMatrix();
    
    float flapspeed = vel.mag() * vellimit / 2;
    
    osc += flapspeed;
  }
}


