
//Particle Class
//Based on the processing.org particle but simplified by using the noc library
//instead of using the processing.org implementation of vectors.
//I took out the age feature as it wasn't needed in this case.
class cParticle
{
  Vector3D loc;
  Vector3D acc;
  Vector3D vel;
  float radius;
  

  cParticle(Vector3D _loc) {
      loc = _loc.copy();
      acc = new Vector3D(0, .1 , 0);
      vel = new Vector3D(random(-3.0, 3), random(-4, 0), 3);

      radius = random(10, 30);
     
   }
   
   cParticle(Vector3D _loc, float _xdir, float _radius) {
      loc = _loc.copy();
      acc = new Vector3D(0, 0.1, 0);
      vel = new Vector3D(_xdir, random(-4.0, 0), 0);

      radius = _radius;
     
   }

    void run() {
      update();
      render();
    }

   void update(){
      vel.add(acc);
      loc.add(vel);
     
   }
   
   void render() {
       ellipseMode(CENTER);
       stroke(255);
       fill(0);
       ellipse(loc.x, loc.y, radius, radius);
   }
   
   boolean dead() {
     if (radius <= 2.0) {
       return true;
     } else {
       return false;
     }
   }
    
}


