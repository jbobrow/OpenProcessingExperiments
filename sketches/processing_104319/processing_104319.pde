
/**
 * StarBang 
 * 
 * Developed by Umer Fraz 
 */

import java.util.*;
import ddf.minim.*;


ArrayList my_fireworks = new ArrayList();
int toggle=0;
boolean pause = false;

public static Minim minim;


void setup() {
  minim = new Minim(this);
  size(640, 360);
  //noStroke();
}

void draw() {
  if (pause)
    return;
  background(0);
  Firework my_firework=null;
  for (int i=my_fireworks.size()-1; i>=0; i-- ) {
    if (my_fireworks.get(i) instanceof SkyDiver_Firework) 
      my_firework  = (SkyDiver_Firework) my_fireworks.get(i);
    else if (my_fireworks.get(i) instanceof DoubleDipper_Firework) 
      my_firework = (DoubleDipper_Firework) my_fireworks.get(i);
    else if (my_fireworks.get(i) instanceof Twirler_Firework) 
      my_firework = (Twirler_Firework) my_fireworks.get(i);
    else if (my_fireworks.get(i) instanceof NestedGlobe_Firework) 
      my_firework = (NestedGlobe_Firework) my_fireworks.get(i);
    else if (my_fireworks.get(i) instanceof Twister_Firework) 
      my_firework = (Twister_Firework) my_fireworks.get(i);
    else if (my_fireworks.get(i) instanceof Sprawler_Firework) 
      my_firework = (Sprawler_Firework) my_fireworks.get(i);

    if (my_firework.isFinished()) {
      my_firework = null;
      my_fireworks.remove(i);
    }
    else {
      my_firework.display();
      my_firework.update();
    }
  }
  addFrame("StarBang-####.png");
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    pause = !pause;
    return;
  }
  PVector position = new PVector(mouseX, height-1);
  Firework my_firework=null;
  toggle = (int)random(12);
  //toggle = 2;
  if (toggle==0 && !fireworkExists(SkyDiver_Firework.class)) 
    my_firework = new SkyDiver_Firework(position, true, random(1, 2), true);
  else if (toggle==1 && !fireworkExists(SkyDiver_Firework.class)) 
    my_firework = new SkyDiver_Firework(position, true, random(1, 2), false);
  else if (toggle==2 && !fireworkExists(DoubleDipper_Firework.class)) 
    my_firework = new DoubleDipper_Firework(position, true, random(1, 3), true);
  else if (toggle==3 && !fireworkExists(DoubleDipper_Firework.class)) 
    my_firework = new DoubleDipper_Firework(position, true, random(1, 2), false);
  else if (toggle==4 && !fireworkExists(Twirler_Firework.class)) 
    my_firework = new Twirler_Firework(position, true, random(1, 2), true);
  else if (toggle==5 && !fireworkExists(Twirler_Firework.class)) 
    my_firework = new Twirler_Firework(position, true, random(1, 2), false);
  else if (toggle==6 && !fireworkExists(NestedGlobe_Firework.class)) 
    my_firework = new NestedGlobe_Firework(position, true, random(1, 2), true);
  else if (toggle==7 && !fireworkExists(NestedGlobe_Firework.class)) 
    my_firework = new NestedGlobe_Firework(position, true, random(1, 2), false);
  else if (toggle==8 && !fireworkExists(Twister_Firework.class)) 
    my_firework = new Twister_Firework(position, true, random(1, 2), true);
  else if (toggle==9 && !fireworkExists(Twister_Firework.class)) 
    my_firework = new Twister_Firework(position, true, random(1, 2), false);
  else if (toggle==10 && !fireworkExists(Sprawler_Firework.class)) 
    my_firework = new Sprawler_Firework(position, true, random(1, 2), true);
  else if (toggle==11 && !fireworkExists(Sprawler_Firework.class)) 
    my_firework = new Sprawler_Firework(position, true, random(1, 2), false);

  if (my_firework != null) {
    my_firework.ignite();
    my_fireworks.add(my_firework);
  }
}

boolean fireworkExists(Class my_class) {
  if (my_fireworks.size()==0)
    return false;
  for (int i=my_fireworks.size()-1; i>=0; i-- ) 
    if (my_fireworks.get(i).getClass().getName() == my_class.getName()) 
      return true;
  return false;
}

class DoubleDipper_Firework extends Firework {

  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = true;
  float const_max_climb = 180;
  PVector const_climb_velocity = new PVector(0, -.01);
  PVector const_climb_acceleration = new PVector(0, -.25);
  color const_firework_color = #FF9900;

