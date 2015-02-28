
int N = 1300;
color palette[] = new color[255];
Particle particles[] = new Particle[N];

void setup(){
  size(400,400);
  colorMode(HSB, 255);
  fill(255);
  
  createPalette();
  createParticles();
}

void draw(){
  for(int i=0; i<height; i++){
      stroke(palette[int(map(i,0,height,0,255))]);
      line(0,i,width,i);
  }
  
  
  for(int j=0; j<N; j++){
      particles[j].draw();
      particles[j].move();
  }
}

void createParticles(){
    for(int i=0; i<N; i++){
        particles[i] = new Particle(random(width), random(height), int(random(100)));
    }
}

void createPalette(){
    for(int i=0; i<255; i++){
        palette[i] = color((255-i)/20+140,255,255);
    }
}

class Particle{
    float x;
    float y;
    int s;
    
     Particle(float _x, float _y,  int _s){
        x = _x;
        y = _y;
        s = _s;
    }
    
    void move(){
        x += random(6);
        y += random(5) - 2;
        
        if(x<0) x = width;
        if(x>width) x = 0;
        if(y<0) y = height;
        if(y>height) y = 0;
    }
    
   void draw(){
        fill(255,15);
        noStroke();
        ellipse(x,y,s,s);
    }
}

