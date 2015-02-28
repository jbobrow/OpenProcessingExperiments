
import processing.opengl.*;

/* Represente une entit� dans la simulation
 * Chaque acteur poss�de une position et une vitesse
 */
class Actor
{  
  // Position, orientation, vitesse
  vec2 pos; 
  vec2 speed;
  
  //Constantes de d�placement
  float acceleration = 0.0010;
  float maxSpeed = 0.2;
  float frot = 0.98;
  
  Actor(){ this(new vec2(0,0)); }  
  Actor(vec2 pos){ this.pos = pos; speed = new vec2(0,0); }
  
  /* Incline la vitesse de l'acteur dans une direction.
   * relTarget est la cible vis�e, relativement � l'acteur.
   */
  void steer(vec2 relTarget, float dt)
  {
    vec2 accel = (vec2)relTarget.clone(); 
    accel.normalize();   
    accel.mult(acceleration);
    accel.mult(dt);    
    speed.add(accel);
    
    if(speed.norme()>maxSpeed)
    {
      speed.normalize();
      speed.mult(maxSpeed);
    }  
  }
  
  /* Deplace l'acteur selon sa vitesse actuelle */
  void move(float dt)
  {
    speed.mult(frot);
    vec2 delta = (vec2)speed.clone();
    delta.mult(dt);
    pos.add(delta);
  }
}

/* Les Zombies manges les Humains */
class Zombie extends Actor
{
  //Constantes de comportement
  int visionRadius = 150;
  int separationRadius = 25;
  int cohesionRadius = 80;
    
  Zombie(){ this(new vec2(0,0)); }  
  Zombie(vec2 pos){ this.pos = pos; }  
  
}

/* Les Humains fuient les Zombies */
class Human extends Actor
{
  //Constantes de comportement
  int visionRadius = 120;
  int separationRadius = 20;
  
  Human(){ this(new vec2(0,0)); }  
  Human(vec2 pos){ this.pos = pos; maxSpeed = 0.22;}  
}