  color const_tail_color = #999999;
  int const_tail_length = 200;  
  float const_tail_life = 4;  
  float const_tail_width = 2;

  int const_main_blast_formation = Explosion.UNIFORM_MUSHROOM_FORMATION;
  int const_child_blast_formation = Explosion.RANDOM_FORMATION;
  int const_main_blast_color = #AAAA00;
  int const_child_blasts_color = #DDDD00;
  float const_main_blast_particle_size = 3;
  float const_child_blasts_particle_size = 2;
  float const_main_blast_particle_life = .5;
  float const_child_blasts_particle_life = 2;
  int const_main_blast_volume = 8; 
  int const_child_blasts_volume = 4; 
  int const_main_blast_tail_length = 5;
  int const_child_blasts_tail_length = 10;
  float const_main_blast_magnitude = 2;
  float const_child_blasts_magnitude = 1;
  float const_main_blast_magnitude_reducer = 0;
  float const_child_blasts_magnitude_reducer = .01;

  Explosion main_explosion;
  ArrayList child_explosions;
  Particle tail_end;

  AudioPlayer blast_audio;
  AudioPlayer rocket_audio;

  DoubleDipper_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_blast) {
    super.construct(position, const_is_climber, const_climb_velocity, const_climb_acceleration, const_max_climb, pyro_size, const_blast_color, is_random_colored_blast);
    if (ignite)
      super.ignite();
    child_explosions = new ArrayList();
    tail_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);

    blast_audio = StarBang.minim.loadFile("DoubleDipperBlast2.wav");
    rocket_audio = StarBang.minim.loadFile("Rocket.wav");
  }

  public void update() {
    if (isReady() || isFinished())
      return;
    if (isClimbing()) {
      rocket_audio.play();
      if (position.y <= (start_position.y-max_climb) || climb_velocity.y >= 0)
        trigger();
      else {
        climb();
        tail_end.position.x = position.x;
        tail_end.position.y = position.y + 10;
        tail_end.update();
      }
    } 
    else if (isTriggered()) {
      rocket_audio.close();
      blast_audio.play();

      main_explosion = new Explosion(position, const_main_blast_magnitude*pyro_size, const_main_blast_magnitude_reducer, const_main_blast_formation, const_main_blast_volume, const_main_blast_color, 
      false, const_main_blast_particle_life, const_main_blast_particle_size, const_main_blast_tail_length);
      main_explosion.setCallBackMethod(this, "doubleDips", PVector.class);
      blast();
    }
    else if (isBlasting()) {
      tail_end.updateForDimout();
      if ((main_explosion !=null && !main_explosion.isFinished ()) || child_explosions.size()>0) { 
        if (main_explosion != null)
          main_explosion.update();
        for (int i=0; i<child_explosions.size();i++) {
          Explosion ce = (Explosion)child_explosions.get(i); 
          if (ce.isFinished())
            child_explosions.remove(i);
          else
            ce.update();
        }
      }      
      else {
        main_explosion = null;
        child_explosions = null;
        tail_end = null;
        blast_audio.close();
        finish();
      }
    }
  }

  public void display() {
    if (isClimbing()) {
      strokeWeight(const_width);
      stroke(const_firework_color);          
      line(position.x, position.y, position.x, position.y+const_height);
      tail_end.display();
    }
    else if (isBlasting()) {
      tail_end.display();
      if (main_explosion != null)
        main_explosion.display();
      for (int i=0; i<child_explosions.size();i++) {
        Explosion ce = (Explosion)child_explosions.get(i); 
        ce.display();
      }
    }
  }

  public void doubleDips(PVector position) {
    child_explosions.add(new Explosion(position, const_child_blasts_magnitude*pyro_size, const_child_blasts_magnitude_reducer, const_child_blast_formation, const_child_blasts_volume, 
    blast_color, is_random_colored_blast, const_child_blasts_particle_life, const_child_blasts_particle_size, const_child_blasts_tail_length));
  }
}

import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

class Explosion {
  Object call_back_object;
  Method call_back_method;

  public static final int RANDOM_FORMATION=0;
  public static final int UNIFORM_FORMATION=1;
  public static final int RANDOM_MUSHROOM_FORMATION=2;
  public static final int UNIFORM_MUSHROOM_FORMATION=3;
  public static final int RANDOM_UPWARDS_FORMATION=4;
  public static final int UNIFORM_UPWARDS_FORMATION=5;

