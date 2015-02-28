

// forza = massa * accelerazione
// accelerazione = forza/massa
// velocity = velocity + acceleration
// location = location + velocity

import noc.*; // importiamo Vector3D - http://www.shiffman.net/teaching/nature/

int MAX = 30; // max Balls
Ball[] z = new Ball[MAX];
Attractor att, att2;
    
void setup()
{
  size(800,500);
  smooth();
  for(int i=0; i<z.length; i++){
    Vector3D a = new Vector3D(0.0,0.0); 
    Vector3D v = new Vector3D(0.0,0.0);  
    Vector3D l = new Vector3D(random(width),random(height));
    z[i] = new Ball (l, v, a, 10);
    
  }
  att = new Attractor(new Vector3D(220,230),3,7.1);
  att2 = new Attractor(new Vector3D(580,230),3,7.1);
}
void draw()
{
  background(#000000);
  att.render();
  att2.render();
  for(int i=0; i < z.length; i++){
        for(int j = i+1; j < z.length; j++){
        float ball_dist = z[i].loc.distance(z[i].loc, z[j].loc);
        float dst = map(ball_dist, 0, sqrt((height*height)+(width*width)), 0, 100);
        if(dst < 10){
          z[j].drawConnections(z[i].loc.x, z[i].loc.y, z[j].loc.x, z[j].loc.y, dst);
         }
    }
  }
  
  for(int i=0; i<z.length; i++){

    z[i].go();    

    Vector3D mouseLoc = new Vector3D(mouseX,mouseY);
    
    Vector3D f = att.calcGravForce(z[i]);
    Vector3D f2 = att2.calcGravForce(z[i]);
    z[i].add_force(f);
    z[i].add_force(f2);
      

    if(mousePressed == true)
    {
//        Vector3D diff = Vector3D.sub(mouseLoc,z[i].getLoc());
//        diff.normalize();
//        float factor = 0.04; 
//        diff.mult(factor);
//        z[i].setAcc(diff);

    }
    else{
        float c = -0.003;
        Vector3D actualVel = z[i].getVel();
        Vector3D attrito = Vector3D.mult(actualVel,c);
        z[i].add_force(attrito);           
    }  
    
  }
}

class Ball {
  // campi istanza sono 3 vettori
  Vector3D loc;
  Vector3D vel;
  Vector3D acc;
  float r;
  
  // costruttore
  Ball (Vector3D l, Vector3D v, Vector3D a, float r_){
        this.loc = l;
        this.vel = v;
        this.acc = a;
        this.r = r_;
      }

  // go
  void go() {
    update();
    borders();
    render();
  }
  
  //metodi accessori
  Vector3D getVel() {
    return vel.copy();
  }

  Vector3D getAcc() {
    return acc.copy();
  }

  Vector3D getLoc() {
    return loc.copy();
  }


  float getRadius() {
    return r;
  }

  // metodi mutatori
  void setLoc(Vector3D v) {
    loc = v.copy();
  }

  void setVel(Vector3D v) {
    vel = v.copy();
  }

  void setAcc(Vector3D v) {
    acc = v.copy();
  }
  
  // update loc
  void update() {
    vel.add(acc);
    //vel.limit(8.0f);
    loc.add(vel);
    acc.setX(0.0f);
    acc.setY(0.0f);
  }
  
  // se raggiungi il bordo, rendi negativa la vel
  void borders() {
    if ((loc.x > width-getRadius()) || (loc.x < getRadius())) {
      vel.x *= -1;
    }       
    if ((loc.y > height-getRadius()) || (loc.y < getRadius())){
      vel.y *= -1;
    }
  }  
  
  // metodo per aggiungere un'altra forza (l'attrito, in questo caso)
  void add_force(Vector3D force) {
    // dividiamo l'attrito per il raggio della palla, per ottenere
    // una decelerazione plausibile in relazione alla massa (semplificato con raggio)
    // gli oggetti più grandi si fermano dopo
    force.div(r); 
    acc.add(force);
  } 
 
 // disegna le connessioni tra una Ball e l'altra
 void drawConnections(float x1, float y1, float x2, float y2, float dst)
 {  
   if(dst<2.0){
   stroke(#0372FF, 100);
   }
   else {
   stroke(#ffffff,50);
   }
   strokeWeight(1-(dst/10));
   line(x1,y1,x2,y2);
 }

  void render() {
    ellipseMode(CENTER);
    point(loc.x, loc.y);
  }
}

// Attractor class (Daniel Shiffman)
class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  Vector3D loc;  // Location

  Attractor(Vector3D l_,float m_, float g_) {
    loc = l_.copy();
    mass = m_;
    G = g_;
  }

  void go() {
    render();
  }

  Vector3D calcGravForce(Ball t) {
    Vector3D dir = Vector3D.sub(loc,t.getLoc());      // Calculate direction of force
    float d = dir.magnitude();                        // Distance between objects
    d = constrain(d,5.0f,25.0f);                      // Limiting the distance to eliminate "extreme" results for very close or very far objects
    dir.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float force = (G * mass * t.getRadius()) / (d * d); // Calculate gravitional force magnitude
    dir.mult(force);                                  // Get force vector --> magnitude * direction
    return dir;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(#0556FF);
    strokeWeight(5);
    point(loc.x,loc.y);
  }
}


