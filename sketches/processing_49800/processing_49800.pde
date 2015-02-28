
ArrayList<Particle> particles;

void setup(){
  size(900,450);
  background(0);
  
  particles = new ArrayList();
}
void draw(){
  background(0);

  for(Particle b : particles){
    b.draw();
  }
  
  particles.add(new Particle(width/2,height/2));
  
  for(int i=0;i<particles.size();i++){
    if(particles.get(i).isDead()){
      particles.remove(i);
    }
  }
}

class Particle{
  float r = 1.5;
  float x = random(width / 2 - 10,width / 2 + 10);
  float y = random(height / 2 - 10,width / 2 + 10);
  float vel_x = random(-2,2);
  float vel_y = random(-2,2);
  
  Particle(float xpos, float ypos){
    x = xpos;
    y = ypos;
    float theta = random(0,TWO_PI);
  }
  
  void update(){
    x += vel_x;
    y += vel_y;
  }
  
  void draw(){
    update();
    
    noStroke();
    fill(255);
    ellipse(x,y,r,r);
  }
  
  boolean isDead(){
    return((x * y< 0)||(x > width)||(y > height));
  }
}                
                                