  PVector const_particle_deceleration = new PVector(0.0, 0.0); //define a const of deceleration where x is air friction and y is gravity
  PVector const_particle_acceleration = new PVector(0.0, 0.0); 
  color const_blast_color = color(255, 255, 255); 

  PVector position, particle_deceleration, particle_acceleration;
  boolean is_random_colored_blast, is_finished;
  color blast_color;
  float particle_size, blast_magnitude, blast_magnitude_reducer, particle_life;
  int blast_volume, particle_tail_length, blast_formation;

  ArrayList particle_list = new ArrayList();

  Explosion() {
  };    

  Explosion(PVector position, float blast_magnitude, float blast_magnitude_reducer, int blast_formation, int blast_volume, color blast_color, boolean is_random_colored_blast, 
        float particle_life, float particle_size, int particle_tail_length) {
    this.position = position;
    this.blast_magnitude = blast_magnitude;
    this.blast_magnitude_reducer = blast_magnitude_reducer;
    this.blast_formation = blast_formation;
    this.blast_volume = blast_volume;
    this.blast_color = blast_color;
    this.is_random_colored_blast = is_random_colored_blast;
    this.particle_life = particle_life;
    this.particle_size = particle_size;
    this.particle_tail_length = particle_tail_length;
    this.is_finished = false;

    if (blast_formation == UNIFORM_FORMATION || blast_formation == UNIFORM_MUSHROOM_FORMATION || blast_formation == UNIFORM_UPWARDS_FORMATION) {
      int step, total=0, stop_angle =0;
      if (blast_formation == UNIFORM_FORMATION)
        total = -360;        
      else if (blast_formation == UNIFORM_MUSHROOM_FORMATION)
        total = -180;
      else if (blast_formation == UNIFORM_UPWARDS_FORMATION){
        total = -135;
        stop_angle = -45;
      }
      step = total/blast_volume;
      for (int angle = total; angle <= stop_angle; angle -= step) {
        if (is_random_colored_blast){
          blast_color = color(random(255), random(255), random(255));
        }
        PVector particle_velocity = new PVector(cos(angle*PI/180)*2, sin(angle*PI/180)*2);
        particle_velocity.normalize();
        particle_velocity.setMag(blast_magnitude);
        particle_list.add(new Particle(position, particle_velocity, blast_magnitude_reducer, particle_life, particle_size, particle_tail_length, blast_color));
      }
    } 
    else if (blast_formation == RANDOM_FORMATION || blast_formation == RANDOM_MUSHROOM_FORMATION || blast_formation == RANDOM_UPWARDS_FORMATION) {
      PVector particle_velocity = PVector.random2D();
      for (int i = 0; i < blast_volume; i ++) {
        if (is_random_colored_blast)
          blast_color = color(random(255), random(255), random(255));

        if (blast_formation == RANDOM_MUSHROOM_FORMATION)
          particle_velocity = new PVector(random(-1, 1), random(-1, 0));
        else if (blast_formation == RANDOM_UPWARDS_FORMATION)
          particle_velocity = new PVector(random(-.25, .25), random(-1, 0));
        else if (blast_formation == RANDOM_FORMATION)
          particle_velocity = PVector.random2D();  
                
        particle_velocity.normalize();
        particle_velocity.setMag(blast_magnitude);
        particle_list.add(new Particle(position, particle_velocity, blast_magnitude_reducer, particle_life, particle_size, particle_tail_length, blast_color));
      }
    }
    //background(50);
  }

