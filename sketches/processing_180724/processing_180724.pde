

ArrayList<Particle> particulas;
void setup(){
  size(500,500);
  particulas = new ArrayList<Particle>();
  noStroke();
  background(0);
}


void draw(){
  
  
  for(int i=0;i<particulas.size();i++){
    Particle p = particulas.get(i);
    
    p.update();
    p.draw();
    if(p.remove){
     // particulas.remove(i);
    }
  }
}

void mouseDragged(){
  particulas.add(new Particle(mouseX,mouseY));
}
void mousePressed(){
  particulas.add(new Particle(mouseX,mouseY));
}
void keyPressed(){
  if(key=" ")
    background(0);
    particulas.clear();
}

class Particle{
  boolean remove=false;
  int x,y;
  float offX,offY;
  float nx,ny;
  int c;
  Particle(int x,int y){
    this.x=x;
    this.y=y;
    ny = random(0,1000);
    nx = random(0,1000);
  }
  
  void update(){
    offX = (noise(nx+=10)*10)-4.5;
    offY = (noise(ny+=5)*10)-4.5;
    c = color(x,y,x+y);
    x+=offX;
    y+=offY;
  }
  
  void draw(){
    fill(c,50);
    ellipse(x,y,9,9);
  }
  
  void remove(){
    if(x<0 || x>width || y<0 || y>height){
      remove = true;
    } 
}}



