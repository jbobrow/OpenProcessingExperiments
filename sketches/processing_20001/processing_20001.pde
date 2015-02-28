
public class Particle{
  PVector pos;
  boolean stopMoving = false;
  public Particle(PVector _pos){
    pos = _pos;
  }
  
  void update(){
    boolean particleClose = false;
    for(int i = 0; i < particles.length; i++){
      if(dist(pos.x, pos.y, particles[i].pos.x, particles[i].pos.y) < 15){
        switch(round(particles[i].pos.y - pos.y)){
          case 30:
            pos.y += 10;
            particleClose = true;
            break;
          case -30:
            pos.y -= 10;
            particleClose = true;
            break;
          case 20:
            pos.y += 10;
            particleClose = true;
            break;
          case -20:
            pos.y -= 10;
            particleClose = true;
            break;
          case 10:
            stopMoving = true;
            particleClose = true;
            break;
          case -10:
            stopMoving = true;
            particleClose = true;

        }
        switch(round(particles[i].pos.x - pos.x)){
          case 30:
            pos.x += 10;
            particleClose = true;
            break;
          case -30:
            pos.x -= 10;
            particleClose = true;
            break;
          case 20:
            pos.x += 10;
            particleClose = true;
            break;
          case -20:
            pos.x -= 10;
            particleClose = true;
            break;
          case 10:
            stopMoving = true;
            particleClose = true;
            break;
          case -10:
            stopMoving = true;
            particleClose = true;
            break;
        }
      }
    }

  if(particleClose == false){
    int dir = round(random(0,8));
      switch(dir){
        case 0:
          pos.y -= 10;
          break;
        case 1:
          pos.y -= 10;
          pos.x += 10;
          break;
        case 2:
          pos.x += 10;
          break;
        case 3:
          pos.x += 10;
          pos.y -= 10;
          break;
        case 4:
          pos.y += 10;
          break;
        case 5:
          pos.y += 10;
          pos.x -= 10;
          break;
        case 6:
          pos.x -= 10;
          break;
        case 7:
          pos.x -= 10;
          pos.y -= 10;
          break;
      }
    }
  }
  
  void draw(){    
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(pos.x, pos.y, 10, 10);
  }
  
}