  void setCallBackMethod(Object the_object, String method_name, Class... parametres) {
    call_back_object = the_object;

    try {
      call_back_method = call_back_object.getClass().getMethod(method_name, parametres);
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  void update() {
    for (int i = particle_list.size()-1; i>=0 ; i--) {
      Particle p = (Particle) particle_list.get(i);
      if (p !=null & !p.isFinished ()) {
        p.update();
    }
      else {

        try {
          call_back_method.invoke(call_back_object, p.position);
        } 
        catch (Exception e) {
          e.printStackTrace();
        }

        p = null;
        particle_list.remove(i);
      }
    }
    if (particle_list.size() == 0)
      is_finished = true;
  }

  void display() {
    for (int i = 0; i < particle_list.size(); i++) {
      Particle p = (Particle) particle_list.get(i);
      p.display();
    }
  }

  boolean isFinished() {
    return is_finished;
  }
}

class Firework {
  public static final int READY_STATE=0;
  public static final int CLIMBING_STATE=1;
  public static final int TRIGGER_STATE=2;
  public static final int BLASTING_STATE=3;
  public static final int FINISHED_STATE=4;

  public static final float SMALL_SIZE=0.5;
  public static final float NORMAL_SIZE=1;
  public static final float LARGE_SIZE=2;

  color const_blast_color = color(255, 255, 255);

  public boolean is_climber, is_random_colored_blast;
  public PVector start_position, position, climb_velocity, climb_acceleration;
  public float max_climb, pyro_size;
  public int state; 
  public color blast_color;

  Firework() {
  };

  Firework(PVector position, boolean is_climber, PVector climb_velocity, PVector climb_acceleration, 
  float max_climb, float pyro_size, color blast_color, boolean is_random_colored_blast) {
    this.start_position = position;
    this.position = new PVector(position.x, position.y);
    this.is_climber = is_climber;
    this.climb_velocity = climb_velocity;
    this.climb_acceleration = climb_acceleration;
    this.max_climb = max_climb - random(10);
    if (pyro_size != SMALL_SIZE && pyro_size != NORMAL_SIZE && pyro_size != LARGE_SIZE)
      pyro_size = NORMAL_SIZE;
    this.pyro_size = pyro_size; 
    this.blast_color = blast_color;
    this.is_random_colored_blast = is_random_colored_blast;
    this.state = READY_STATE;
  }
  void construct(PVector position, boolean is_climber, PVector climb_velocity, PVector climb_acceleration, 
  float max_climb, float pyro_size, color blast_color, boolean is_random_colored_blast) {
    this.start_position = position;
    this.position = new PVector(position.x, position.y);
    this.is_climber = is_climber;
    this.climb_velocity = climb_velocity;
    this.climb_acceleration = climb_acceleration;
    this.max_climb = max_climb - random(10);
    if (pyro_size != SMALL_SIZE && pyro_size != NORMAL_SIZE && pyro_size != LARGE_SIZE)
      pyro_size = NORMAL_SIZE;
    this.pyro_size = pyro_size; 
    this.blast_color = blast_color;
    this.is_random_colored_blast = is_random_colored_blast;
    this.state = READY_STATE;
  }

  void ignite() {
    if (is_climber)
      state = CLIMBING_STATE;
    else
      state = TRIGGER_STATE;
  }
  void trigger() {
    state = TRIGGER_STATE;
  }
  void blast() {
    state = BLASTING_STATE;
  }
  void finish() {
    state = FINISHED_STATE;
  }

  void climb() {
    if (!is_climber)
      return;
    climb_velocity.add(climb_acceleration);
    position.add(climb_velocity);
  }

  boolean isReady() {
    if (state == READY_STATE)
      return true;
    else 
      return false;
  }
  boolean isClimbing() {
    if (state == CLIMBING_STATE)
      return true;
    else 
      return false;
  }
  boolean isTriggered() {
    if (state == TRIGGER_STATE)
      return true;
    else 
      return false;
  }
  boolean isBlasting() {
    if (state == BLASTING_STATE)
      return true;
    else 
      return false;
  }
  boolean isFinished() {
    if (state == FINISHED_STATE) 
      return true;
    else 
      return false;
  }



  public void update() {
    println("placeholder for update in Parent Firework class");
  }
  public void display() {
    println("placeholder for display in Parent Firework class");
  }
}

class NestedGlobe_Firework extends Firework {
  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = true;
  float const_max_climb = 175;
  PVector const_climb_velocity = new PVector(0, -.01);
  PVector const_climb_acceleration = new PVector(0, -.25);
  color const_firework_color = #FF9900;

  color const_tail_color = #999999;
  int const_tail_length = 200;  
  float const_tail_life = 4;  
  float const_tail_width = 2;

  int const_main_blast_formation = Explosion.UNIFORM_FORMATION;
  int const_child_blasts_formation = Explosion.UNIFORM_FORMATION;
  int const_main_blast_color = #FFFFFF;
  int const_child_blast_color = #FFFFFF;
  float const_main_blast_particle_size = 2;
  float const_child_blast_particle_size = 3;
  float const_main_blast_particle_life = 2;
  float const_child_blast_particle_life = 2;
  int const_main_blast_volume = 20; 
  int const_child_blast_volume = 8; 
  int const_main_blast_tail_length = 10;
  int const_child_blast_tail_length = 20;
  float const_main_blast_magnitude = 3;
  float const_child_blast_magnitude = 4;
  float const_main_blast_magnitude_reducer = .25;
  float const_child_blast_magnitude_reducer = .1;
  float const_nested_trigger_wait = .15;

  Explosion main_explosion;
  Explosion child_explosion;
  Particle tail_end;

  float nested_trigger_wait;

  AudioPlayer main_blast_audio;
  AudioPlayer child_blast_audio;
  AudioPlayer rocket_audio;


  NestedGlobe_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_blast) {
    super.construct(position, const_is_climber, const_climb_velocity, const_climb_acceleration, const_max_climb, pyro_size, const_blast_color, is_random_colored_blast);
    if (ignite)
      super.ignite();
    tail_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);
    nested_trigger_wait = const_nested_trigger_wait*60;

    main_blast_audio = StarBang.minim.loadFile("LenientBlast.wav");
    child_blast_audio = StarBang.minim.loadFile("FatExplosion.wav");
    rocket_audio = StarBang.minim.loadFile("Rocket.wav");
  }

