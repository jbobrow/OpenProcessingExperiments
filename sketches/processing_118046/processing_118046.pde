
Particle my_particle;

Particle[] particle_list;
int particle_number = 100;

void setup(){
  size(1200,600);
  noStroke();
  frameRate(60);
  smooth();
  background(255);
}

void draw(){
  background(255);
//  if (my_particle != null){
//  my_particle.existing();
//  }

  if (particle_list != null){
   for(int i=0; i<particle_number; i++){
     particle_list[i].existing();
   }
  }
}

void mousePressed(){
//  my_particle = new Particle();
  
  particle_list = new Particle[particle_number];
  for (int i = 0; i < particle_number; i++){
    particle_list[i] = new Particle();
  }
}

public class Particle {
float x,y;
float velocity_x, velocity_y;
float acc_x, acc_y;
float redcolour, greencolour, bluecolour;
float size;

  public Particle(){
    x = mouseX;
    y = mouseY;
    velocity_x = random(-5,5);     
    velocity_y = random(-5,5);
    acc_x = random(-0.3, 0.3);
    acc_y = random(-0.3, 0.3);
    redcolour = random(160);
    greencolour = random(100);
    bluecolour = random(155);
    size = 0.4;
  }
  
  public void existing(){
    velocity_x += acc_x;
    velocity_y += acc_y;
    
    x += velocity_x;
    y += velocity_y; 
    
 fill(redcolour,greencolour,bluecolour);
    
    ellipse(x,y,10,10);
  }
}
