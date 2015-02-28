
import ddf.minim.*;

Minim minim;
AudioPlayer player;

Particle my_particle;

Particle[] particle_list;
int particle_number = 200;

void setup(){
  size(1200,600, P3D);
  noStroke();
  frameRate(60);
  smooth();
  background(0);
   minim = new Minim(this);
   player = minim.loadFile("all_caps.mp3");
}

void draw(){
  background(255);
  strokeWeight(5);

  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
      stroke(random(255),random(255),random(255));
    float x1 = map( i, 0, player.bufferSize(), 40, width-50 );
    float x2 = map( i+1, 0, player.bufferSize(), 40, width-50 );
    line( x1, 450 + player.left.get(i)*50, x2, 450 + player.left.get(i+1)*200 );
//    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
  
  
//  if (my_particle != null){
//  my_particle.existing();
//  }

  noStroke();
    if (particle_list != null){
     for(int i=0; i<particle_number; i++){
       particle_list[i].existing();
     }
  }
}

void mousePressed(){
  player.play();
  
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
float circlealpha;

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
    size = 2;
    circlealpha = random(100,255);
  }
  
  public void existing(){
    velocity_x += acc_x;
    velocity_y += acc_y;
    
    x += velocity_x;
    y += velocity_y; 
    
    circlealpha -=0.4;
    
 fill(redcolour,greencolour,bluecolour,circlealpha);
    
    size +=0.4;
    rect(x,y,size,size);
  }
}