  public void update() {
    if (isReady() || isFinished())
      return;
    if (isClimbing()) {
        rocket_audio.play();
      if (position.y <= (start_position.y-max_climb) || climb_velocity.y >= 0)
        trigger();
      else {
        climb();
        tail_end.position.x = position.x;
        tail_end.position.y = position.y + 10;
        tail_end.update();
      }
    } 
    else if (isTriggered()) {
        rocket_audio.close();
        main_blast_audio.play();
      main_explosion = new Explosion(position, const_main_blast_magnitude*pyro_size, const_main_blast_magnitude_reducer, const_main_blast_formation, const_main_blast_volume, blast_color, 
      is_random_colored_blast, const_main_blast_particle_life, const_main_blast_particle_size, const_main_blast_tail_length);
      blast();
    }
    else if (isBlasting()) {
      tail_end.updateForDimout();
      nested_trigger_wait--;
      if (nested_trigger_wait <= 0 && nested_trigger_wait >= -1) {
        child_explosion = new Explosion(position, const_child_blast_magnitude*pyro_size, const_child_blast_magnitude_reducer, const_child_blasts_formation, const_child_blast_volume, 
        blast_color, is_random_colored_blast, const_child_blast_particle_life, const_child_blast_particle_size, const_child_blast_tail_length);
          child_blast_audio.play();
      }
      else if (nested_trigger_wait < 0 ) 
        nested_trigger_wait = -2;

      if ((main_explosion !=null && !main_explosion.isFinished ()) || (child_explosion !=null && !child_explosion.isFinished ())) { 
        if (main_explosion !=null && !main_explosion.isFinished ()) {
          main_explosion.update();
        }
        if (child_explosion !=null && !child_explosion.isFinished ()) {
          child_explosion.update();
        }
      }
      else {
        main_explosion = null;
        child_explosion = null;
        tail_end = null;
          main_blast_audio.close();
          child_blast_audio.close();
        finish();
      }
    }
  }

  public void display() {
    if (isClimbing()) {
      strokeWeight(const_width);
      stroke(const_firework_color);          
      line(position.x, position.y, position.x, position.y+const_height);
      tail_end.display();
    }
    else if (isBlasting()) {
      tail_end.display();
      if (main_explosion != null)
        main_explosion.display();
      if (child_explosion != null)
        child_explosion.display();
    }
  }
}

class Particle {
  float size, magnitude_reducer;
  PVector position, velocity;
  color particle_color;
  int life_in_frames, tail_length;
  ArrayList tail;
  PVector gravity = new PVector(0, 0.02);

  Particle(PVector position, PVector velocity, float magnitude_reducer, float life, float size, int tail_length, color particle_color) {
    this.position = new PVector(position.x, position.y);
    this.velocity = velocity;
    this.magnitude_reducer = magnitude_reducer;
    this.life_in_frames = (int)(life*60); 
    this.size = size;
    this.tail_length = tail_length;
    this.particle_color = particle_color;
    this.tail = new ArrayList();
  }

  void update() {
    //check if life has become zero and  which means its time is done obviously. 
    //the instanciating class will keep checking this flag (through is finished function) and kill this object when life is zero
    if (life_in_frames<=0)
      return; //do not bother with updating the profile of this particle if it has surpassed its life

    if (velocity.mag()>=1)
      velocity.setMag(velocity.mag()-magnitude_reducer);

    velocity.add(gravity); //apply deceleration to velocity
    position.add(velocity); // apply decelerated velocity to position

    tail.add(new PVector(position.x, position.y, 0)); //add a new point to the top of Tail array with the updated position and delete the last point in the array. this gives a trailing effect
    if (tail.size() > 0 && tail.size() > tail_length) //make sure that deleting the tail ends only starts when we have reached our max lenght for tail
      tail.remove(0);

    for (int i=0;i<2;i++) //start removing the tail when the particles tail length is as as long as its life. this will give a real effect of tail dimming out  
      if (tail.size() > 0 && tail_length > life_in_frames)
        tail.remove(0);

    life_in_frames--; //decrease life on every hop
  }

