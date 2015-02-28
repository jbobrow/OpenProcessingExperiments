
particle [] particles;


void setup() {
  size(400,400);
  background(0);

  
  particles = new particle[2000]; 
  
  for(int i = 0; i < particles.length; i++){
    particles[i] = new particle();
  }
}

void draw() {  
   
  for(int i = 0; i < particles.length; i++){
    particles[i].render();
    particles[i].step();
  }
}




class particle {
  float x,y;

  particle() {
    x = width/2;
    y = height/2;

  }

  void render() {
    fill(random(255), random(255), random(255));
    noStroke();
    rect(x,y,4,4);
  }

  
 void step() {
    
    float r = random(1);
  
    if (r < 0.25) {    
      x = x + 5;
    } else if (r < 0.50) {
      x = x - 5;
    } else if (r < 0.75) {
      y = y + 5;
    } else if (r > 0.75){
      y = y- 5; 
    }
  
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
}


