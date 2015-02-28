
import processing.opengl.*;
import toxi.math.noise.SimplexNoise;

class Particle{

  Vec3D position;
  Vec3D velocity;
  Vec3D acceleration;
  
  ArrayList subParticles;
  int numConnections;

  Particle (){
    position = new Vec3D();
    velocity =  new Vec3D();
    acceleration = new Vec3D();
    setup();
  }
  Particle(Vec3D position){
    this.position = position;
    velocity = new Vec3D();
    acceleration = new Vec3D();
    setup();
  }
  
  void setup(){
    subParticles = new ArrayList();
  }
  
  void update(float noiseAmt, float drag, float maxSpeed, Vec3D rotation){
    	
        acceleration.addSelf(
                         ((float)(SimplexNoise.noise(position.x,millis()))) * noiseAmt,
                         ((float)(SimplexNoise.noise(position.y,millis()))) * noiseAmt,
                         ((float)(SimplexNoise.noise(position.z,millis()))) * noiseAmt
                         );
        velocity.addSelf(acceleration);
        velocity.limit(maxSpeed);
        position.addSelf(velocity);
        velocity.scaleSelf(drag);
        acceleration.set(0,0,0);
        
        if(subParticles.size() < numConnections/8){
          addSubParticle();
        }
        else if (subParticles.size() > numConnections/8){
          removeSubParticle();
        }
        
        for(int i = 0 ; i < subParticles.size(); i++){
         ((SubParticle)subParticles.get(i)).update(noiseAmt, drag,maxSpeed, position, rotation);
        }

  }
  
  void addSubParticle(){
    subParticles.add(new SubParticle(position));
  }
  void removeSubParticle(){
    subParticles.remove(subParticles.size() - 1);
  }
}

class SubParticle{
  
    Vec3D position;
    Vec3D velocity;
    
    SubParticle(Vec3D position){
      	this.position = position.copy();
      	velocity = Vec3D.randomVector();
    }
    
    void update(float noiseAmt, float drag, float maxSpeed, Vec3D attractor, Vec3D rotation){
      	Vec3D dist = attractor.sub(position);
      	float force = dist.magSquared();
      	dist.normalize();

     	velocity.addSelf(dist.scaleSelf(force * 0.0001));
      	velocity.addSelf(
                         ((float)(SimplexNoise.noise(position.x,millis() * noiseAmt))) * noiseAmt,
                         ((float)(SimplexNoise.noise(position.y,millis() * noiseAmt))) * noiseAmt,
                         ((float)(SimplexNoise.noise(position.z,millis() * noiseAmt))) * noiseAmt
                         );

      	velocity.limit(maxSpeed);
      	position.addSelf(velocity);
      	velocity.scaleSelf(drag);
    }
}
  