  void updateForDimout() {    
    if (tail.size() > 0) //make sure that deleting the tail ends only starts when we have reached our max lenght for tail
      tail.remove(0);

    if (life_in_frames>0)
      life_in_frames--; //decrease life on every hop
  }

  void display() {
    if (life_in_frames == 0)
      return;
    strokeWeight(size);

    for (int i = 0; i < tail.size(); i++) {
      PVector t = (PVector)tail.get(i);
      stroke(particle_color, map(i, 0, tail.size()-1, 0, 255));
      point(t.x, t.y);
    }
  }

  boolean isFinished() {
    if (life_in_frames == 0)
      return true;
    else
      return false;
  }

  PVector getPosition() {
    return position;
  }
}

class SkyDiver_Firework extends Firework {
  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = true;
  float const_max_climb = 250;
  PVector const_climb_velocity = new PVector(0, -.01);
  PVector const_climb_acceleration = new PVector(0, -.25);
  color const_firework_color = #FF9900;

  color const_tail_color = #999999;
  int const_tail_length = 200;  
  float const_tail_life = 4;  
  float const_tail_width = 2;

  int const_blast_formation = Explosion.UNIFORM_FORMATION;
  int const_blast_color = #FFFFFF;
  float const_blast_particle_size = 3;
  float const_blast_particle_life = 1.8;
  int const_blast_volume = 30; 
  int const_blast_tail_length = 20;
  float const_blast_magnitude = 3;
  float const_blast_magnitude_reducer = .05;

  Explosion main_explosion;
  Particle tail_end;

  AudioPlayer rocket_audio;
  AudioPlayer blast_audio;

  SkyDiver_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_blast) {
    super.construct(position, const_is_climber, const_climb_velocity, const_climb_acceleration, const_max_climb, pyro_size, const_blast_color, is_random_colored_blast);
    if (ignite)
      super.ignite();
    tail_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);

    blast_audio = StarBang.minim.loadFile("medium_distant_explosion.mp3");
    rocket_audio = StarBang.minim.loadFile("whistleRocket.wav");
  }

  public void update() {
    if (isReady() || isFinished())
      return;
    if (isClimbing()) {
      rocket_audio.play();      
      if (position.y <= (start_position.y-max_climb) || climb_velocity.y >= 0)
        trigger();
      else {
        climb();
        tail_end.position.x = position.x;
        tail_end.position.y = position.y + 10;
        tail_end.update();
      }
    } 
    else if (isTriggered()) {
      rocket_audio.close();
      blast_audio.play();

      main_explosion = new Explosion(position, const_blast_magnitude*pyro_size, const_blast_magnitude_reducer, const_blast_formation, const_blast_volume, blast_color, is_random_colored_blast, 
      const_blast_particle_life, const_blast_particle_size, const_blast_tail_length);
      blast();
    }
    else if (isBlasting()) {
      tail_end.updateForDimout();
      if (main_explosion !=null && !main_explosion.isFinished ()) { 
        main_explosion.update();
      }      
      else {
        main_explosion = null;
        tail_end = null;
        blast_audio.close();
        finish();
      }
    }
  }

  public void display() {
    if (isClimbing()) {
      strokeWeight(const_width);
      stroke(const_firework_color);          
      line(position.x, position.y, position.x, position.y+const_height);
      tail_end.display();
    }
    else if (isBlasting()) {
      tail_end.display();
      if (main_explosion != null)
        main_explosion.display();
    }
  }
}

class Sprawler_Firework extends Firework {
  AudioPlayer sparkle_audio;

  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = false;
  color const_firework_color = #FF9900;

  int const_max_sprawl_particles = 500;
  int const_sprawl_color = #FFFFFF;
  float const_sprawl_life = 5;
  float const_sprawl_spread = .025; //horizontal velocity limit
  float const_sprawl_magnitude_max = 2;
  float const_sprawl_magnitude_inc_factor = .25;
  float const_particle_size = 2;
  float const_particle_life = 3;
  int const_particle_tail_length = 10;
  float const_particle_spawn_speed = .01; //seconds

  float magnitude, frame_counter;

  ArrayList sprawl_particles;

  Sprawler_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_sprawl) {
    super.construct(position, const_is_climber, new PVector(0, 0), new PVector(0, 0), 0, pyro_size, const_sprawl_color, is_random_colored_sprawl);
    if (ignite)
      super.ignite();
    magnitude=0;
    frame_counter=0;    
    sprawl_particles = new ArrayList();

    sparkle_audio = StarBang.minim.loadFile("Sparckle.mp3");
  }

  public void update() {
    frame_counter++;
    if (magnitude<const_sprawl_magnitude_max)
      magnitude+=const_sprawl_magnitude_inc_factor;

    if (isReady() || isFinished())
      return;
    else if (isClimbing()) {
      trigger();
    } 
    else if (isTriggered() || isBlasting()) {
      sparkle_audio.play();

      if (!(frame_counter/60 >= const_sprawl_life)) { 
        if (sprawl_particles.size()<const_max_sprawl_particles) {
          PVector pvel = new PVector(random(-const_sprawl_spread, const_sprawl_spread), random(-1, -.1));
          pvel.normalize();
          pvel.setMag(magnitude);
          if (is_random_colored_blast)
            blast_color = color(random(255), random(255), random(255));
          sprawl_particles.add(new Particle(new PVector(position.x, position.y-const_height), pvel, 0, const_particle_life, const_particle_size, const_particle_tail_length, blast_color));
        }
        for (int i=0; i<sprawl_particles.size();i++) {
          Particle sp = (Particle)sprawl_particles.get(i); 
          if (sp.isFinished())
            sprawl_particles.remove(i);
          else
            sp.update();
        }
      }      
      else {
        sprawl_particles = null;
        sparkle_audio.close();
        finish();
      }
    }
  }

  public void display() {
    saveFrame("StarBang-####.png");
    if (!isBlasting()&&!isTriggered())
      return;

    strokeWeight(const_width);
    stroke(const_firework_color);          
    line(position.x, position.y, position.x, position.y-const_height);

    for (int i=0; i<sprawl_particles.size();i++) {
      Particle sp = (Particle)sprawl_particles.get(i); 
      sp.display();
    }
  }
}

class Twirler_Firework extends Firework {
  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = true;
  float const_max_climb = 200;
  PVector const_climb_velocity = new PVector(0, -.01);
  PVector const_climb_acceleration = new PVector(0, -.25);
  color const_firework_color = #FF9900;

  color const_tail_color = #999999;
  int const_tail_length = 200;  
  float const_tail_life = 4;  
  float const_tail_width = 2;

  int const_blast_formation = Explosion.UNIFORM_FORMATION;
  int const_blast_color = #FFFFFF;
  float const_blast_particle_size = 3;
  float const_blast_particle_life = 1.8;
  int const_blast_volume = 30; 
  int const_blast_tail_length = 10;
  float const_blast_magnitude = 3;
  float const_blast_magnitude_reducer = .08;

  float const_twirl_radius = 5.0;

  Explosion main_explosion;
  Particle tail_end;

  float original_x;
  float twirl_x=0.0;
  float sin_inc = TWO_PI/25.0;

  AudioPlayer rocket_audio;
  AudioPlayer blast_audio;

  Twirler_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_blast) {
    super.construct(position, const_is_climber, const_climb_velocity, const_climb_acceleration, const_max_climb, pyro_size, const_blast_color, is_random_colored_blast);
    if (ignite)
      super.ignite();
    tail_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);
    original_x=position.x;

    blast_audio = StarBang.minim.loadFile("FatExplosion.wav");
    rocket_audio = StarBang.minim.loadFile("Twirler.wav");
  }

  public void update() {
    if (isReady() || isFinished())
      return;
    if (isClimbing()) {
      rocket_audio.play();
      if (position.y <= (start_position.y-max_climb) || climb_velocity.y >= 0)
        trigger();
      else {
        position.x = original_x + sin(twirl_x)*const_twirl_radius;
        twirl_x += sin_inc;
        climb();
        tail_end.position.x = position.x;
        tail_end.position.y = position.y + 10;
        tail_end.update();
      }
    } 
    else if (isTriggered()) {
      rocket_audio.close();
      blast_audio.play();
      main_explosion = new Explosion(position, const_blast_magnitude*pyro_size, const_blast_magnitude_reducer, const_blast_formation, const_blast_volume, blast_color, is_random_colored_blast, 
      const_blast_particle_life, const_blast_particle_size, const_blast_tail_length);
      blast();
    }
    else if (isBlasting()) {
      tail_end.updateForDimout();
      if (main_explosion !=null && !main_explosion.isFinished ()) { 
        main_explosion.update();
      }      
      else {
        main_explosion = null;
        tail_end = null;
        blast_audio.close();
        finish();
      }
    }
  }

  public void display() {
    if (isClimbing()) {
      strokeWeight(const_width);
      stroke(const_firework_color);          
      float dir_x = map(original_x-position.x, -const_twirl_radius, const_twirl_radius, -2, 2);
      line(position.x+dir_x, position.y, position.x, position.y+const_height);

      tail_end.display();
    }
    else if (isBlasting()) {
      tail_end.display();
      if (main_explosion != null)
        main_explosion.display();
    }
  }
}

class Twister_Firework extends Firework {
  float const_width = 2;
  float const_height = 4;
  boolean const_is_climber = true;
  float const_max_climb = 200;
  PVector const_climb_velocity = new PVector(0, -.01);
  PVector const_climb_acceleration = new PVector(0, -.25);
  color const_firework_color = #FF9900;

  color const_tail_color = #999999;
  int const_tail_length = 200;  
  float const_tail_life = 4;  
  float const_tail_width = 2;

  int const_blast_formation = Explosion.UNIFORM_UPWARDS_FORMATION;
  int const_blast_color = #FFFFFF;
  float const_blast_particle_size = 3;
  float const_blast_particle_life = 3;
  int const_blast_volume = 20; 
  int const_blast_tail_length = 20;
  float const_blast_magnitude = 4;
  float const_blast_magnitude_reducer = .1;

  float const_twirl_radius = 5.0;

  Explosion main_explosion;
  Particle tail1_end;
  Particle tail2_end;
  float position_x_mirror;

  float original_x;
  float twirl_x=0.0;
  float sin_inc = TWO_PI/25.0;

  AudioPlayer rocket_audio;
  AudioPlayer blast_audio;


  Twister_Firework(PVector position, boolean ignite, float pyro_size, boolean is_random_colored_blast) {
    super.construct(position, const_is_climber, const_climb_velocity, const_climb_acceleration, const_max_climb, pyro_size, const_blast_color, is_random_colored_blast);
    if (ignite)
      super.ignite();
    tail1_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);
    tail2_end = new Particle(new PVector(position.x, position.y+10), const_climb_velocity, 0, const_tail_life, const_tail_width, const_tail_length, const_tail_color);
    original_x=position.x;
    position_x_mirror=position.x;

    blast_audio = StarBang.minim.loadFile("FatExplosion.wav");
    rocket_audio = StarBang.minim.loadFile("Twirler.wav");
  }

  public void update() {
    if (isReady() || isFinished())
      return;
    if (isClimbing()) {
      rocket_audio.play();
      if (position.y <= (start_position.y-max_climb) || climb_velocity.y >= 0)
        trigger();
      else {
        position.x = original_x + sin(twirl_x)*const_twirl_radius;
        twirl_x += sin_inc;
        if (position.x >= original_x)
          position_x_mirror = original_x - (position.x - original_x);
        else
          position_x_mirror = original_x + (original_x - position.x);

        climb();
        tail1_end.position.x = position.x;
        tail1_end.position.y = position.y + 10;
        tail1_end.update();
        tail2_end.position.x = position_x_mirror;
        tail2_end.position.y = position.y + 10;
        tail2_end.update();
      }
    } 
    else if (isTriggered()) {
      rocket_audio.close();
      blast_audio.play();

      main_explosion = new Explosion(position, const_blast_magnitude*pyro_size, const_blast_magnitude_reducer, const_blast_formation, const_blast_volume, blast_color, is_random_colored_blast, 
      const_blast_particle_life, const_blast_particle_size, const_blast_tail_length);
      blast();
    }
    else if (isBlasting()) {
      tail1_end.updateForDimout();
      tail2_end.updateForDimout();
      if (main_explosion !=null && !main_explosion.isFinished ()) { 
        main_explosion.update();
      }      
      else {
        main_explosion = null;
        tail1_end = null;
        tail2_end = null;
        blast_audio.close();
        finish();
      }
    }
  }

  public void display() {
    if (isClimbing()) {
      strokeWeight(const_width);
      stroke(const_firework_color);          
      float dir_x = map(original_x-position.x, -const_twirl_radius, const_twirl_radius, -2, 2);
      line(position.x+dir_x, position.y, position.x, position.y+const_height);
      line(position_x_mirror-dir_x, position.y, position_x_mirror, position.y+const_height);

      tail1_end.display();
      tail2_end.display();
    }
    else if (isBlasting()) {
      tail1_end.display();
      tail2_end.display();
      if (main_explosion != null)
        main_explosion.display();
    }
  }
}



